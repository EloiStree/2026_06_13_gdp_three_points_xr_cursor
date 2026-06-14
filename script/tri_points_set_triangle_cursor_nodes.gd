class_name TriPointsSetTriangleCursorNodes
extends Node

signal on_three_points_emitted(start:Vector3,middle:Vector3,end:Vector3)
signal on_new_point_added(start:Vector3,middle:Vector3,end:Vector3)


@export var _start_anchor:Node3D
@export var _middle_anchor:Node3D
@export var _end_anchor:Node3D


func emit_current_points():
	on_three_points_emitted.emit(
		get_start_anchor_vector3(),
		get_middle_anchor_vector3(),
		get_end_anchor_vector3()
	)

func append_new_point_vector3(global_position:Vector3):
	
	set_start_anchor_vector3( get_middle_anchor_vector3() )
	set_middle_anchor_vector3( get_end_anchor_vector3() )
	set_end_anchor_vector3(global_position)
	on_new_point_added.emit(
		get_start_anchor_vector3(),
		get_middle_anchor_vector3(),
		get_end_anchor_vector3()
	)
	
func set_start_anchor_vector3(global_position:Vector3):
	_start_anchor.global_position= global_position

func set_middle_anchor_vector3(global_position:Vector3):
	_middle_anchor.global_position= global_position
	
func set_end_anchor_vector3(global_position:Vector3):
	_end_anchor.global_position= global_position

func get_start_anchor_vector3()->Vector3:
	return _start_anchor.global_position
	
func get_middle_anchor_vector3()->Vector3:
	return _middle_anchor.global_position
	
func get_end_anchor_vector3()->Vector3:
	return _end_anchor.global_position
