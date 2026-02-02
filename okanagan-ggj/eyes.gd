extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"..".h_offset = randi_range(-1, 1)
	$"..".v_offset = randi_range(-1, 1)
	var tween = create_tween()
	tween.tween_property($"..", "progress_ratio", 0.005, 0.001)
	tween.tween_property($"..", "progress_ratio", 0.0, 0.001)
	$"..".progress += 0.005
