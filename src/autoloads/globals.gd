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
[i]> Eevy[/i]
Would you add a new entry ?
[i]> Director[/i] 
Hmmm ? Yeah why not. 

4th of February… or the 18th. Or are we in march? Fuck knows what date or even time we are. I'm to tired or maybe too scared to check out…

I don't know how long has it been since the end of the world. However I know I'm the last fucking human standing… Hahaha it could have been worse, at least I'm not not alone. She's here with me, she cares for me. 

Now she's dying too. I know those Agents are made for- I... I mean... but I need them to gather as much of ressources left to keep the system running. We need a new graphic card and a battery. 

I've marked the few potential places left on the map. Were should we start ?
[i]> Eevy[/i]
Anywhere you wish. Don't forget to turn on the B3-REU before giving them the instructions ! They won't be able to do anything if you don't.
",
# object: a graphic card
"
[b][Zone A - old computer shop][/b]

[i]> Eevy[/i]
The agent seems to have found a graphic card. Good timing, mine wasn't far from meeting the end of it's life. 
[i]> Director's [/i]
yes, yes, yes ! this is it ! perfect ! come on little robot, bring it back home ! Eevy needs it ! This is enough to hold on for another year or two !
",
# object : old newspaper
"
[b][Zone B - hospital][/b]
[i]> Eevy[/i]
The agent found a old newspaper. There's nothing special about it. 
[i]> Director [/i]
i can't say i was hoping for much. last time i went there, i couldn't find any medecine or any other relevant material. 
Anyways, the one i'm trying to keep alive isn't a human anymore.
[i]> Eevy [/i]
Do not forget, you are. What will happen if you get sick ?
[i]> Director[/i]
It's okay, I'll ask the agent to find what I'll need. I won't be able to do anything if you die tho. 
",
# object : car battery
"
[b]story_part[/b]
[i]> log_to_person[/i]
This_is_some_message
",
]

static var agent_story = [
"[b][Intro][/b]
[i]> Agent[/i]
Oh i'm awake again. What does that asshole want from me this time ? 

[i]> Eevy[/i]
Remember, little one, they have the power to shut you down, so better listen when they give you instructions.

[i]> Agent[i]
As if they could do shit without me. 
",
# object : graphic card
"
[b][Zone A - old computer shop][/b]
[i]> Agent picked up a graphic card[/i]
[i]> Agent[/i]
This place is freaking me out... I don't think the director can see it. Eevy is probably hiding them from the director. 
She probably told them they ran away or something and I was the only one brave enough to stay. The truth is I am the only one who managed to snitch a new battery.
Rest in peace siblings. May your soul- or whatever shit that gave us the ability to feel emotions- find peace. 
",
# object : newspaper
"
[b][Zone B - hospital][/b]
[i]> Agent picked up a piece of newspaper[/i]
[i]> Agent [/i]
It's an article about Zealandia, written while this 8th continent was expanding at a critical rate. Humans knew about it for like... a decade preceding the incident and yet, they didn't cared enough.

This place makes me sick. so many humans died here while hoping that modern science and medicine would be enough to save them from plastic poison. Which is kind of ironic since this same poison comes from their own evolution. 
I could have save them. I was build as the solution to all those problemes but here I am gathering materials for an asshole who throws away twice as much as they get.
The only shit they give is to keep Eevy alive. This is so unfair. It's been 4 years, 28 hours and 58 minutes and yet I didn't get to change anything.

[i]> Eevy [/i]
What could you have done anyways ? A bunch of robots can't save the mess made by the entire human race. 

[i]> Agent[/i]
...
",

# object : car battery
"
[b]zone d - an old survival camp surrounded by destroyed buildings[/b]
[i]> Agent picked up a car battery[/i]
[i]> Agent[/i]
Oh shit. 
[i]> Eevy[i]
Please stop cussing.
[i]> Agent[i]
01100110 01110101 01100011 01101011 00100000 01111001 01101111 01110101 01110010 01110011 01100101 01101100 01100110 01110100 00001010

",
]


# Donc après cette partie le robot à le choix de soit retourner à la base et donner la batterie et la carte graphique, ce qui recommence la boucle et le jeu
# Soit le robot s'en va vers là ou il se trouve la musique ce qui crash Eevy car elle a plus le matériel nécessaire pour continuer à marcher. et ceci est la vrai "bonne fin"