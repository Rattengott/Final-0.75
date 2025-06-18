class_name Playerhit
extends Area2D

func _on_area_2d_attack_hitbox_body_entered(body: Node2D) -> void:
	if body.has_method("OnHit"):
		#area.OnHit(damage_player)
		print("i got hit")
