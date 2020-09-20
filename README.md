# CrosshairShader
Dynamic crosshair shader for godot

## Installation
Create a ColorRect, set the size to your resolution so it covers the entire viewport. Apply the shader to the ColorRect.

## Customization
Colors, size, spacing, etc. are editable in shader params. 

`inverted`option overrides all color and replaces it with an inverted screenbuffer. 

`color_id` enables `color_%id`. Example usage (sets active color to color_1 when a raycast is intersecting an enemey):

    var cursor_object = $UpperCollider/Camera/RayCast.get_collider()
	if cursor_object == null:
		$HUD/Crosshair.material.set_shader_param("color_id", 0)
	elif cursor_object.is_in_group("enemy"):
		print("enemy")
		$HUD/Crosshair.material.set_shader_param("color_id", 1)
      
`spread` determines the factor of spacing. The space between each section is `spacing * spread`. 1 is the default value. Example usage (spread dependent on player velocity):

    var spread = velocity.length()/2 + 1
	$Crosshair.material.set_shader_param("spread", spread)
