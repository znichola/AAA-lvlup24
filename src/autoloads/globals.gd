extends Node

var host_ip = ""
static var IDs = ["Scrap", "CPU", "Old Fan", "Memory Bank", "SLK-655"]


var robot_power = false

func log_message(message):
	var time = "%s" % Time.get_time_string_from_system()
	print(time + " : " + message)

func log_vet_message(data : PackedByteArray):
	var time = "%s" % Time.get_time_string_from_system()
	var d = bytes_to_var(data)
	print(time, ":", d)

static var director_story = [
"
[b][Intro][/b]
[i]> log du Directeur[/i] 
4th of February… or the 18th… or are we in march… fuck knows what date or even time we are. i'm to tired or maybe too scared to check out…

i don't know how long has it been since the end of the world. however i know i'm the last fucking human standing… hahaha it could have been worse, at least i'm not not alone. she's here with me, she cares for me. but now she's dying too. 

i know those agents are made for- (pause, breathe) but i need then to gather as much of ressources left to keep the system running. i've marked the few potential places left on the map… now were should we start ?
",
# object: a big battery or smt
"
[b][Zone A - old computer shop][/b]

[i]>log du directeur[/i]
yes... yes... yes ! this is it ! perfect ! come on little robot, bring it back home ! Eevy needs it ! This is enough to hold on for another year or two !
",
# comments for items attached to object or something
"
[b]story_part[/b]
[i]> log_to_person[/i]
This_is_some_message
",
# comments for items attached to object or something
"
[b]story_part[/b]
[i]> log_to_person[/i]
This_is_some_message
",
]

static var agent_story = [
"[b][Intro][/b]
[i]> log de l'agent[/i]
the director is... weird. it's been 4 years, 28 hours and 57 minutes since my program was initiated but i never got to accomplish anything i was made for. Eevy told me to be patient. but the director is nothing but an unstable asshole. they are only looking for new computer pieces to keep her alive and she's the one manipulating to do so... this is so unfair. it's been 4 years, 28 hours and 58 minutes and yet... i didn't get to change anything...
",
# comments for items attached to object or something
"
[b]story_part[/b]
[i]> log_to_person[/i]
[i]> battery found[/i]
This_is_some_message
",
# comments for items attached to object or something
"
[b]story_part[/b]
[i]> log_to_person[/i]
This_is_some_message
",
# comments for items attached to object or something
"
[b]story_part[/b]
[i]> log_to_person[/i]
This_is_some_message
",
]


# "
# [b]story_part[/b]
# [i]> log_to_person[/i]
# This_is_some_message
# ",