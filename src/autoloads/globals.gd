extends Node

var host_ip = ""
static var IDs = ["Scrap", "CPU", "Old Fan", "Memory Bank", "SLK-655"]


func log_message(message):
	var time = "%s" % Time.get_time_string_from_system()
	print(time + " : " + message)

func log_vet_message(data : PackedByteArray):
	var time = "%s" % Time.get_time_string_from_system()
	var d = bytes_to_var(data)
	print(time, ":", d)
	#print(time + " : " + d[0] + "-" + d[1])
