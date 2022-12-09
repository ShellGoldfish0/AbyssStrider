extends KinematicBody2D


var speed = 600

func _physics_process(_delta):
	var vel = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
		)
		
	if Input.is_action_just_pressed("Interact") and $RayCast2D.is_colliding():
		
		print("pressed")
		var collider = $RayCast2D.get_collider()
		
		if collider.has_method("_on_interact") :
			collider._on_interact()
		else:
			return
	
	move_and_slide(vel * speed)
