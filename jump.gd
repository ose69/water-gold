extends "res://StateMachine/state.gd"

func enter():
	owner.velocity.y = -owner.jump_speed
	owner.get_node("AnimationPlayer").play("jump")
	owner.move_and_slide(owner.velocity,Vector2(0,-1))

#ver si chocamos en el suelo, para cambiar a estado detenido	
func update(delta):
	if owner.is_on_floor():
		emit_signal("finished","idle")
		return
	move(owner.speed, owner.direction);

func move(speed,direction):
	owner.velocity.x = direction.x *speed;
	owner.move_and_slide(owner.velocity,Vector2(0,-1));

