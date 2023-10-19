#Enemigo
extends Node2D

var hitpoints:float = 10.0

func recibir_damage(damage: float) -> void:
	hitpoints -= damage
	if hitpoints <= 0.0:
		queue_free() 

func _on_Area2D_body_entered(body: Node) -> void:
	if body is Player:
		body.destruir()

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	$Cannon.set_esta_disparando(true)
