extends Area2D

export var speed= 100.0;
var bombDist = 2;
var screen_size;
var  direction;
var sp
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(1,0)
	sp = get_node("Sprite")
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_move(delta);
	_flip()
	if Input.is_action_just_pressed("Put_Bomb"):
		_put_Bomb()

func _flip():
	if direction.x > 0:
		sp.scale.x = 1 
	else:
		sp.scale.x = -1
	if direction.y > 0: 
		sp.scale.y = 1
	else:
		sp.scale.y = -1
	
func _move(delta):
	var velocity = Vector2.ZERO
	
	if(Input.is_action_pressed("move_up")):
			direction =	Vector2(direction.x,-1)
			velocity.y -= speed
	if(Input.is_action_pressed("move_down")):
			direction =	Vector2(direction.x,1)
			velocity.y += speed
	if(Input.is_action_pressed("move_left")):
			direction =	Vector2(-1,direction.y)
			velocity.x -= speed
	if(Input.is_action_pressed("move_right")):
			direction =	Vector2(1,direction.y)
			velocity.x += speed
	position += velocity*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func _put_Bomb():
		var bomb = load("res://Bomb.tscn").instance()
		get_tree().get_root().add_child(bomb)
		bomb.position = position * direction + bombDist * direction
