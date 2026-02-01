extends TextureProgressBar

var relation = 0.0
var relationchange = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	relation = relation + relationchange
	value = relation


func _on_neutral_pressed() -> void:
	relationchange = 0


func _on_happy_pressed() -> void:
	relationchange = 0.2


func _on_sad_pressed() -> void:
	relationchange = -0.2
