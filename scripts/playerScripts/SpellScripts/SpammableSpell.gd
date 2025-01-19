extends DamageSpell

const SPELL_DAMAGE: int = 3
var pos:Vector2
var rot: float
var dir: float
var spellSpeed: float = 40

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = pos
	global_rotation = rot
	damage = SPELL_DAMAGE
	cooldown = 0.5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position += transform.x * spellSpeed
 

func _on_life_cycle_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		var enemyHit: Node = area.owner
		enemyHit.lowerHealth(damage)
		queue_free()
