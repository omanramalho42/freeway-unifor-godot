extends Area2D

@export var SPEED:float = 100.0
var SCREEN_SIZE: Vector2
var INITIAL_POSITION: Vector2 = Vector2(640, 690)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SCREEN_SIZE = get_viewport_rect().size
	position = INITIAL_POSITION

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	if direction != Vector2.ZERO:
		direction = direction.normalized() * SPEED

	position += direction * delta
	
	if direction.y > 0:
		$AnimatedSprite2D.play("down")
	if direction.y < 0:
		$AnimatedSprite2D.play("up")
	else:
		$AnimatedSprite2D.stop()


func _on_body_entered(body):
	if body.name == 'finish_line':
		emit_signal('point')
	else:
		$Audio.play()
		position = INITIAL_POSITION
