extends Node2D

var locker_open

func _ready():
	for i in range(24) :
		get_node('Locker' + str(i + 1)).connect('locker_open', self, "close_previous", [i+1])

func close_previous(x):
	if locker_open != null and locker_open != get_node("Locker" + str(x)):
		locker_open.close()
	locker_open = get_node("Locker" + str(x))

