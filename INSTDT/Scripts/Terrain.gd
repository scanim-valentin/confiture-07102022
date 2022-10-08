extends Node2D

# Terrain description using characters.
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


var spriteSize = 48 
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var effectArray = [
		{
	"damage" : 1,
	"explosionRange" : 1,
	"destruction": true
	},
	{
	"damage" : 2,
	"explosionRange" : 0,
	"destruction": true
	},
	{
	"damage" : -1,
	"explosionRange" : 0,
	"destruction": true 
	},
	{
	"damage" : -2,
	"explosionRange" : 2,
	"destruction": true 
	}]
	effectArray.shuffle()
	var generationDict = {"#": {"bloc": wall,           "effect": {"damage": 0, 
																   "explosionRange": 0, 
																   "destruction": false}},
						  "*": {"bloc": flower,         "effect":effectArray[0]}, 
						  "o": {"bloc": dust,           "effect":effectArray[1]}, 
						  "t": {"bloc": tree,           "effect":effectArray[2]}, 
						  "~": {"bloc": breakable_wall, "effect":effectArray[3]}} 
	
	#Generating terrain	
	for i in range(terrainArray.size()) :
		for j in terrainArray[i].length() :
			if(terrainArray[i][j] != " ") :
#				print(generationDict[ terrainArray[i][j] ]["bloc"]) 
				var newwall = generationDict[ terrainArray[i][j] ]["bloc"].instance()
				newwall.effect = generationDict[ terrainArray[i][j] ]["effect"]
				newwall.position = Vector2(j*spriteSize,i*spriteSize)
				add_child(newwall)
					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
