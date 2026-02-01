extends Node2D
var Idiot = false
var Police = false
var Empathetic = false
var Paranoid = false
var Drunk = false
var TraitList = [Idiot,Police,Empathetic,Paranoid,Drunk]
var CurrentTraits = []

func generatetarget():
	var LoopTraits = true
	while LoopTraits == true:
		if randi_range(1 + $"..".KillCount,5 + $"..".KillCount) >= 5:
			CurrentTraits.append(TraitList[randi_range(0,TraitList.size() - 1)])
		else:
			LoopTraits = false

func _process(_delta: float) -> void:
	if $".".visible == true: #change later
		if Idiot == true:
			$"..".ThreatIncreaseMult = 0.7
			$"..".SurveillanceIncreaseMult = 0.7
		if Police == true:
			$"..".SurveillanceIncreaseMult = 1.3
		if Empathetic == true:
			$"..".RelationsIncreaseMult = 1.3
			$"..".RelationsDecreaseMult = 1.3
		if Paranoid == true:
			$"..".RelationsIncreaseMult = 0.7
			$"..".ThreatIncreaseMult = 1.3
		if Drunk == true:
			$"..".RelationsIncreaseMult = 1.3
			$"..".SurveillanceIncreaseMult = 1.3
		$"..".TargetPresent = true
	else:
		$"..".ThreatIncreaseMult = 1.0
		$"..".SurveillanceIncreaseMult = 1.0
	#pass
	
func die():
	pass
	
func leave():
	$"..".TargetPresent = false
	$".".visible = false
	
