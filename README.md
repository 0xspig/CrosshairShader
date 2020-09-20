# CrosshairShader
Dynamic crosshair shader for godot

## Installation
Create a ColorRect, set the size to your resolution so it covers the entire viewport. Apply the shader to the ColorRect.

## Customization
Colors, size, spacing, etc. are editable in shader params. 
`
inverted`option overrides all color and replaces it with an inverted screenbuffer. 

`on_enemy` toggles between `color` and `enemy_color`. Example usage:

    var target = $Camera/RayCast.get_collider()
	if target != null && target.is_in_group("enemy"):
		 $Crosshair.material.set_shader_param("on_enemy", true)
	else:	  
     $Crosshair.material.set_shader_param("on_enemy", false)`
      
`spread` determines the factor of spacing. The space between each section is `spacing * spread`. 1 is the default value. Example usage:

    var spread = velocity.length()/2 + 1
	$Crosshair.material.set_shader_param("spread", spread)
