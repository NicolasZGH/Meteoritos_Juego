#Player.gd
class_name Player
extends RigidBody2D

## Atributos Export
export var potencia_motor:int = 20
export var potencia_rotacion:int = 280

## Atributos
var empuje:Vector2 = Vector2.ZERO
var dir_rotacion:int = 0

#Atributos onready
onready var cannon:Cannon = $Cannon 
onready var laser:RayoLaser = $LaserBeam2D

# Métodos
func _integrate_forces(state: Physics2DDirectBodyState) -> void:
	apply_central_impulse(empuje.rotated(rotation))
	apply_torque_impulse(dir_rotacion * potencia_rotacion)
	
func _process(delta: float) -> void:
	player_input()
	
func _unhandled_input(event: InputEvent) -> void:
	#DisparoRayo
	if event.is_action_pressed("disparo_secundario"):
		laser.set_is_casting(true)
		
	if event.is_action_released("disparo_secundario"):
		laser.set_is_casting(false)
# Métodos Custom
func player_input() -> void:
	# Empuje
	empuje = Vector2.ZERO
	if Input.is_action_pressed("Adelante"):
		empuje = Vector2(potencia_motor, 0)
	elif Input.is_action_pressed("Atrás"):
		empuje = Vector2(-potencia_motor, 0)
		
	# Rotación
	dir_rotacion = 0
	if Input.is_action_pressed("Izquierda"):
		dir_rotacion -= 1
	elif Input.is_action_pressed("Derecha"):
		dir_rotacion += 1
		
	#Disparo
	if Input.is_action_pressed("disparo_principal"):
		cannon.set_esta_disparando(true)
		
	if Input.is_action_just_released("disparo_principal"):
		cannon.set_esta_disparando(false)