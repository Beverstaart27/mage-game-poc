extends enemy

const MAX_HEALTH: float = 10.0
var speed: int = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * speed
		move_and_slide()
