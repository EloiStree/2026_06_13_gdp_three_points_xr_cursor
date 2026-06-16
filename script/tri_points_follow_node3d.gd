class_name TriPointsFollowNode3D
extends Node3D

@export var what_to_follow:Node3D
@export var what_to_move:Node3D


func _ready() -> void:
	if what_to_follow==null:
		what_to_follow= find_left_hand(get_tree().current_scene)
		

func _process(delta: float) -> void:
	if what_to_follow and what_to_move:
		what_to_move.global_position= what_to_follow.global_position
		what_to_move.global_rotation= what_to_follow.global_rotation


func find_left_hand(node: Node) -> XRNode3D:
	if node is XRNode3D and node.tracker == "left_hand":
		return node

	for child in node.get_children():
		var result := find_left_hand(child)
		if result:
			return result
	return null
