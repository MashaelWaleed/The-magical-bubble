extends Area2D

@onready var close: Sprite2D = $close
@onready var open: Sprite2D = $open
@onready var timer: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	open.visible = false
	close.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_key_treasure_chest_opend() -> void:
	print("open the chest")
	open.visible = true
	close.visible = false
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file( "res://sceens/end_1.tscn")
