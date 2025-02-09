extends Node

@onready var label: Label = %Label

func add_point():
	Points.coins +=1
	label.text = str(Points.coins )
