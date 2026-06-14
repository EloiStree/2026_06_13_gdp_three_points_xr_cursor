class_name TriPointsRawInfoToText
extends Node


signal on_raw_info_updated(text:String)

@export var last_generated_text:String

func push_raw_info_in(raw_info:TriPointsFullTriangleResource):
	var text:String = "\n".join(
		[
			"%1.3f | %1.3f | %1.3f"%[
				raw_info._distance_angle._start_point_angle,
				raw_info._distance_angle._middle_point_angle,
				raw_info._distance_angle._end_point_angle],
			"%1.3f | %1.3f | %1.3f"%[
				raw_info._distance_angle._start_middle_distance,
				raw_info._distance_angle._middle_end_distance,
				raw_info._distance_angle._start_end_distance],
		]
	)
	last_generated_text=text
	on_raw_info_updated.emit(text)
