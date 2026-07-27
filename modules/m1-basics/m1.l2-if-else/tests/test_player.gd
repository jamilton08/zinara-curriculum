extends Node
# Headless test runner for Lesson 1.2.
# Prints one line: ZINARA_RESULT:{json} then quits.


func _ready() -> void:
	var results := {"passed": [], "failed": []}

	var script = load("res://player.gd")
	if script == null:
		results["failed"].append({
			"name": "player_script_loads",
			"hint": "player.gd is missing or has a syntax error — check the Script editor for red lines."
		})
		_finish(results)
		return

	var inst := Node2D.new()
	inst.set_script(script)

	if not inst.has_method("check_number"):
		results["failed"].append({
			"name": "check_number_exists",
			"hint": "player.gd needs a function named check_number(n) — did you rename or delete it?"
		})
		_finish(results)
		return

	_case(results, "positive_numbers", inst.check_number(5) == "positive",
		'check_number(5) should return "positive" — is your first condition checking n > 0?')
	_case(results, "negative_numbers", inst.check_number(-3) == "negative",
		'check_number(-3) should return "negative" — what happens when n is less than 0?')
	_case(results, "zero_is_special", inst.check_number(0) == "zero",
		'check_number(0) should return "zero" — zero is neither positive nor negative. Does one of your branches catch it?')

	inst.free()
	_finish(results)


func _case(results: Dictionary, name: String, ok: bool, hint: String) -> void:
	if ok:
		results["passed"].append(name)
	else:
		results["failed"].append({"name": name, "hint": hint})


func _finish(results: Dictionary) -> void:
	print("ZINARA_RESULT:" + JSON.stringify(results))
	get_tree().quit()
