extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 50

func _play_if_changed(anim_name):
	if animated_sprite_2d.animation != anim_name:
		animated_sprite_2d.play(anim_name)

func _on_physics_process(_delta):
	var raw = GameInputEvents.movement_input()
	if raw == Vector2.ZERO:
		transition.emit("Idle")
		return

	# dominant‐axis face direction
	var face := Vector2.ZERO
	if abs(raw.x) > abs(raw.y):
		face.x = sign(raw.x)
	else:
		face.y = sign(raw.y)

	player.player_direction = face
	player.velocity = raw * speed
	player.move_and_slide()

	match face:
		Vector2.UP:    _play_if_changed("walk_back")
		Vector2.DOWN:  _play_if_changed("walk_front")
		Vector2.LEFT:  _play_if_changed("walk_left")
		Vector2.RIGHT: _play_if_changed("walk_right")
