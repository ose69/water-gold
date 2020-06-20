extends Node
var ruta_de_estados = {}
var estado_actual = null

var activo= false setget activar
#Recorriendo todos los valores hijos de la máquina de estados
func _ready():
	for hijo in get_children():
		#conentando su señal a finalizado en función cambiar_estado
		hijo.connect("finished",self,"cambiar_estado")
	activar(false)
#recive evento físico  lo almacena en var estado_actual y lo actualiza
func _physics_process(delta):
	estado_actual.update(delta)
#recive evento con valor de var estado_actual de entrada de teclado y lo almacena en 	func controlar_input
func _input(event):
	estado_actual.controlar_input(event)
	
#resiviendo valor de cambiar estado en nuevo_estado
func cambiar_estado(nuevo_estado):
	if activo!=true:
		return
	estado_actual=ruta_de_estados[nuevo_estado]
	estado_actual.enter()
			

func activar(nuevovalor):
	activo = nuevovalor
	set_physics_process(activo)
	set_process_input(activo)
	if activo != true:
		estado_actual=null
