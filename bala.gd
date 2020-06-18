extends KinematicBody2D
var direction = -1
var speed = 500

func _process(delta):
	var move = move_and_slide(Vector2(0,direction*speed*delta))
	if move != null:
		if move.collider.is_in_group("Enemy"):
			move.collider.queue_fre() 
		elif move.collider.is_on_group("player"):
			move.queue_free()
		
		#autodestruir bala si no colisiona con nada
		
		self.queue_free()	
	
	#posición global de la bala para eliminarla después de cierta posición
	if global_position.x > 1024:
		self.queue_free()
	
