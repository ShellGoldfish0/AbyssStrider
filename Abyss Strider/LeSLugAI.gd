#We are small, but we are legion

extends KinematicBody2D

onready var player = get_node("/root/LEVEL_ONE/Player")
var target = null
var velocity = Vector2.ZERO
var hit_pos
var laserColor = Color(1, 0.329, 0.289)
var spawn 

func _ready():
	spawn = position
	print(player)
	print(target)
	print("hehe")

func _process(_delta):
	update()
	if target:
		slugSight()
	else: 
		velocity = position.direction_to(spawn) * 1
		velocity = move_and_collide(velocity)

func slugSight():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(position, target.position, [self])
	if result:
		hit_pos = result.position
		if result.collider.name == "Player":
			velocity = Vector2.ZERO
			if target != null:
				velocity = position.direction_to(target.position) * 1
			velocity = move_and_collide(velocity)

#this shows raycasting
#position, radius, color
func _draw():
	var slug = $Sprite
	if target:
		draw_line(slug.position, (hit_pos - position), laserColor)
		

func _on_Detection_body_entered(body):
	if body == player: 
		print("he knows of you.")
		target = body
		print(target)


func _on_Detection_body_exited(body):
	target = null
	print("Ninja go amazing.")
