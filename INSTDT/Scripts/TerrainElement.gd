extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
export(Dictionary) var effect

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_root().get_node("Node2D/PlayerBody")
	add_to_group("terrain")

	
func explode():
	print("EXPLOSION!")
	#Destruction upon explosion
	if(effect["destruction"]):
		if (effect["damage"]>0):
			player.take_damage()
		hide()
		queue_free()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
