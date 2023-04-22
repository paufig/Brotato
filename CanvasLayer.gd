extends CanvasLayer

export (NodePath) var player_node
onready var player = get_node(player_node)

func _process(delta):
	$TextureProgress.value = player.vida
