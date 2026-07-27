@tool
extends EditorPlugin
# Zinara Classroom — main screen plugin.
# Adds a "Classroom" tab next to 2D / 3D / Script.

const PanelScript := preload("res://addons/zinara_classroom/classroom_panel.gd")

var panel: Control


func _enter_tree() -> void:
	panel = PanelScript.new()
	panel.editor_interface = get_editor_interface()
	get_editor_interface().get_editor_main_screen().add_child(panel)
	panel.visible = false


func _exit_tree() -> void:
	if panel:
		panel.queue_free()
		panel = null


func _has_main_screen() -> bool:
	return true


func _get_plugin_name() -> String:
	return "Classroom"


func _get_plugin_icon() -> Texture2D:
	return get_editor_interface().get_base_control().get_theme_icon("Notification", "EditorIcons")


func _make_visible(visible: bool) -> void:
	if panel:
		panel.visible = visible
