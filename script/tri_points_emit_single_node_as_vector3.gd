class_name TriPointsEmitSingleNodeAsVector3
extends Node

signal on_target_node_global_position_emitted(global_position:Vector3)

@export var target_node:Node3D


func get_global_position()->Vector3:
	return target_node.global_position
	
func emit_current_global_position():
	on_target_node_global_position_emitted.emit(get_global_position())
