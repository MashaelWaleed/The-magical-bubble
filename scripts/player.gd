extends CharacterBody2D

const SPEED = 70.0
const JUMP_VELOCITY = -160.0
const MaxHeart = 3
var currentHelth = 3
var killed = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump: AudioStreamPlayer2D = $jump
@export var climbing = false 
@export var inEdgeOfLadder=false
@export var instartOfLadder=false
	
func _physics_process(delta: float) -> void:
	# Add the gravity and handle jumbing.
	if not is_on_floor() and not climbing:
		velocity += get_gravity() * delta/4
		
	if killed :velocity += get_gravity() * delta*2
		
	
	if climbing :
		velocity.y=0
		print(" i am in climbing area ")
		if Input.is_action_pressed("climbingUp"):
			if not inEdgeOfLadder:
				print("i'm climbing up")
				velocity.y = -SPEED/2
		if Input.is_action_pressed("climbingDown"):
			print("i'm climbing down")
			velocity.y = SPEED/2
			

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or (climbing and not inEdgeOfLadder)):
		velocity.y = JUMP_VELOCITY
		jump.play()
 		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#Get the input direction : -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
		#flip the sprit 
	if direction > 0:
		animated_sprite.flip_h = false
	elif  direction < 0: 
		animated_sprite.flip_h = true
		
	if is_on_floor():
	#play animatoin 
		if direction == 0:
			animated_sprite.play("idel")
		else:
			animated_sprite.play("run")
	else:
		if Input.is_action_pressed("jump") and not climbing:
			animated_sprite.play("jump")
		elif Input.is_action_pressed("climbingUp") or Input.is_action_pressed("climbingDown")or climbing:
				animated_sprite.play("climbing")
		elif killed:
			animated_sprite.play("die")
		else:
			animated_sprite.play("fall")
		
		
		

	
	
	
		
	if direction: 
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
