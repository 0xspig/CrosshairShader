shader_type canvas_item;

uniform bool center_enabled = true;
uniform bool inverted = false;
uniform bool on_enemy = false;
uniform vec4 color = vec4(0., 1, 0., 1.);
uniform vec4 enemy_color = vec4(1., 0., 0., 1.);
uniform float width = .003;
uniform float len = .03;
uniform float spacing = .008;
uniform float spread = 1.;


void fragment(){

	float a = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
	vec2 UVa = vec2(UV.x / a, UV.y);
	vec2 center = vec2(.5 / a, .5);

	float point = step(distance(UVa, center), .002);

	float h = step(center.x - len - spacing*spread, UVa.x) - step(center.x - spacing*spread, UVa.x);
	h += step(center.x + spacing*spread, UVa.x) - step(center.x + len + spacing*spread, UVa.x);
	h *= step(center.y - width, UVa.y) - step(center.y + width, UVa.y);
	
	float v = step(center.y - len - spacing*spread, UVa.y) - step(center.y - spacing*spread, UVa.y);
	v += step(center.y + spacing*spread, UVa.y) - step(center.y + len + spacing*spread, UVa.y);
	v *= step(center.x - width, UVa.x) - step(center.x + width, UVa.x);

	float crosshair;

	if(!center_enabled){
		crosshair = h + v;
	}else{
		crosshair = h + v + point;
	}
	if(!inverted){
		COLOR = (color * float(!on_enemy) + enemy_color * float(on_enemy)) * crosshair;
	}else{
		COLOR = vec4((cos(textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb * 3.1415926534) + 1.)/2., 1.) * crosshair;
	}
}