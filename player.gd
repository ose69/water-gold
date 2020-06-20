extends KinematicBody2D
var velocity=Vector2()
var speed = 26.50
var gravity =450
var jump_speed=150
var direction=Vector2()

func _ready():
	return jump_speed or speed

func _physics_process(delta):
	apply_gravity(delta)
	
func _input(event):
	direction.x= int(Input.is_action_just_pressed("ui_right"))-int(Input.is_action_just_pressed("ui_left"))
	if direction.x !=0:
		get_node("Ancla").scale = Vector2(direction.x,1)
	return event	

func apply_gravity(delta):
	velocity.y += gravity*delta
	var move_info = move_and_slide(velocity,Vector2(0,-1))
	
	if get_slide_count() != 0:
		var body = get_slide_collision(get_slide_count()-1)
		
		if body.normal == Vector2(0,1):
			velocity.y = 0
			
	if is_on_floor():
		velocity.y=0
		
	return move_info
