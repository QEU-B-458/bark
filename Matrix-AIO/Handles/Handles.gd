extends Control

var resizeing := false
var resizing_node : Control

func _on_right_gui_input(event):
	if event is InputEventMouseButton:
		_gui_resize_handles(event, $Right)

func _on_bottom_gui_input(event):
	if event is InputEventMouseButton:
		_gui_resize_handles(event, $Bottom)

func _on_corner_gui_input(event):
	if event is InputEventMouseButton:
		_gui_resize_handles(event, $Corner)

func _on_corner_mouse_entered():
	print("mouse")
	 # Replace with function body.

# we have turned on window borderless and making the resize handles manualy for now

func _gui_resize_handles(event: InputEventMouseButton, node: Control) -> void:
	if event.button_index == 1:
		if !resizeing:
			resizing_node = node
		resizeing = event.pressed
	
func _process(delta: float) -> void:
	if resizeing:
		var scene = get_tree().current_scene
		if resizing_node in [$Bottom, $Corner]:
			get_window().size.y = int(scene.get_global_mouse_position().y)
		if resizing_node in [$Right, $Corner]:
			get_window().size.x = int(scene.get_global_mouse_position().x)
	



