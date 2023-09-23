extends CharacterBody2D

var SPEED = 40
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity.y += gravity * delta
	
	if chase == true:
		player = get_node("../../Player/Player")
		var direction = (player.position - self.position).normalized()
		if direction.x>0:			
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false
			
		velocity.x = direction.x*SPEED				
	move_and_slide()
	
func _on_player_2d_body_entered(body):
	if body.name == "Player":
		chase = true
	else:
		chase = false
		
