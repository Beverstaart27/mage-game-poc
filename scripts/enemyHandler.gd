extends Timer

const TIME_BTWN_SPAWN = 4
var timeBtwnSpawn: int #voor als je later tijdens runtime de tijd wil verlagen
var canSpawn: bool
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

@onready var enemy1: PackedScene = preload("res://scenes/enemy_1.tscn")
func _ready() -> void:
	wait_time = TIME_BTWN_SPAWN
	canSpawn = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if canSpawn:
		print("spawn")
		canSpawn = false
		var enemy: Node2D = enemy1.instantiate()
		enemy.position = Vector2(getRandomNumber(), getRandomNumber())
		add_child(enemy)
		start()

func getRandomNumber() -> int:
	return rng.randi_range(-100, 100)


func _on_timeout() -> void:
	canSpawn = true
