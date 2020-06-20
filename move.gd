extends "res://estado.gd"
func enter():
	owner.get_node("AnimationPlayer").play("move")
#llamando función controlar in put de maquina de estados principal para que no haga nada, porque no hay ataque
func controlar_input(event):
	pass

#función para ver como salir del estado move, si está en movimiento pasa a idle
func update(delta):
	if owner.direction.x==0:
		emit_signal("finished","idle")
	#player se mueve con speed y direction se pasa a función de abajo
	move(owner.speed,owner.direction.x)

func move(speed, direction):
	#el jugador se mueve a una velocidad y una dirección
	owner.velocity.x = speed*direction.x
	owner.move_and_slide(owner.velocity,Vector2(0,-1))
		
