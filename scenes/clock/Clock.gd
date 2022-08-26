extends Node2D

var time;
var initial_hour = 7;

func _ready():
	for i in range(541):
		yield(get_tree().create_timer(1), "timeout")
		update_time(i * 60)
	print('shift finished')

func update_time(seconds):
	var formated_seconds = format_seconds(seconds)
	var minutes = formated_seconds[1] 
	var hour = formated_seconds[0]
	
	var formated_minutes = str(minutes) if minutes >= 10 else '0' + str(minutes)  
	var formated_hour = str(hour) if hour >= 10 else '0' + str(hour)
	$RichTextLabel.text = formated_hour + ':' + formated_minutes
	
func format_seconds(seconds):
	var minutes = (seconds / 60) % 60
	var hours = (seconds / 3600) + initial_hour
	
	return [hours, minutes]

