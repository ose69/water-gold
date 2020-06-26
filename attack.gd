extends "res://StateMachine/state.gd"

func enter():
	owner.get_node("AnimationPlayer").play("attack")
	
	
func handle_input(event):
	if Input.is_action_just_pressed("ui_up"):
		if owner.is_on_floor():
			owner.velocity.y=0
			emit_signal("finished","jump")
	return event

func update(delta):
	if owner.is_on_floor():
		if owner.direction.x !=0:
			emit_signal("finished","move")
			return
		
