extends Node

var player_current_attack = false

var curren_scene = "world"  #world cliffe_side
var tra

func _process(delta: float) -> void:
	if Input.is_action_pressed("options") : 
		get_tree().change_scene_to_file("res://menu.tscn")
