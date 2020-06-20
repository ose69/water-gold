extends "res://estado.gd"
#trallengo nodo donde está la animación y activandolo
func enter():
	owner.get_node("AnimationPlayer").play("idle")
#llamando func input de máquina de estados principal	
func _input(event):
	if Input.is_action_just_pressed("jump"):
		if owner.is_on_floor():
			owner.velocity.y=0;
			#emitiendo señal de salto
			emit_signal("finished","jump")

#llamanfo función updete de maquina_de_estados_principal
func update(delta):
	if owner.direction.x !=0:
		emit_signal("finished","move")
