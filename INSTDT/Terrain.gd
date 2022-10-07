extends Node2D

# Terrain description using characters. " " : empty ; "#" : wall (unbreakable)
var terrainArray = [
"  #####################",
"  # # #   #           #",
"# # # ### ### ### ### #",
"# #   #   # # #     # #",
"# ### # ### ### ### ###",
"#   #   #   #   #     #",
"# ##### ### # # ### ###",
"#           # #   #   #",
"### # ##### # ### ### #",
"#   #     # #   # #   #",
"# # # ####### # # #####",
"# # #   # # # # # #   #",
"# ####### # # ### # ###",
"#       # #   #   #   #",
"# ### # # # ##### ### #",
"#   # # #   #     #   #",
"### # ########### ### #",
"#   # # # #     #     #",
"# ##### # # ####### # #",
"# #         #     # # #",
"# # # ##### ### ##### #",
"#   #   #              ",
"#####################  " ]

export(PackedScene) var wall
var spriteSize = 24 
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(terrainArray.size()) :
		for j in terrainArray[i].length() :
			match terrainArray[i][j] : 
				'#':
					var newwall = wall.instance()
					newwall.position = Vector2(j*spriteSize,i*spriteSize)

					


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
