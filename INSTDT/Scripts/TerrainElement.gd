extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(int) var damage
export(int) var perk
export(int) var explosion_area

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("terrain")
	pass # Replace with function body.

func explode():
	print("EXPLOSION!")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
