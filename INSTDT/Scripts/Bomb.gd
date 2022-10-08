extends RigidBody2D

var bombAnim: AnimatedSprite
var timer : float  = 0; 
var explode : bool = false;
export var timerCD : float = 2;

var explosionCollide1 : CollisionShape2D
var explosionCollide2 : CollisionShape2D
# Called when the node enters the scene tree for the first time.
func _ready():
	#explosionCollide1 = get_node("Explosion1")
	#explosionCollide2 = get_node("Explosion2")
	bombAnim = get_node("AnimatedSprite")
	bombAnim.animation = "Idle"
	bombAnim.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta 
	if not explode: 
		_bomb_Explode(timer)
			

func _bomb_Explode(tim):
	if tim >= timerCD:
		explode = true
		bombAnim.animation = "Explode"
		bombAnim.play()
		#_check_Explosion()
		bombAnim.connect("animation_finished",self,"queue_free")
		
func _check_Explosion():
	explosionCollide1.disabled = false
	explosionCollide2.disabled = false

	
