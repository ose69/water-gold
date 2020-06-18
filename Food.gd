extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Food_body_entered(body):
	print(body.get_name())
	if(body.get_name()== "player"):
		hide()
	pass # Replace with function body.
