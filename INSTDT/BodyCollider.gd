extends KinematicBody2D

export var speed= 100.0;
export var bombDist = 40;

var hp : int
export var maxHP = 10;
var anim: AnimatedSprite; 
var screen_size;
var  direction; 
var isDead : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	anim = get_node("AnimatedSprite")
	direction = Vector2(1,0)
	screen_size = get_viewport_rect().size
	set_maxHP()
	print(hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not isDead:
		_move(delta);
		if not anim.is_playing():
			anim.play()
		if Input.is_action_just_pressed("Put_Bomb"):
			_put_Bomb()
	
func _move(delta):
	var velocity = Vector2.ZERO
	if(Input.is_action_pressed("move_up")):
		direction =	Vector2(0,-1)
		anim.animation = "Walk_Up"
		move_and_slide(Vector2(0,-100),Vector2(0,0),false,4,0.78,false)
	elif(Input.is_action_pressed("move_down")):
		direction =	Vector2(0,1)
		anim.animation = "Walk_Down"
		move_and_slide(Vector2(0,100),Vector2(0,0),false,4,0.78,false)
	elif(Input.is_action_pressed("move_left")):
		direction =	Vector2(-1,0)
		anim.animation = "Walk_Left"
		move_and_slide(Vector2(-100,0),Vector2(0,0),false,4,0.78,false)
	elif(Input.is_action_pressed("move_right")):
		direction =	Vector2(1,0)
		anim.animation = "Walk_Right"
		move_and_slide(Vector2(100,0),Vector2(0,0),false,4,0.78,false)
	else:
		if direction.x == -1: 
			anim.animation = "Idle_Left"
		elif direction.x == 1:
			anim.animation = "Idle_Right"
		elif direction.y == -1:
			anim.animation = "Idle_Up"
		elif direction.y == 1:
			anim.animation = "Idle_Down"

	position += velocity*delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	 
func _put_Bomb():
	print(bombDist)	
	var bomb = load("res://Bomb.tscn").instance()
	get_tree().get_root().add_child(bomb)
	bomb.position = position + Vector2(direction.x*bombDist,direction.y*bombDist) 

func kill():
	print("I'm dying")
	anim.animation = "ded"
	isDead= true	
func _bomb_detect():
	print("Bomb ?")
	
func take_damage(value):
	hp -= value;

func set_maxHP ():
	hp = maxHP;
	
