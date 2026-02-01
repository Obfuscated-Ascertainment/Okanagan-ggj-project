extends Node2D
var Relations = 0
var Surveillance = 0
var Threat = 0

func _ready() -> void:
	$RelationsBar.value = 0.0
	$SurveillanceBar.value = 0.0
	$ThreatBar.value = 0.0

func _on_loud_pressed() -> void:
	Relations = 1
	Surveillance = 0
	Threat = 1


func _on_happy_pressed() -> void:
	Relations = 1
	Surveillance = -1
	Threat = 0


func _on_sad_pressed() -> void:
	Relations = -1
	Surveillance = 0
	Threat = -1

func _on_nonchalant_pressed() -> void:
	Relations = -1
	Surveillance = -1
	Threat = 0

func _on_alert_pressed() -> void:
	Relations = 0
	Surveillance = -1
	Threat = 1

func _process(_delta: float) -> void:
	if Relations == 1:
		$RelationsBar.value += 0.2
	elif Relations == -1:
		$RelationsBar.value -= 0.2
	if Surveillance == 1:
		$SurveillanceBar.value += 0.2
	elif Surveillance == -1:
		$SurveillanceBar.value -= 0.2
	if Threat == 1:
		$ThreatBar.value += 0.2
	elif Threat == -1:
		$ThreatBar.value -= 0.2
	
	if $RelationsBar.value >= 75:
		$SurveillanceBar.value += 0.2
	if $RelationsBar.value <= 25:
		$ThreatBar.value += 0.2
	
	if $ThreatBar.value >= 100:
		lost()
	
	
	#print(Relations)
	print("Sureillance: " + str($SurveillanceBar.value))
	print("Relations: " + str($RelationsBar.value))
	print("Threat: " + str($ThreatBar.value))
		
func kill():
	if $SurveillanceBar.value >= 75: #surveillance  must be low enough for successful kill
		lost()
	else:
		if $SurveillanceBar.value <= 60:
			$SurveillanceBar.value += 40
		else:
			$SurveillanceBar.value += 100 - $SurveillanceBar.value 
	

func lost():
	pass
