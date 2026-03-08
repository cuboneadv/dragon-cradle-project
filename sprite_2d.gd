extends Sprite2D

var frame_count = 4
var fps = 8
var timer = 0.0

func _process(delta):
	timer += delta
	if timer >= 1.0 / fps:
		timer = 0.0
		frame = (frame + 1) % frame_count
