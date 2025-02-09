extends StaticBody2D
signal door_opend
var keyTaken = false 
var inDoorZone: = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if keyTaken and inDoorZone:
		if Input.is_action_just_pressed("accept"):
			print("presesd to open door")
			emit_signal("door_opend")
			

func levelKeyZone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not keyTaken:
		print("level key taken")
		keyTaken = true 
		animated_sprite.queue_free()
		
		
func _on_door_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inDoorZone = true 
		
		
	
