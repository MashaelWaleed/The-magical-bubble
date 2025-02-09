extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("climber"):
		print("i am in ladder zone")
		if body.climbing == false:
			body.climbing = true 
			print("value of climbing var="+str(body.climbing))
		

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("climber"):
		print("i am out ladder zone")
		if body.climbing == true:
			body.climbing = false
			print("value of climbing var="+str(body.climbing))


func _on_edge_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.inEdgeOfLadder==false:
			body.inEdgeOfLadder=true
	


func _on_edge_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		if body.inEdgeOfLadder==true:
			body.inEdgeOfLadder=false
	
