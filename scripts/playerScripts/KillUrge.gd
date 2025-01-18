extends ProgressBar

const startValue:int = 10000
var urgeRepression: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = startValue
	

func _physics_process(delta: float) -> void:
	lowerUrgeRepression()
	if(urgeRepression < 0 ):
		pass

func lowerUrgeRepression() -> void:
	value -= 10
func addUrgeRepression() -> void:
	value += 1000
