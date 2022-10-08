extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(Dictionary) var effect

# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("terrain")
	pass # Replace with function body.

	
func explode():
	print("EXPLOSION!")
	#Destruction upon explosion
	if(effect["destruction"]):
		hide()
		queue_free()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
