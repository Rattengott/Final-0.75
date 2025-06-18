class_name Player
extends CharacterBody2D

@export var enemy_inattack_range = false
@export var enemy_attack_cooldown = true
var speed: float = 450.0
var health = 100
var player_alive = true
var can_attack = true
var attacking = false
var hit = false
var pausing = false
var input_vector = Vector2.ZERO
@export var invincible = false
var dashing = false
var effect_timer : float = 0
var effect_delay : float = 0.1


@export var player_damage: int = 10 # Schaden, den der Spieler verursacht
#@onready get_node("AnimatedSprite2D/Area2D/CollisionShape2D").disabled = true
@onready var timer: Timer =$Timer
@onready var collision_shape = $CollisionShape2d



func _ready():
	#print("Warte 2 Sekunden...")
	#await get_tree().create_timer(1).timeout
	#print("Weiter geht's nach der Wartezeit!")
	pausing = false
	set_collision_mask_value(3, true)
	self.add_to_group("player")

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	update_health()
	enemy_attack()
	
	
	
	if health <= 0:
		player_alive = false
		print("player ist tot")
		#self.queue_free()
		get_tree().change_scene_to_file("res://menu.tscn")
		

	input_vector.x = Input.get_action_strength("right") - Input.get_action_strength("left") 
	input_vector.y = Input.get_action_strength("down") - Input.get_action_strength("up") 

	if Input.is_action_just_pressed("dash"):
		effect_timer = 0
		speed =+ 2000
		invincible = true
		dashing = true
		#collision_shape.disabled = true
		set_collision_mask_value(3, false)
		await get_tree().create_timer(0.1).timeout
		speed =+ 450
		invincible = false
		dashing = false
		#collision_shape.disabled = false
		set_collision_mask_value(3, true)
	velocity = input_vector * speed
	move_and_slide()
	
func update_health():
	var healthbar = $healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
	
func _on_regin_timer_timeout() -> void:
	if health < 100:
		health = health +10
		if health > 100:
				health = 100
	if health <= 0:
		health = 0
		health = 0 
		
		
		


func player():
	pass

func _on_player_hitbox_body_entered(body: Node2D) -> void:
	#if body.has_method("enemy"):
	print(body.get_groups())
	print(body)
	if body is enemy:
		print("ka")
		enemy_inattack_range = true

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true and invincible == false: 
		health -= 30
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)

func _on_player_hitbox_body_exited(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = false
	
		

		

	
	
	

func _on_attack_cooldown_timeout() -> void:
	enemy_attack_cooldown = true
	







	
	
func _process(_delta):
	
	if Input.is_action_pressed("melee_attack") and pausing == false:
		attacking = true
		timer.start()
		pausing = true
	else:
		return
		

func _on_attacking_state_timeout() -> void:
	attacking = false
	pausing = false
	
	

	
	
	pass

	#if Input.is_action_pressed("up") or Input.is_action_pressed("down") or Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		#$AnimatedSprite2D.play("default")
	#else:
		#$AnimatedSprite2D.stop()
		
	#if Input.is_action_pressed("down"):
		#scale.y = -1
	#else: scale.y = 1
	
	
	
	#if Input.is_action_just_pressed("left"):
	#	rotate(-1.5707963267948966)
	#if Input.is_action_just_released("left"):
	#	rotate(1.5707963267948966)
	#if Input.is_action_just_pressed("right"):
	#	rotate(1.5707963267948966)
	#if Input.is_action_just_released("right"):
	#	rotate(-1.5707963267948966)
	#if Input.is_action_pressed("melee_attack") and can_attack:
	#	get_node("AnimatedSprite2D/Area2D/CollisionShape2D").disabled = false
	
	
func _on_area_2d_attack_hitbox_body_entered(body: Node2D) -> void:
		EventBus.player_hit_enemy.emit(player_damage)
		#area.OnHit(damage_player)
		print("i got hit")


		
		
		
		
	#play here animation
		#can_attack = false
		#$CooldownTimer.start()
	#if hitbox.is_colliding():
		





#func _ready():
	



		
