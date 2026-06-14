class_name TriPointsDistanceAngleGetFromNode3D
extends Node


signal on_node3D_emitted(start:Node3D,middle:Node3D,end:Node3D)
signal on_global_position_emitted(start:Vector3,middle:Vector3,end:Vector3)
signal on_info_emitted(raw_info: TriPointsFullTriangleResource)


@export var _start_anchor: Node3D
@export var _middle_anchor: Node3D
@export var _end_anchor: Node3D

@export var _raw_info:TriPointsFullTriangleResource
@export var _use_process_to_refresh_information:bool=true
@export var _use_process_to_emit_information:bool=true

func get_raw_info_reference():
	return _raw_info

func get_corner_global_position(corner_enum : TriPointsUtility.TriPointsCorner, out_global_position: TriPointsUtility.TriPointsOutVector3 ):
	_raw_info.get_corner_global_position(corner_enum, out_global_position)

func get_corner_angle(corner_enum : TriPointsUtility.TriPointsCorner, out_angle: TriPointsUtility.TriPointsOutFloat ):
	_raw_info.get_corner_angle(corner_enum,out_angle)
	
func get_segment_distance(segment_enum : TriPointsUtility.TriPointsEdgeName, out_distance: TriPointsUtility.TriPointsOutFloat ):
	_raw_info.get_segment_distance(segment_enum, out_distance)


func _process(delta: float) -> void:
	if _use_process_to_refresh_information:
		refresh_raw_info()
	if _use_process_to_emit_information:
		emit_current_information()

func emit_current_information():
	on_info_emitted.emit(_raw_info)
	on_node3D_emitted.emit(_start_anchor,_middle_anchor,_end_anchor)
	on_global_position_emitted.emit(_start_anchor.global_position,_middle_anchor.global_position,_end_anchor.global_position)
		
func refresh_raw_info():
	_raw_info.set_with_three_points_and_refresh(_start_anchor.global_position,_middle_anchor.global_position,_end_anchor.global_position)
	
	
func set_with_raw_info_and_refresh(info: TriPointsFullTriangleResource):
	
	_start_anchor.global_position= info._positions._start
	_middle_anchor.global_position=info._positions._middle
	_end_anchor.global_position= info._positions._end
	refresh_raw_info()
	
func set_with_three_points_and_refresh(start:Vector3,middle:Vector3,end:Vector3):
	_start_anchor.global_position= start
	_middle_anchor.global_position= middle
	_end_anchor.global_position= end
	refresh_raw_info()
#
#
#
#
		#public void GetCrossProductAtMiddle(out Vector3 cross)
		#{
			#m_triangle.GetCrossProductAtMiddle(out cross);
		#}
#
		#public void RefreshDataWithoutNotification()
		#{
			#m_triangle.SetThreePoints(
				#m_startPoint.position,
				#m_middlePoint.position,
				#m_endPoint.position);
		#}
#
#
#
		#public void GetCentroid(out Vector3 centroid)
		#{            //DUPLICATA IN THREEPOINTSUTILTY TO WORKS WITHOUT IT.
#
			#m_triangle.GetThreePoints(out Vector3 start, out Vector3 middle, out Vector3 end);
			#centroid = new Vector3(
		#(start.x + middle.x + end.x) / 3,
		#(start.y + middle.y + end.y) / 3,
		#(start.z + middle.z + end.z) / 3
	#);
		#}
		#public void GetClosestPoint(Vector3 toPoint, out ThreePointCorner closestCorner, out Vector3 closestPosition, out float distance)
		#{            //DUPLICATA IN THREEPOINTSUTILTY TO WORKS WITHOUT IT.
#
			#distance = float.MaxValue;
			#m_triangle.GetThreePoints(out Vector3 start, out Vector3 middle, out Vector3 end);
			#closestCorner = ThreePointCorner.Start;
			#closestPosition = start;
			#float distanceStart = Vector3.Distance(start, toPoint);
			#float distanceMiddle = Vector3.Distance(middle, toPoint);
			#float distanceEnd = Vector3.Distance(end, toPoint);
			#if (distanceStart < distance)
			#{ closestCorner = ThreePointCorner.Start; distance = distanceStart; closestPosition = start; }
			#if (distanceMiddle < distance)
			#{ closestCorner = ThreePointCorner.Middle; distance = distanceMiddle; closestPosition = middle; }
			#if (distanceEnd < distance)
			#{ closestCorner = ThreePointCorner.End; distance = distanceEnd; closestPosition = end; }
#
		#}
#
#
#
		#public void GetFarestPoint(Vector3 toPoint, out ThreePointCorner closestCorner, out Vector3 closestPosition, out float distance)
		#{
			#//DUPLICATA IN THREEPOINTSUTILTY TO WORKS WITHOUT IT.
			#distance = 0;
			#m_triangle.GetThreePoints(out Vector3 start, out Vector3 middle, out Vector3 end);
			#closestCorner = ThreePointCorner.Start;
			#closestPosition = start;
			#float distanceStart = Vector3.Distance(start, toPoint);
			#float distanceMiddle = Vector3.Distance(middle, toPoint);
			#float distanceEnd = Vector3.Distance(end, toPoint);
			#if (distanceStart > distance)
			#{ closestCorner = ThreePointCorner.Start; distance = distanceStart; closestPosition = start; }
			#if (distanceMiddle > distance)
			#{ closestCorner = ThreePointCorner.Middle; distance = distanceMiddle; closestPosition = middle; }
			#if (distanceEnd > distance)
			#{ closestCorner = ThreePointCorner.End; distance = distanceEnd; closestPosition = end; }
#
		#}
#
		#public void GetPoints(out Vector3[] arrayOf3)
		#{
#
			#RefreshDataWithoutNotification();
			#m_triangle.GetPoints(out arrayOf3);
		#}
#
		#public void GetPoint(ThreePointCorner corner, out Vector3 point)
		#{
			#RefreshDataWithoutNotification();
			#m_triangle.GetPoint(corner, out point);
		#}
#
		#public void GetThreePoints(out Vector3 start, out Vector3 middle, out Vector3 end)
		#{
			#RefreshDataWithoutNotification();
			#m_triangle.GetThreePoints(out start, out middle, out end);
		#}
#
		#public void GetDistanceAngle(out I_ThreePointsDistanceAngleGet computed)
		#{
			#RefreshDataWithoutNotification();
			#computed= m_triangle;
		#}
		#public I_ThreePointsDistanceAngleGet GetDistanceAngle()
		#{
			#RefreshDataWithoutNotification();
			#return m_triangle;
		#}
#
		#public bool IsOnePointNull()
		#{
			#return m_endPoint == null
				#|| m_middlePoint == null
				#|| m_startPoint == null;
		#}
	#}
#}
#
#
#
#-----------
#
#
#using System;
#using UnityEditor;
#using UnityEngine;
#
#namespace Eloi.ThreePoints
#{
#
	#
	#[System.Serializable]
	#public class ThreePointsTriangleDefault : I_ThreePointsDistanceAngleGet, I_ThreePointsSet
	#{
		#public STRUCT_ThreePointTriangle m_points;
		#public STRUCT_ThreePointTriangleDistanceAndAngle m_distanceAndAngle;
		
