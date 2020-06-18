extends KinematicBody2D
#export var speed = 33000  # How fast the player will move (pixels/sec).
export var speed = 200
export var jump_speed = 300
export var gravity = 400
#cargar recurso de la vala en una variable
var bala = load("res://bala.tscn")
#variables para cumplir con las fórmulas del mru, distancia y velociddad
var distance = Vector2()
var velocity = Vector2()
var direccion_x = 0

# activar proceso físco
func _ready():
	set_physics_process(true)

	
func _physics_process(delta):
	_move(delta)
	
func _move(delta):
	# la dirección es un cero, y se mueve siempre con +1 o -1 en el eje de las x
	direccion_x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	
		#voltear la imagen
	if direccion_x < 0 :
		$Sprite.flip_h = true
	elif direccion_x > 0 :
		$Sprite.flip_h = false
	
	#asegurarse de que la animación esté en 0
	if direccion_x==0 :
		$AnimationPlayer.stop()
		$Sprite.frame = 0
		
	elif direccion_x !=0 :
		if $AnimationPlayer.is_playing()==false:
			$AnimationPlayer.play("right")
			
	
	distance.x = speed*delta
	#agregar dirección en velocidad
	velocity.x = (direccion_x*distance.x)/delta
	velocity.y += gravity* delta
	
		#instansear bala
	if Input.is_action_just_pressed("disparar"):
		_disparar()
	
	
	move_and_slide(velocity, Vector2(0,-1))
	
	if is_on_floor():
		#cancelar grabedad en piso
		velocity.y=0
		#preguntar su está la tecla de salto y saltar
		if Input.is_action_just_pressed("ui_up"):
			velocity.y= -jump_speed
func _disparar():
	var newBala = bala.instance()
	get_parent().add_child(newBala)
	newBala.direction = -1
	newBala.speed = 800
	newBala.global_position = $pos_bala.global_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame



func _on_Area2D_body_entered(body):
	if body.get_name()=="player":
		get_tree().change_scene("res://desert.tscn")
	pass # Replace with function body.
