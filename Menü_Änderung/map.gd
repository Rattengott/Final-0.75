extends Node

var player_current_attack = false

var curren_scene = "world"  #world cliffe_side
@onready var target_node = get_node("Enemy2")

func _process(delta: float) -> void:
	if Input.is_action_pressed("options") : 
		get_tree().change_scene_to_file("res://menu.tscn")



func _player_hit_enemy():
	pass

func test():
	print("Erfolgreich")
	target_node.blub()
