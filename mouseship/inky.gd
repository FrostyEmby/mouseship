extends AnimatableBody2D

var health = 1
var speed = 30


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('spawn')


func on_animation_finished() -> void:
	$AnimatedSprite2D.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var tween = create_tween()
	if $Follow.is_stopped():
		tween.tween_property($AnimatedSprite2D, "global_position", get_global_mouse_position(), $Follow.wait_time)
		$Follow.start()


func damage(value : int):
	health -= value
