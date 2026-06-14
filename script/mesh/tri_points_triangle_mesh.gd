class_name TriPointsTriangleMesh
extends MeshInstance3D

@export var point_start: Node3D
@export var point_middle: Node3D
@export var point_end: Node3D

var mesh_data := ArrayMesh.new()
var base_arrays: Array = []

func _ready() -> void:
	mesh = mesh_data
	_setup_mesh_with_shader()


func _process(_delta: float) -> void:
	if not point_start or not point_middle or not point_end:
		return
	_update_positions()


func _setup_mesh_with_shader() -> void:
	base_arrays.resize(Mesh.ARRAY_MAX)
	
	var vertices := PackedVector3Array([
		Vector3.ZERO, Vector3.ZERO, Vector3.ZERO,
		Vector3.ZERO, Vector3.ZERO, Vector3.ZERO
	])
	
	var uvs := PackedVector2Array([
		Vector2(0, 0), Vector2(1, 0), Vector2(0, 1),
		Vector2(0, 0), Vector2(1, 0), Vector2(0, 1),
	])
	
	var colors := PackedColorArray([
		Color.RED, Color.GREEN, Color.BLUE,
		Color.RED, Color.GREEN, Color.BLUE,
	])
	
	base_arrays[Mesh.ARRAY_VERTEX] = vertices
	base_arrays[Mesh.ARRAY_TEX_UV] = uvs
	base_arrays[Mesh.ARRAY_COLOR] = colors
	
	mesh_data.clear_surfaces()
	mesh_data.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, base_arrays)
	
	# Shader directly on the geometry
	var shader_mat := ShaderMaterial.new()
	var shader := Shader.new()
	
	shader.code = """
    shader_type spatial;
    render_mode unshaded, cull_disabled;
    
    void vertex() {
        COLOR = COLOR;           // Pass vertex colors to fragment
    }
    
    void fragment() {
        ALBEDO = COLOR.rgb;
        ALPHA = COLOR.a;
    }
	"""
	
	shader_mat.shader = shader
	mesh_data.surface_set_material(0, shader_mat)


func _update_positions() -> void:
	var local_start := to_local(point_start.global_position)
	var local_middle := to_local(point_middle.global_position)
	var local_end := to_local(point_end.global_position)
	
	var vertices: PackedVector3Array = base_arrays[Mesh.ARRAY_VERTEX]
	
	vertices[0] = local_start
	vertices[1] = local_middle
	vertices[2] = local_end
	
	# Back side (reversed order)
	vertices[3] = local_start
	vertices[4] = local_end
	vertices[5] = local_middle
	
	mesh_data.clear_surfaces()
	mesh_data.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, base_arrays)
