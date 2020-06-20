extends "res://maquinaprincipal.gd"
# este archivo es el controlador de la maquina de estados

#accede a los estados de la Máquina de estados, trae ruta, y manda un nuevo estado
# al archivo de la máquina de estados pricipal en donde está función cambiar estado que recibe el parametro enviado
func _ready():
	ruta_de_estados={"idle":$Idle, "move":$move, "jump":$jump}
	activar(true)
	cambiar_estado("idle")

#llamando a función cambiar_estado con función cambiar_estado
func cambiar_estado(nuevo_estado):
	.cambiar_estado(nuevo_estado) 
	
