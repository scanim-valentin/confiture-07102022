extends RigidBody2D

var bombAnim: AnimatedSprite
var timer : float  = 0; 
var explode : bool = false;
export var timerCD : float = 2;
var collided : bool = false
var explosionCollide1 : CollisionShape2D
var explosionCollide2 : CollisionShape2D
var ar : Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	ar = get_node("Area2D")
	explosionCollide1 = get_node("Area2D/Exp1")
	explosionCollide2 = get_node("Area2D/Exp2")
	bombAnim = get_node("AnimatedSprite")
	bombAnim.animation = "Idle"
	bombAnim.play()
	connect("visibility_changed",self,"_detect")
	contact_monitor = true
	contacts_reported = 8


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta 
	if not explode: 
		_bomb_Explode(timer)
	if !collided:
		for b in  ar.get_overlapping_bodies():
			if(b.is_in_group("terrain")):
				b.explode()
				collided = true
			if(b.is_in_group("player")):
				collided = true
				b.kill()
		
func _bomb_Explode(tim):
	if tim >= timerCD:
		explode = true
		bombAnim.animation = "Explode"
		bombAnim.play()
		_check_Explosion()		
		bombAnim.connect("animation_finished",self,"queue_free")
		
		
func _check_Explosion():
	add_to_group("bomb")
	explosionCollide1.disabled = false 
	explosionCollide2.disabled = false 

func _detect(node):
	print("PLS")
	if node.is_in_group("terrain"):
		node.explode()
		pass
	
