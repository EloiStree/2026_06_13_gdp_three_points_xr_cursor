shader_type spatial;
render_mode unshaded, cull_back;

// Optional: you can still receive lighting if you want
// render_mode diffuse_lambert, specular_schlick_ggx;

void vertex() {
    // You can modify the vertex position here if needed
    // Example: slight offset based on color
    // VERTEX += NORMAL * COLOR.r * 0.1;
}

void fragment() {
    // Use the vertex color directly
    ALBEDO = COLOR.rgb;
    
    // Optional: use vertex alpha for transparency
    ALPHA = COLOR.a;
    
    // Optional: add some emission based on color brightness
    // EMISSION = COLOR.rgb * 0.3;
}