extends Node

# Game variables
var STICK_START_POS := Vector2i(580, 392)
var SPHERE_START_POS := Vector2i(582, 236)
var screen_size : Vector2
var game_running : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport().size
	new_game()

func new_game():
	# Reseteo los nodos
	$G1Stick.position = STICK_START_POS
	$G1Sphere.position = SPHERE_START_POS  # Asegurarse de restablecer la posición de la bola
	
	get_tree().paused = false
	game_running = true
	
	# Ocultar Game Over
	$"Game Over".hide()
	

func _process(delta):
	if game_running:
		if $G1Sphere.position.y > screen_size.y:
			game_over()

func game_over():
	print("Juego terminado")
	$"Game Over".show()
	get_tree().paused = true
	game_running = false

func _on_game_over_restart():
	new_game()
