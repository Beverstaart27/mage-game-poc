extends enemy

const MAXHEALTH: int = 10
@onready var detection_area: Area2D = $Area2D
# Adjustable variables
@export var speed: float = 100.0
var target_position: Vector2 = Vector2.ZERO
var player_detected: bool = false
# Connect signals and initialize
func _ready():
	# Connect the signals properly
	detection_area.body_entered.connect(_on_area_body_entered)
	detection_area.body_exited.connect(_on_area_body_exited)

func _process(delta: float) -> void:
	if player_detected:
		var direction = (target_position - position).normalized()
		var movement = direction * speed * delta
		position += movement  # Moving the Node2D manually

# Signal handlers
func _on_area_body_entered(body):
	if body.name == "Player":  # Replace "Player" with your player's actual node name
		target_position = body.global_position
		player_detected = true

func _on_area_body_exited(body):
	if body.name == "Player":
		player_detected = false
