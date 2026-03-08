extends Sprite2D

var click_count = 0
var base_frame = 364
var crack_frames = [371, 372, 373, 374]
var egg_top: Sprite2D
var egg_bottom: Sprite2D
var top_flying = false
var top_velocity = -150.0
var stop_y = 0.0

func _ready():
	egg_bottom = get_parent().get_node("EggBottom")
	egg_top = get_parent().get_node("EggTop")
	egg_bottom.frame = base_frame
	egg_top.frame = base_frame
	egg_top.visible = false

func _process(delta):
	if top_flying:
		egg_top.position.y += top_velocity * delta
		if egg_top.position.y <= stop_y:
			egg_top.position.y = stop_y
			top_flying = false

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			_on_click()

func _on_click():
	click_count += 1
	if click_count <= 4:
		egg_bottom.frame = crack_frames[click_count - 1]
		egg_top.frame = crack_frames[click_count - 1]
	elif click_count == 5:
		_hatch()

func _hatch():
	egg_bottom.frame = 376
	egg_top.frame = 375
	egg_top.visible = true
	stop_y = egg_bottom.position.y - 50
	top_flying = true
	print("드래곤 부화!")
