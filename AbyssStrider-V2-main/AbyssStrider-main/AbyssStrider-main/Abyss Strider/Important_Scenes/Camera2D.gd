extends Camera2D

onready var TopLeft = $Limits/TopLeft
onready var BottomRight = $Limits/BottomRight
export var target_path : NodePath
var target

func _ready():
	if target:
		position = target.posiion
	limit_top = TopLeft.position.y
	limit_left = TopLeft.position.x
	limit_bottom = BottomRight.position.y
	limit_top = BottomRight.position.x


func _process(delta):
	if !target:
		return
	position = target.position
