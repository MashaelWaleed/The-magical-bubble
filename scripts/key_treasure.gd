extends StaticBody2D

signal chest_opend 
var keyTaken = false 
var inChestZone = false
@onready var key_sprite: AnimatedSprite2D = $keyZone/keySprite


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if keyTaken and inChestZone:
		if Input.is_action_just_pressed("accept"):
			print("chest opend")
			emit_signal("chest_opend")


func _keyZone_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and not keyTaken:
		print("key taken")
		keyTaken = true 
		key_sprite.queue_free()
		

func _on_chest_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("in chest Zone")
		inChestZone = true


func _on_chest_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("just out chest zone ")
		inChestZone = false
