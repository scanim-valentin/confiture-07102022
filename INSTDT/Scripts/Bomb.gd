extends Area2D

var timer : float  = 0; 
export var timerCD : float = 2;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= timerCD:
		queue_free()
	pass
