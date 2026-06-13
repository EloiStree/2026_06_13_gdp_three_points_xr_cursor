# 2026_06_13_gdp_three_points_xr_cursor

> Add support in Godot XR for generating a three-point triangle in world space that can be used by external packages.

I currently have a tool that allows students to relocate objetct or load a scene using a start point and an end point.

In Unity, however, I used a three-point triangle approach, which provided a more flexible way to define position and orientation in space.

This toolbox would introduce a 3D triangle cursor in Godot XR. The triangle could be used as a reference for mesh generation, scene loading, or triggering actions. The concept is based on my Unity ThreePoints library, but redesigned for Godot.

I recently rebuilt the two-point version for students. During a discussion with Vincent, I realized that a three-point approach could also make it possible to place or load scenes on surfaces such as round tables, where two points may not provide enough spatial information.

My goal is to evaluate the implementation effort. At first glance, it appears to be a relatively straightforward extension of the existing two-point tool.
