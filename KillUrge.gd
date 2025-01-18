extends Label

const startValue:int = 10000
var urgeRepression: int


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	urgeRepression = 10000


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(urgeRepression)

func _physics_process(delta: float) -> void:
	lowerUrgeRepression()
	if(urgeRepression < 0 ):
		pass

func lowerUrgeRepression() -> void:
	urgeRepression -= 10
func addUrgeRepression() -> void:
	urgeRepression += 1000
