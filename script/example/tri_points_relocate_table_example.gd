
class_name TriPointsRelocateTableExample
extends Node

@export var _table_to_relocate: Node3D

func relocate_table(start: Vector3, middle: Vector3, end: Vector3):
	start.y = middle.y
	end.y = middle.y
	if start.distance_to(middle) < 0.001 or middle.distance_to(end) < 0.001 or start.distance_to(end) < 0.001:
		_table_to_relocate.global_position = middle
		_table_to_relocate.scale = Vector3.ONE
		return
	var center: Vector3 = get_circumcenter(start, middle, end)
	if center == Vector3.ZERO or is_nan(center.x):
		_table_to_relocate.global_position = middle
		_table_to_relocate.scale = Vector3.ONE
		return
	var r1 = (start - center).length()
	var r2 = (middle - center).length()
	var r3 = (end - center).length()
	var radius = r2
	_table_to_relocate.global_position = center
	_table_to_relocate.scale = Vector3(radius*2.0, radius*2.0, radius*2.0)
	var direction = (middle - center).normalized()
	var angle_y: float = Vector3.FORWARD.signed_angle_to(direction, Vector3.UP)
	_table_to_relocate.global_rotation_degrees = Vector3(0, rad_to_deg(angle_y), 0)


func get_circumcenter(a: Vector3, b: Vector3, c: Vector3) -> Vector3:
	var ab = b - a
	var ac = c - a
	var ab_cross_ac = ab.cross(ac)
	if ab_cross_ac.length_squared() < 1e-8:
		return Vector3.ZERO
	var to_center = (
		ab_cross_ac.cross(ab) * ac.length_squared() +
		ac.cross(ab_cross_ac) * ab.length_squared()
	) / (2.0 * ab_cross_ac.length_squared())
	return a + to_center
