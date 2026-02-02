extends Node2D
var Idiot = false
var Police = false
var Empathetic = false
var Paranoid = false
var Drunk = false
var TraitList = [Idiot,Police,Empathetic,Paranoid,Drunk]
var CurrentTraits = []
var ScenarioFatherDied = "The victim's father passed away"
var ScenarioPromotion = "The victim recently recieved a promotion"
var ScenarioNationalHoliday = "The state has declared today to be a national holiday"
var ScenarioParty = "You are attending a party thrown by the victim"
var ScenarioYourFriendDied = "One of your \"friends\" recently died"
var ScenarioList = [ScenarioFatherDied,ScenarioPromotion, ScenarioNationalHoliday, ScenarioParty, 
ScenarioYourFriendDied, ]
var CurrentScenario
var CurrentScenarioName

func _ready() -> void:
	generatetarget()
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

func generatetarget():
	var LoopTraits = true
	while LoopTraits == true:
		if randi_range(1 + $"..".KillCount,5 + $"..".KillCount) >= 5 and CurrentTraits.size() < TraitList.size():
		#if randi_range(1,2) >= 2:
			CurrentTraits.append(TraitList[randi_range(0,TraitList.size() - 1)])
		else:
			LoopTraits = false
	var ScenarioSelection = randi_range(0,ScenarioList.size() - 1)
	CurrentScenarioName = str(ScenarioList[ScenarioSelection])
	CurrentScenario = ScenarioList[ScenarioSelection]
	print(ScenarioList.size())
	
	$"Label".text = CurrentScenario

func _process(_delta: float) -> void:
	pass
	
func die():
	pass
	
func leave():
	$"..".TargetPresent = false
	$".".visible = false
	
