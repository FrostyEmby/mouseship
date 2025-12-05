extends AnimatableBody2D

var health : int = 5

func _ready() -> void:
	position = get_global_mouse_position()


func _physics_process(delta: float) -> void:
	var melee : bool = Input.is_action_pressed("melee")
	var shoot : bool = Input.is_action_pressed("shoot")
	var turn_up : bool = Input.is_action_pressed("turn_up")
	var turn_down : bool = Input.is_action_pressed("turn_down")
	var turn_left : bool = Input.is_action_pressed("turn_left")
	var turn_right : bool = Input.is_action_pressed("turn_right")
	
	# move
	position = get_global_mouse_position()
	
	# animate
	_animation()
	
	# action pressed
	if melee: _attack()
	if shoot: _shoot()
	if turn_up: _up()
	if turn_down: _down()
	if turn_left: _left()
	if turn_right: _right()


func damage(value):
	health -= value


func _attack():
	for enemy in $attack.get_overlapping_bodies():
		enemy.damage(1)


func _shoot():
	pass


func _up():
	rotate_toward(global_rotation, PI/2, PI/4)


func _down():
	rotate_toward(global_rotation, 3*PI/2, PI/4)


func _left():
	rotate_toward(global_rotation, PI, PI/4)


func _right():
	rotate_toward(global_rotation, 0, PI/4)
	
func _animation():
	if Input.is_action_just_pressed("melee"):
		$Sprite2D.frame = 1
	
	if Input.is_action_just_released("melee"):
		$Sprite2D.frame = 0
