extends Button

@onready var button = $MyButton


func _ready():
	# Button Style anpassen
	var style = StyleBoxFlat.new()
	style.bg_color = Color(0.5, 0, 0.5)  # Lila
	style.border_color = Color(1, 0.84, 0)  # Gold
	style.border_width_left = 3
	style.border_width_top = 3
	style.border_width_right = 3
	style.border_width_bottom = 3
	button.add_theme_stylebox_override("normal", style)
	button.add_theme_stylebox_override("hover", style)
	button.add_theme_stylebox_override("pressed", style)

	# Optional: Textfarbe anpassen
	button.add_theme_color_override("font_color", Color.WHITE)
