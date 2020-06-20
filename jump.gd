extends "res://estado.gd"

#trallengo nodo donde está la animación y activandolo
func enter():
	owner.get_node("AnimationPlayer").play("jump")
#recive un evento de la máquina principal
func controlae_input():
	pass
	
# comprobar si la animación está activa
func update(delta):
	if owner.direction.y==0:
		emit_signal("finished","idle")
#quizá debemos pasarle la velocidad de salto y dirección como en señal move
#además de crear la función, talvés
