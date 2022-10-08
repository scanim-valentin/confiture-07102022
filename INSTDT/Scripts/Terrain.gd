extends Node2D

# Terrain description using characters. " " : empty ; "#" : wall (unbreakable)
var terrainArray = [
"  #####################",
"  # # #   *           #",
"# # # ### ### ### ### #",
"# #   #   * # #     # #",
"# ### # ### ### ### ###",
"#   #   *   #   #     #",
"# ##### ### # # ### ###",
"#           # #   #   #",
"### # ##### # ### ### #",
"#   #     * #   # #   #",
"# # # ####### # # #####",
"# # #   # # # # # #   #",
"# ####### # # ### # ###",
"#       # #   #   #   #",
"# ### # # # ##### ### #",
"#   # # #   #     #   #",
"### # #######*### ### #",
"#   # # # #     #     #",
"# ##### # # ####### # #",
"# #         #     # # #",
"# # # ##### ### ##### #",
"#   #   #              ",
"#####################  " ]

export(PackedScene) var wall
export(PackedScene) var breakable_wall
export(PackedScene) var flower
export(PackedScene) var plant2
export(PackedScene) var plant3
export(PackedScene) var dust

var spriteSize = 24 
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(terrainArray.size()) :
		for j in terrainArray[i].length() :
			match terrainArray[i][j] : 
				'#':
					var newwall = wall.instance()
					newwall.position = Vector2(j*spriteSize,i*spriteSize)
					add_child(newwall)
				"*":
					var newwall = flower.instance()
					newwall.position = Vector2(j*spriteSize,i*spriteSize)
					add_child(newwall)
					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
