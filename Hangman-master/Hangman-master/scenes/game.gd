extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var counter

signal game_over
signal win
signal reset

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	counter = 0

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_word_notthere():
	
	
	counter = counter + 1
	print(counter)
	match counter:
		4: $hangman/head.show()
		5: $hangman/torso.show()
		6: $hangman/right_arm.show()
		7: $hangman/left_arm.show()
		9: $hangman/right_leg.show()
		8: $hangman/left_leg.show()
		1: $hangman/pole_2.show()
		2: $hangman/pole.show()
		3: $hangman/rope.show()
	if counter == 9:
		emit_signal("game_over")


func _on_word_goodjob():
	emit_signal("win")


func _on_ui_start_over():
	emit_signal("reset")


func _on_game_reset():
	counter = 0
	for i in $hangman.get_children():
		i.visible = false
		
