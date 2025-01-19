extends ProgressBar

const startValue:int = 10000
var urgeRepression: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	value = startValue
	

func _physics_process(_delta: float) -> void:
	lowerUrgeRepression()
	if urgeRepression < 0 :
		pass
		
	if value < startValue/2:
		fireRandomSpell()

func lowerUrgeRepression() -> void:
	value -= 10
	
func addUrgeRepression() -> void:
	value += 1000
	
func fireRandomSpell() -> void:
	var player = self.get_parent().get_child(0)
	
