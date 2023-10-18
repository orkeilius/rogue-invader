extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/DisplayButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_display_button_pressed():
	get_tree().change_scene_to_file("res://scene/SpaceInvaders.tscn")


func _on_control_button_pressed():
	get_tree().change_scene_to_file("res://scene/UI/Input Settings/input_settings.tscn")


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scene/UI/main_menu.tscn")
