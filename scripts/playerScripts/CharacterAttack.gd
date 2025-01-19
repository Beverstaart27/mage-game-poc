extends Node2D

const SPELLSPRITE1 = preload("res://scenes/spellScenes/basic_spell_1.tscn")
const SPELLSPRITE2 = preload("res://scenes/spellScenes/BigSpell.tscn")
const SPELLSPRITE3 = preload("res://scenes/spellScenes/AreaSpell.tscn")
@onready var spawnLocation: Marker2D = $SpellSpawnLocation

@onready var spell1: DamageSpell = get_node("../basic_spell_1.tscn") #hahahahhaha deze zijn null :D:D:D::D:D:D:D:D:D:D::D:D:D:D:D:D:D:D:D:D
@onready var spell2 = get_node("../BigSpell.tscn")

@onready var urge = get_node

var onCooldown1:bool = false
var onCooldown2:bool = false
var onCooldown3:bool = false 

var cooldownTime1 = 0.5 
var cooldownTime2 = 3
var cooldownTime3 = 5


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("fire_spell_LMB") && !onCooldown1:
		print(onCooldown3)
		shootSpell(1, cooldownTime1)
		#print("i say what what")
		
	if Input.is_action_just_pressed("fire_spell_Q") && !onCooldown2:
		shootSpell(2, cooldownTime2)
		#print("in the butt")
		
	if Input.is_action_just_pressed("fire_spell_E") && !onCooldown3:
		print("hehehe")
		shootSpell(3, cooldownTime3)
		#print("in the butt")

func shootSpell(spell: int, cooldown: float) -> void:
	var spell_instance
	
	match spell:
		1:
			onCooldown1 = true
			$spell1Cooldown.start(cooldown) 
			spell_instance = SPELLSPRITE1.instantiate()
			get_tree().root.add_child(spell_instance)
			spell_instance.global_position = spawnLocation.global_position
			spell_instance.rotation = rotation
		2: 
			onCooldown2 = true
			$spell2Cooldown.start(cooldown) 
			spell_instance = SPELLSPRITE2.instantiate()
			get_tree().root.add_child(spell_instance)
			spell_instance.global_position = spawnLocation.global_position
			spell_instance.rotation = rotation
		3:
			onCooldown3 = true
			$spell3Cooldown.start(cooldown) 
			spell_instance = SPELLSPRITE3.instantiate()
			get_tree().root.add_child(spell_instance)
			spell_instance.global_position = get_global_mouse_position()

func _on_spell_1_cooldown_timeout() -> void:
	#print("1")
	onCooldown1 = false 
	
func _on_spell_2_cooldown_timeout() -> void:
	#print("2")
	onCooldown2 = false
func _on_spell_3_cooldown_timeout() -> void:
	onCooldown3 = false
