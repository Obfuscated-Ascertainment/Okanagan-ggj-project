extends Node2D

func _process(_delta: float) -> void:
	if visible == true:
		$"..".ThreatIncreaseMult = 1.3
		$"..".SurveillanceIncreaseMult = 1.3
