extends AnimatableBody2D

enum Directions {NORTH, WEST, SOUTH, EAST}
@export var direction : Directions = Directions.NORTH

var speed : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	speed = randi_range(10,30)
	
	match direction:
		Directions.NORTH:
			rotation_degrees = 0
		Directions.SOUTH:
			rotation_degrees = 180
		Directions.WEST:
			rotation_degrees = 270
		Directions.EAST:
			rotation_degrees = 90


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	match direction:
		Directions.NORTH:
			position.y -= speed
		Directions.SOUTH:
			position.y += speed
		Directions.WEST:
			position.x -= speed
		Directions.EAST:
			position.x += speed


func screen_exited() -> void:
	visible = false
	set_process(false)
