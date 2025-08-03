class_name Player
extends CharacterBody2D

var player_direction: Vector2

@onready var footstep_player = $FootstepPlayer
var footstep_sounds: Array[AudioStream] = []

var step_timer := 0.0
const STEP_INTERVAL := 0.4

func _ready():
	# Preload your footstep sounds into the array
	footstep_sounds = [
		preload("res://scenes/audio/Footstep1.mp3"),
		preload("res://scenes/audio/Footstep2.mp3"),
		preload("res://scenes/audio/Footstep3.mp3")
	]

func _physics_process(delta):
	var is_moving = abs(velocity.x) > 3 or abs(velocity.y) > 3

	if is_moving:
		step_timer -= delta
		if step_timer <= 0.0:
			play_random_footstep()
			step_timer = STEP_INTERVAL
	else:
		step_timer = 0.0

func play_random_footstep():
	var index = randi() % footstep_sounds.size()
	footstep_player.stream = footstep_sounds[index]
	footstep_player.play()
