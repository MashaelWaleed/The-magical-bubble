extends Area2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var sprite: AnimatedSprite2D = $"../Sprite2D"
@onready var bird: CharacterBody2D = $".."
var toDown=10

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		sprite.play("hitBird")
		animation_player.play("killBird")
		
		
