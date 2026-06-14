class_name TriPointsTriangleDistanceAndAngleResource
extends Resource

@export_range(0,180)
var _start_point_angle:float
@export_range(0,180)
var _middle_point_angle:float
@export_range(0,180)
var _end_point_angle:float

@export var _start_middle_distance:float
@export var _middle_end_distance:float
@export var _start_end_distance:float


func get_corner_angle(corner_enum : TriPointsUtility.TriPointsCorner, out_angle: TriPointsUtility.TriPointsOutFloat ):
	if corner_enum== TriPointsUtility.TriPointsCorner.Start:
		out_angle.value= _start_point_angle
	elif corner_enum== TriPointsUtility.TriPointsCorner.Middle:
		out_angle.value= _middle_point_angle
	elif corner_enum== TriPointsUtility.TriPointsCorner.End:
		out_angle.value= _end_point_angle
			

func get_segment_distance(segment_enum : TriPointsUtility.TriPointsEdgeName, out_distance: TriPointsUtility.TriPointsOutFloat ):
	if segment_enum== TriPointsUtility.TriPointsEdgeName.StartMiddle:
		out_distance.value= _start_middle_distance
	elif segment_enum== TriPointsUtility.TriPointsEdgeName.MiddleEnd:
		out_distance.value= _middle_end_distance
	elif segment_enum== TriPointsUtility.TriPointsEdgeName.StartEnd:
		out_distance.value= _start_end_distance
