extends Node

var player_current_attack = false
var enemy = preload("res://enemy.tscn")
#var enemy_ref = enemy_instance
var death = false

   


var curren_scene = "world"  #world cliffe_side
@onready var target_node = get_node("Enemy2")

func _process(delta: float) -> void:
	if Input.is_action_pressed("options") : 
		get_tree().change_scene_to_file("res://menu.tscn")
		
	#if is_instance_valid(enemy_ref):
		#pass
	#else:
	#	print("Enemy destroyed")



func _player_hit_enemy():
	pass

func test():
	print("Erfolgreich")
	target_node.blub()



func _on_spawn_timer_timeout():

	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.position = $SpawnLocation.position
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi() % nodes.size()]
	var position = node.position
	$SpawnLocation.position = position
	if death == true:
		remove_child(enemy_instance)
		enemy_instance.queue_free
func blib():
	death = true
	
	
	
	
