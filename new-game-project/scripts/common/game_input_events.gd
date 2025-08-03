class_name GameInputEvents

static func movement_input() -> Vector2:
	var dir := Vector2.ZERO

	# sum both X directions
	if Input.is_action_pressed("walk_left"):
		dir.x -= 1
	if Input.is_action_pressed("walk_right"):
		dir.x += 1

	# sum both Y directions
	if Input.is_action_pressed("walk_up"):
		dir.y -= 1
	if Input.is_action_pressed("walk_down"):
		dir.y += 1

	# normalize so diagonal isn't faster
	if dir != Vector2.ZERO:
		dir = dir.normalized()

	return dir

static func is_movement_input() -> bool:
	return movement_input() != Vector2.ZERO
