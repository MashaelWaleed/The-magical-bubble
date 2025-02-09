extends CharacterBody2D


const SPEED = 70
var direction = 1
@onready var ray_castbellow: RayCast2D = $RayCastbellow
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h= false
		
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h= true
		
	if not ray_castbellow.is_colliding():
		direction*=-1
		animated_sprite.flip_h= not animated_sprite.flip_h
		
		
		
	position.x += direction * SPEED * delta #delta make the speed independent of the frames
	move_and_slide()
