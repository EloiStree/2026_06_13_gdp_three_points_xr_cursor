**Add to a git project:**
```
git submodule add https://github.com/EloiStree/2026_06_13_gdp_three_points_xr_cursor.git addons/2026_06_13_gdp_three_points_xr_cursor
```



# 2026_06_13_gdp_three_points_xr_cursor

> Add support in Godot XR for generating a three-point triangle in world space that can be used by external packages.

I currently have a tool that allows students to relocate objetct or load a scene using a start point and an end point.

In Unity, however, I used a three-point triangle approach, which provided a more flexible way to define position and orientation in space.

This toolbox would introduce a 3D triangle cursor in Godot XR. The triangle could be used as a reference for mesh generation, scene loading, or triggering actions. The concept is based on my Unity ThreePoints library, but redesigned for Godot.

<img width="1027" height="531" alt="image" src="https://github.com/user-attachments/assets/0b3e62c8-7b94-4db3-bca0-238c8ec62626" />

Example of loading round table based on three points:    
<img width="508" height="421" alt="image" src="https://github.com/user-attachments/assets/08dfec22-c378-42d1-be39-cc694cb8dbee" />     
