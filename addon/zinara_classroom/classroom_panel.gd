@tool
extends Control
# Zinara Classroom main-screen panel.
# Reads res://manifest.json and renders the whole lesson:
# videos, multiple choice, written responses, live structural checks,
# and a headless test-case runner. Progress is stored per student ID.

const Checks := preload("res://addons/zinara_classroom/checks.gd")
const Progress := preload("res://addons/zinara_classroom/progress.gd")

var editor_interface: EditorInterface

var manifest: Dictionary = {}
var lesson_id: String = ""
var content_version: int = 1

# UI refs rebuilt on load
var progress_bar: ProgressBar
var progress_label: Label
var check_rows: Array = []      # [{check: Dictionary, icon: Label, item_id: String}]
var mc_states: Dictionary = {}  # item_id -> {group: ButtonGroup, answer: int, feedback: Label}
var test_output: RichTextLabel

var _check_timer: float = 0.0


func _ready() -> void:
	set_anchors_preset(Control.PRESET_FULL_RECT)
	_load_manifest()
	_build_ui()


func _process(delta: float) -> void:
	if not visible or check_rows.is_empty():
		return
	_check_timer += delta
	if _check_timer >= 1.0:
		_check_timer = 0.0
		_refresh_structural_checks()


# ---------------------------------------------------------------- manifest

func _load_manifest() -> void:
	manifest = {}
	if not FileAccess.file_exists("res://manifest.json"):
		return
	var f := FileAccess.open("res://manifest.json", FileAccess.READ)
	var parsed = JSON.parse_string(f.get_as_text())
	if typeof(parsed) == TYPE_DICTIONARY:
		manifest = parsed
		lesson_id = manifest.get("id", "unknown")
		content_version = int(manifest.get("content_version", 1))


# ---------------------------------------------------------------- UI build

func _build_ui() -> void:
	for child in get_children():
		child.queue_free()
	check_rows.clear()
	mc_states.clear()

	var scroll := ScrollContainer.new()
	scroll.set_anchors_preset(Control.PRESET_FULL_RECT)
	add_child(scroll)

	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 24)
	margin.add_theme_constant_override("margin_right", 24)
	margin.add_theme_constant_override("margin_top", 16)
	margin.add_theme_constant_override("margin_bottom", 24)
	margin.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.add_child(margin)

	var root := VBoxContainer.new()
	root.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	root.add_theme_constant_override("separation", 12)
	margin.add_child(root)

	if manifest.is_empty():
		var err := Label.new()
		err.text = "No manifest.json found in this project. Open a lesson project."
		root.add_child(err)
		return

	_build_header(root)
	_build_student_row(root)
	_build_progress(root)
	root.add_child(HSeparator.new())

	for item in manifest.get("content", []):
		_build_content_item(root, item)

	for item in manifest.get("assessments", []):
		root.add_child(HSeparator.new())
		match item.get("type", ""):
			"mc":
				_build_mc(root, item)
			"written":
				_build_written(root, item)
			"in_editor":
				_build_in_editor(root, item)
			"code":
				_build_code(root, item)

	_refresh_progress()


func _build_header(root: VBoxContainer) -> void:
	var title := Label.new()
	title.text = "%s  —  %s" % [lesson_id, manifest.get("title", "")]
	title.add_theme_font_size_override("font_size", 24)
	root.add_child(title)

	var thesis := Label.new()
	thesis.text = "Decision of the day: " + manifest.get("thesis", "")
	thesis.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	thesis.modulate = Color(1, 1, 1, 0.7)
	root.add_child(thesis)


func _build_student_row(root: VBoxContainer) -> void:
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	root.add_child(row)

	var lbl := Label.new()
	lbl.text = "Student ID:"
	row.add_child(lbl)

	var field := LineEdit.new()
	field.text = Progress.get_student()
	field.placeholder_text = "e.g. brave-otter-41"
	field.custom_minimum_size = Vector2(220, 0)
	field.text_submitted.connect(func(t): Progress.set_student(t.strip_edges()))
	field.focus_exited.connect(func(): Progress.set_student(field.text.strip_edges()))
	row.add_child(field)


func _build_progress(root: VBoxContainer) -> void:
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	root.add_child(row)

	progress_bar = ProgressBar.new()
	progress_bar.custom_minimum_size = Vector2(280, 0)
	progress_bar.max_value = 100
	row.add_child(progress_bar)

	progress_label = Label.new()
	row.add_child(progress_label)


func _build_content_item(root: VBoxContainer, item: Dictionary) -> void:
	match item.get("type", ""):
		"video":
			var row := HBoxContainer.new()
			row.add_theme_constant_override("separation", 8)
			root.add_child(row)

			var btn := Button.new()
			btn.text = "▶  Watch: %s (%s min)" % [item.get("title", "video"), str(item.get("minutes", "?"))]
			var src: String = item.get("src", "")
			var item_id: String = item.get("id", "")
			btn.pressed.connect(func():
				OS.shell_open(src)
				Progress.mark_item(lesson_id, content_version, item_id, "done")
				_refresh_progress()
			)
			row.add_child(btn)
			_add_state_icon(row, item_id)
		"text":
			var lbl := RichTextLabel.new()
			lbl.bbcode_enabled = true
			lbl.fit_content = true
			lbl.size_flags_horizontal = Control.SIZE_EXPAND_FILL
			var src: String = item.get("src", "")
			if FileAccess.file_exists(src):
				lbl.text = FileAccess.open(src, FileAccess.READ).get_as_text()
			else:
				lbl.text = item.get("text", "")
			root.add_child(lbl)


func _build_mc(root: VBoxContainer, item: Dictionary) -> void:
	var item_id: String = item.get("id", "")
	_section_title(root, "☑  " + item.get("title", "Question"), item_id)

	var q := Label.new()
	q.text = item.get("question", "")
	q.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(q)

	var group := ButtonGroup.new()
	var choices: Array = item.get("choices", [])
	var order := range(choices.size())
	if item.get("shuffle", false):
		order.shuffle()

	var boxes: Array = []
	for idx in order:
		var cb := CheckBox.new()
		cb.text = str(choices[idx])
		cb.button_group = group
		cb.set_meta("choice_index", idx)
		root.add_child(cb)
		boxes.append(cb)

	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	root.add_child(row)

	var submit := Button.new()
	submit.text = "Submit answer"
	row.add_child(submit)

	var feedback := Label.new()
	row.add_child(feedback)

	var answer := int(item.get("answer", -1))
	submit.pressed.connect(func():
		var pressed := group.get_pressed_button()
		if pressed == null:
			feedback.text = "Pick an answer first."
			return
		if int(pressed.get_meta("choice_index")) == answer:
			feedback.text = "✔ Correct!"
			feedback.modulate = Color(0.4, 1.0, 0.4)
			Progress.mark_item(lesson_id, content_version, item_id, "done")
		else:
			feedback.text = "✘ Not quite — rewatch the video and try again."
			feedback.modulate = Color(1.0, 0.5, 0.4)
			Progress.mark_item(lesson_id, content_version, item_id, "failed")
		_refresh_progress()
	)


func _build_written(root: VBoxContainer, item: Dictionary) -> void:
	var item_id: String = item.get("id", "")
	_section_title(root, "✍  " + item.get("title", "Written response"), item_id)

	var prompt := Label.new()
	prompt.text = item.get("prompt", "")
	prompt.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	root.add_child(prompt)

	var editor := TextEdit.new()
	editor.custom_minimum_size = Vector2(0, 160)
	editor.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	editor.placeholder_text = "Write your answer here..."
	# Restore a saved draft if present.
	var draft_path := "user://zinara_written_%s_%s.txt" % [lesson_id.replace(".", "_"), item_id]
	if FileAccess.file_exists(draft_path):
		editor.text = FileAccess.open(draft_path, FileAccess.READ).get_as_text()
	root.add_child(editor)

	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	root.add_child(row)

	var count_label := Label.new()
	var min_words := int(item.get("min_words", 0))
	var update_count := func():
		var words := editor.text.strip_edges().split(" ", false)
		var n := 0
		for w in words:
			if w.strip_edges() != "":
				n += 1
		count_label.text = "%d / %d words" % [n, min_words]
		return n
	editor.text_changed.connect(func(): update_count.call())
	update_count.call()

	var save := Button.new()
	save.text = "Save & submit for review"
	save.pressed.connect(func():
		var f := FileAccess.open(draft_path, FileAccess.WRITE)
		f.store_string(editor.text)
		var n: int = update_count.call()
		if n >= min_words:
			Progress.mark_item(lesson_id, content_version, item_id, "pending_review")
			count_label.text += "  — submitted, pending teacher review"
		else:
			count_label.text += "  — saved, but needs %d more words" % (min_words - n)
		_refresh_progress()
	)
	row.add_child(save)
	row.add_child(count_label)


func _build_in_editor(root: VBoxContainer, item: Dictionary) -> void:
	var item_id: String = item.get("id", "")
	_section_title(root, "🛠  " + item.get("title", "In-editor task") + "  (live)", item_id)

	for check in item.get("checks", []):
		var row := HBoxContainer.new()
		row.add_theme_constant_override("separation", 8)
		root.add_child(row)

		var icon := Label.new()
		icon.text = "…"
		icon.custom_minimum_size = Vector2(24, 0)
		row.add_child(icon)

		var lbl := Label.new()
		lbl.text = str(check.get("assert", "")) + "  —  waiting for scene"
		row.add_child(lbl)

		check_rows.append({"check": check, "icon": icon, "label": lbl, "item_id": item_id})


func _build_code(root: VBoxContainer, item: Dictionary) -> void:
	var item_id: String = item.get("id", "")
	_section_title(root, "⚙  " + item.get("title", "Code tests"), item_id)

	var run := Button.new()
	run.text = "Run test cases"
	root.add_child(run)

	test_output = RichTextLabel.new()
	test_output.bbcode_enabled = true
	test_output.fit_content = true
	test_output.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	root.add_child(test_output)

	var entry: String = item.get("entry", "")
	var timeout := int(item.get("timeout_sec", 20))
	run.pressed.connect(func(): _run_tests(item_id, entry, timeout))


func _section_title(root: VBoxContainer, text: String, item_id: String) -> void:
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 8)
	root.add_child(row)
	var lbl := Label.new()
	lbl.text = text
	lbl.add_theme_font_size_override("font_size", 18)
	row.add_child(lbl)
	_add_state_icon(row, item_id)


func _add_state_icon(row: HBoxContainer, item_id: String) -> void:
	var icon := Label.new()
	icon.set_meta("state_for", item_id)
	row.add_child(icon)


# ---------------------------------------------------------------- live checks

func _refresh_structural_checks() -> void:
	if editor_interface == null:
		return
	var scene_root := editor_interface.get_edited_scene_root()
	var by_item: Dictionary = {}
	for entry in check_rows:
		var result: Dictionary = Checks.run(entry["check"], scene_root)
		entry["icon"].text = "✔" if result["ok"] else "✘"
		entry["icon"].modulate = Color(0.4, 1.0, 0.4) if result["ok"] else Color(1.0, 0.5, 0.4)
		entry["label"].text = result["label"]
		var item_id: String = entry["item_id"]
		by_item[item_id] = by_item.get(item_id, true) and result["ok"]
	for item_id in by_item:
		var prev := Progress.item_state(lesson_id, item_id)
		var new_state: String = "done" if by_item[item_id] else "failed"
		if prev != new_state:
			Progress.mark_item(lesson_id, content_version, item_id, new_state)
			_refresh_progress()


# ---------------------------------------------------------------- test runner

func _run_tests(item_id: String, entry: String, timeout_sec: int) -> void:
	test_output.text = "Running tests headless..."
	var project_path := ProjectSettings.globalize_path("res://")
	var args := PackedStringArray(["--headless", "--path", project_path, entry])
	var output: Array = []
	var code := OS.execute(OS.get_executable_path(), args, output, true)

	var verdict := {}
	for chunk in output:
		for line in str(chunk).split("\n"):
			if line.begins_with("ZINARA_RESULT:"):
				var parsed = JSON.parse_string(line.trim_prefix("ZINARA_RESULT:"))
				if typeof(parsed) == TYPE_DICTIONARY:
					verdict = parsed

	if verdict.is_empty():
		test_output.text = "[color=orange]Could not read a test verdict (exit code %d). Check the Output panel.[/color]" % code
		return

	var lines: Array[String] = []
	for name in verdict.get("passed", []):
		lines.append("[color=green]✔ %s[/color]" % name)
	for failure in verdict.get("failed", []):
		lines.append("[color=red]✘ %s[/color]" % failure.get("name", "?"))
		var hint: String = failure.get("hint", "")
		if hint != "":
			lines.append("    [color=gray]hint: %s[/color]" % hint)
	test_output.text = "\n".join(lines)

	var all_passed: bool = verdict.get("failed", []).is_empty() and not verdict.get("passed", []).is_empty()
	Progress.mark_item(lesson_id, content_version, item_id, "done" if all_passed else "failed")
	_refresh_progress()


# ---------------------------------------------------------------- progress

func _refresh_progress() -> void:
	if progress_bar == null:
		return
	var required: Array = manifest.get("completion", {}).get("required", [])
	if required.is_empty():
		progress_bar.value = 0
		progress_label.text = ""
		return
	var done := 0
	for item_id in required:
		var state := Progress.item_state(lesson_id, item_id)
		if state == "done" or state == "pending_review":
			done += 1
	progress_bar.value = 100.0 * done / required.size()
	progress_label.text = "%d / %d required items" % [done, required.size()]
	# Update the little per-section state icons.
	_update_state_icons(self)


func _update_state_icons(node: Node) -> void:
	for child in node.get_children():
		if child is Label and child.has_meta("state_for"):
			var state := Progress.item_state(lesson_id, child.get_meta("state_for"))
			match state:
				"done":
					child.text = "✔ done"
					child.modulate = Color(0.4, 1.0, 0.4)
				"pending_review":
					child.text = "⏳ pending review"
					child.modulate = Color(1.0, 0.85, 0.4)
				"failed":
					child.text = "✘"
					child.modulate = Color(1.0, 0.5, 0.4)
				_:
					child.text = ""
		_update_state_icons(child)
