extends RigidBody2D

func _ready():
	var cars_types = $Animacao.sprite_frames.get_animation_names()
	var car = cars_types[randi_range(0, cars_types.size() -1)]
	$Animacao.animation = car

func _process(delta):
	pass

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
