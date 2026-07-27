@tool
class_name ZinaraChecks
extends RefCounted
# Structural check vocabulary v1.
# Each check returns { ok: bool, label: String }.
# Paths in the manifest are relative to the edited scene root,
# e.g. "Main/StatusLabel" where "Main" is the root node's name.


static func run(check: Dictionary, root: Node) -> Dictionary:
	var kind: String = check.get("assert", "")
	match kind:
		"node_exists":
			return _node_exists(check, root)
		"node_class":
			return _node_class(check, root)
		"script_attached":
			return _script_attached(check, root)
		"property_equals":
			return _property_equals(check, root)
		"signal_connected":
			return _signal_connected(check, root)
		_:
			return {"ok": false, "label": "Unknown check type: %s" % kind}


static func _resolve(path: String, root: Node) -> Node:
	if root == null:
		return null
	# Allow "RootName/Child/GrandChild" or just "RootName".
	var parts := path.split("/", false)
	if parts.is_empty():
		return null
	if parts[0] != root.name:
		return null
	if parts.size() == 1:
		return root
	return root.get_node_or_null("/".join(parts.slice(1)))


static func _node_exists(check: Dictionary, root: Node) -> Dictionary:
	var path: String = check.get("path", "")
	var node := _resolve(path, root)
	return {
		"ok": node != null,
		"label": 'Node "%s" exists' % path,
	}


static func _node_class(check: Dictionary, root: Node) -> Dictionary:
	var path: String = check.get("path", "")
	var wanted: String = check.get("class", "")
	var node := _resolve(path, root)
	var ok := node != null and node.is_class(wanted)
	return {
		"ok": ok,
		"label": '"%s" is a %s' % [path, wanted],
	}


static func _script_attached(check: Dictionary, root: Node) -> Dictionary:
	var path: String = check.get("path", "")
	var wanted: String = check.get("script", "")
	var node := _resolve(path, root)
	var ok := false
	if node != null and node.get_script() != null:
		var res_path: String = node.get_script().resource_path
		ok = res_path.get_file() == wanted or res_path == wanted
	return {
		"ok": ok,
		"label": '"%s" has script %s' % [path, wanted],
	}


static func _property_equals(check: Dictionary, root: Node) -> Dictionary:
	var path: String = check.get("path", "")
	var prop: String = check.get("property", "")
	var expected = check.get("value")
	var node := _resolve(path, root)
	var ok := false
	if node != null:
		var actual = node.get(prop)
		ok = str(actual) == str(expected)
	return {
		"ok": ok,
		"label": '"%s".%s == %s' % [path, prop, str(expected)],
	}


static func _signal_connected(check: Dictionary, root: Node) -> Dictionary:
	var from_path: String = check.get("from", "")
	var sig: String = check.get("signal", "")
	var to_path: String = check.get("to", "")
	var from_node := _resolve(from_path, root)
	var to_node := _resolve(to_path, root)
	var ok := false
	if from_node != null and to_node != null and from_node.has_signal(sig):
		for conn in from_node.get_signal_connection_list(sig):
			var callable: Callable = conn.get("callable")
			if callable.get_object() == to_node:
				ok = true
				break
	return {
		"ok": ok,
		"label": '%s.%s → %s connected' % [from_path, sig, to_path],
	}
