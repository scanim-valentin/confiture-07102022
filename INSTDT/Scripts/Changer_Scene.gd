extends Button

export var Scene_Cible : String


func _ready():

	connect("pressed", self, "_button_pressed")
	
func _button_pressed():
	get_tree().change_scene(Scene_Cible) 
