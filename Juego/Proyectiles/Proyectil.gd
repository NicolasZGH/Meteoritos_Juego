#Proyectil.gd
class_name Proyectil
extends Area2D

#Atributos
var velocidad:Vector2 = Vector2.ZERO
var damage:float
							   #UTILIZO "DAMAGE" EN VEZ DE "DANIO"
#Constructor
func crear(pos: Vector2, dir: float, vel: float, damage_p: int) -> void:
	position = pos
	rotation = dir
	velocidad = Vector2(vel, 0).rotated(dir)
	damage = damage_p

#Métodos
func _physics_process(delta: float) -> void:
	position += velocidad * delta

#Métodos custom
func daniar(otro_cuerpo: CollisionObject2D) -> void:
	if otro_cuerpo.has_method("recibir_damage"):
		otro_cuerpo.recibir_damage(damage)
	queue_free()

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()

func _on_Proyectil_area_entered(area: Area2D) -> void:
	daniar(area)

func _on_Proyectil_body_entered(body: Node) -> void:
	daniar(body)
