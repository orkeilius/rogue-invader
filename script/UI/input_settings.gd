extends Control
## input setting menu

@onready var input_button_scene = preload("res://scene/UI/Input Settings/input_button.tscn")
@onready var action_list = $PanelContainer/MarginContainer/VBoxContainer/ScrollContainer/ActionList

var is_remapping = false
var action_to_remap = null
var remapping_button = null

var input_actions = {
	"up": "Move up",
	"left": "Move left",
	"down": "Move down",
	"right": "Move right",
	"shoot": "Shoot"
}

# Called when the node enters the scene tree for the first time.
func _ready():
	_create_action_list()

func _process(delta):
	if Input.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scene/UI/options_menu.tscn")


func _create_action_list():
	InputMap.load_from_project_settings()
	for item in action_list.get_children():
		item.queue_free()
	
	for action in input_actions:
		var button = input_button_scene.instantiate()
		var action_label = button.find_child("LabelAction")
		var input_label = button.find_child("LabelInput")
		
		action_label.text = input_actions[action]
		var events
		if action == "shoot":
			events = InputMap.action_get_events(action)
		else:
			events = InputMap.action_get_events("move_"+action)

		if events.size() > 0:
			input_label.text = events[0].as_text().trim_suffix(" (Physical)")
		else:
			input_label.text = ""
		
		action_list.add_child(button)
		button.pressed.connect(_on_input_button_pressed.bind(button, action))


func _on_input_button_pressed(button, action):
	if !is_remapping:
		is_remapping = true
		action_to_remap = action
		remapping_button = button
		button.find_child("LabelInput").text = "Press key to bind..."


func _input(event):
	if is_remapping:
		if (
			event is InputEventKey ||
			(event is InputEventMouseButton && event.passed)
		):
			if event is InputEventMouseButton && event.double_click:
				event.double_click = false
			

			remap_action("move_" + action_to_remap,event,remapping_button)
			remap_action("ui_" + action_to_remap,event,remapping_button)
			remap_action("ui_text_caret_" + action_to_remap,event,remapping_button)

			is_remapping = false
			action_to_remap = null
			remapping_button = null
			
			accept_event()
	
func remap_action(action,event,button):
	InputMap.action_erase_events(action)
	InputMap.action_add_event(action, event)
	_upgrade_action_list(button, event)

func _upgrade_action_list(button, event):
	button.find_child("LabelInput").text = event.as_text().trim_suffix(" (Physical)")

func _on_reset_button_pressed():
	_create_action_list()
