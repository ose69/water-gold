extends "res://estado.gd"

func enter():
	fire()
	
func fire():
	var fire = load("res://Fire.tscn").instance()
	add_child(fire)
	fire.global_position = owner.pos_fire.global_position
	fire.direction.x= owner.direction.x
	emit_signal("finished","movimiento")

