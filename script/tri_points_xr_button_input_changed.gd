class_name TriPointsXrButtonInputChanged
extends Node

signal on_button_state_changed(is_on:bool)
signal on_button_down()
signal on_button_up()


@export var controller_to_observe: XRController3D
@export var button_name_press_release:String="primary_click"

@export var button_state:bool=0
func _ready() -> void:
	if controller_to_observe:
		controller_to_observe.button_pressed.connect(_pressed)
		controller_to_observe.button_released.connect(_released)

func _pressed(name:String):
	print("Pressed XR:", name)
	if button_name_press_release==name:
		print("Pressed XR FOUND:", name)
		on_button_down.emit()
		if not button_state:
			on_button_state_changed.emit(true)
	
func _released(name:String):
	print("Released XR:", name)
	if button_name_press_release==name:
		print("Released XR FOUND:", name)
		on_button_up.emit()
		if button_state:
			on_button_state_changed.emit(false)
