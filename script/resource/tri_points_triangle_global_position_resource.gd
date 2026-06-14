class_name TriPointsTriangleGlobalPositionResource
extends Resource

@export var _start:Vector3
@export var _middle:Vector3
@export var _end:Vector3



func get_corner_global_position(corner_enum : TriPointsUtility.TriPointsCorner, out_global_position: TriPointsUtility.TriPointsOutVector3 ):
	if corner_enum== TriPointsUtility.TriPointsCorner.Start:
		out_global_position.value= _start
	elif corner_enum== TriPointsUtility.TriPointsCorner.Middle:
		out_global_position.value= _middle
	elif corner_enum== TriPointsUtility.TriPointsCorner.End:
		out_global_position.value= _end
		
	
