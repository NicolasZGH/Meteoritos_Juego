#Proyectil.gd
class_name ProyectilPlayer
extends Area2D

#Atributos
var velocidad:Vector2 = Vector2.ZERO
var damage:float

#Métodos
# Constructor
func crear(pos: Vector2, dir: float, vel: float, damage_p: int) -> void:
	position = pos
	rotation = dir
	velocidad = Vector2(vel, 0).rotated(dir)
	damage = damage_p

func _physics_process(delta: float) -> void:
	position += velocidad * delta



func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
