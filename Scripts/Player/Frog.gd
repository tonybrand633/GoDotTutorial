extends CharacterBody2D


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta
	
