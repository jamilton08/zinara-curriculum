@tool
class_name ZinaraProgress
extends RefCounted
# Local progress store. Lives in user://zinara_progress.json.
# Shape:
# {
#   "student": "brave-otter-41",
#   "lessons": {
#     "m1.l2": { "content_version": 1, "items": { "v1": "done", "a1": "done", "a4": "pending_review" } }
#   }
# }
# Item states: "done" | "failed" | "pending_review"

const PATH := "user://zinara_progress.json"


static func load_data() -> Dictionary:
	if not FileAccess.file_exists(PATH):
		return {"student": "", "lessons": {}}
	var f := FileAccess.open(PATH, FileAccess.READ)
	var parsed = JSON.parse_string(f.get_as_text())
	if typeof(parsed) != TYPE_DICTIONARY:
		return {"student": "", "lessons": {}}
	return parsed


static func save_data(data: Dictionary) -> void:
	var f := FileAccess.open(PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(data, "  "))


static func set_student(id: String) -> void:
	var data := load_data()
	data["student"] = id
	save_data(data)


static func get_student() -> String:
	return load_data().get("student", "")


static func mark_item(lesson_id: String, content_version: int, item_id: String, state: String) -> void:
	var data := load_data()
	var lessons: Dictionary = data.get("lessons", {})
	var lesson: Dictionary = lessons.get(lesson_id, {"content_version": content_version, "items": {}})
	lesson["content_version"] = content_version
	lesson["items"][item_id] = state
	lessons[lesson_id] = lesson
	data["lessons"] = lessons
	save_data(data)


static func item_state(lesson_id: String, item_id: String) -> String:
	var data := load_data()
	return data.get("lessons", {}).get(lesson_id, {}).get("items", {}).get(item_id, "")
