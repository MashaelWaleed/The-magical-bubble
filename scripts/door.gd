extends Area2D

var nextlevel = ""
var doorOpened=false

@onready var closed: Sprite2D = %Closed
@onready var open: Sprite2D = %Open

func _ready() -> void:
	print(Points.nextLevel)
	match Points.nextLevel: 
		2:
			nextlevel="res://sceens/level2.tscn"
		3:
			nextlevel="res://sceens/level_3.tscn"
		_:
			nextlevel="res://sceens/level1.tscn"
			

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("enter") and doorOpened :
		get_tree().change_scene_to_file( nextlevel)

func _on_open_area_body_entered(body: Node2D) -> void:
	print("door area entered")
	pass

func _on_open_area_body_exited(body: Node2D) -> void:
	print("body exit from door zoon")
	closed.visible = true
	open.visible = false 
	doorOpened=false


func _on_levels_key_door_opend() -> void:
	doorOpened=true
	closed.visible = false
	open.visible = true
	
		
