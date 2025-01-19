extends DamageSpell

const SPELL_DAMAGE: int = 15
var pos:Vector2
var rot: float
var dir: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = pos
	global_rotation = rot
	damage = SPELL_DAMAGE
	cooldown = 3
	position = get_global_mouse_position()
	
	
func _on_life_cycle_timeout() -> void:
	queue_free()


func _on_enemy_detection_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var enemyHit: Node = area.owner
		enemyHit.lowerHealth(damage)
