extends Node2D

# Terrain description using characters. " " : empty ; "#" : wall (unbreakable)
var terrainArray = [
"  #####################",
"      t   *           #",
"# # # ##o ~## #o# #t# #",
"# t   #   * # #     # #",
"# #o# # ### ##t *## #~#",
"#   #   *   #   #     #",
"# ##o## #~# # # ##t ###",
"#           # #   #   #",
"### # o##~## # ### #~# #",
"#   #     * #   # #   #",
"# # # o####t# # # ##*##",
"# # #   # # o # # #   #",
"# t###*## # # #o# # ###",
"#       # #   #   #   #",
"# #*# # ~ # ###*# ### #",
"#   # # #   #     #   #",
"#~# # ##*##t#*### ### #",
"#   # # # #     #     #",
"# ###o# # # #*###*# # #",
"# #         #     # # #",
"# # # ##*## ### #t### #",
"#   #   *              ",
"####o########t#######  " ]

export(PackedScene) var wall
export(PackedScene) var breakable_wall
export(PackedScene) var flower
export(PackedScene) var tree
export(PackedScene) var dust

#Useless for now
class BlocEffects :
	var Damage: int
	var ExplosionRange: int

var spriteSize = 48 
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var generationDict = {"#": wall, "*":flower, "o":dust, "t":tree, "~": breakable_wall} 
	#Generating terrain	
	for i in range(terrainArray.size()) :
		for j in terrainArray[i].length() :
			if(terrainArray[i][j] != " ") :
				#print(generationDict[ terrainArray[i][j] ]) 
				var newwall = generationDict[ terrainArray[i][j] ].instance()
				newwall.position = Vector2(j*spriteSize,i*spriteSize)
				add_child(newwall)
					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
