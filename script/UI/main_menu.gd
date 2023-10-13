extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	pass # Replace with function body.


func _on_space_invaders_button_pressed():
	get_tree().change_scene_to_file("res://scene/SpaceInvaders.tscn")


func _on_options_pressed():
	var options = load("res://scene/UI/options_menu.tscn").instance()
	get_tree().current_scene.add_child(options)


func _on_quit_button_pressed():
	get_tree().quit()
