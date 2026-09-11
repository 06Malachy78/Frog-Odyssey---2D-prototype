extends RigidBody2D


@onready var game_manager: Node = %GameManager




func _process(_delta):
	var players = get_tree().get_nodes_in_group("player") #finds the player in the group so works in every level
	if players.size() == 0:
		return
	
	var player = players[0]
	var sprite = $AnimatedSprite2D
	sprite.flip_h = player.global_position.x < global_position.x


func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		
		
		if (y_delta > 30):
			print("Detroy enemy")
			queue_free()
			body.jump()
		else: 
			print("Decrease player health")
			game_manager.decrease_health()
			if (x_delta > 0):
				body.jump_slide(500)
			else:
				body.jump_slide(-500)
		
