world
	name = "Space Sweeper"
	hub = "MechaDestroyerJD.SpaceSweeper"
	hub_password = ""
	turf = /turf/Space
	map_format = TILED_ICON_MAP
	view = 9

var
	level = 0
	players = 0
	limit = 1
	specs
	boss

client
	command_text = ".alt "

mob
	Move()
		if(src.locked)
			return
		else
			..()


mob
	name = "Space Sweeper"
	var
		shooting = 0
		lives = 5
		points
		score = 0
		moves = 0
		shots = 3
		locked = 0
		dead = 0
		host = 0
		blast = 1
		ships
		ship = 1
		hits = 0
		spec
		pup1
		pup2
		pup3
		pup4
		pup5
		pup6


mob
	Login()
		if(players < limit)
			if(!players)
				src.host = 1
				src << sound('lostindaze.mid',1)
				src.locked = 1
				src.loc = locate(19,11,1)//19,11,1
				src.client.eye = locate(19,20,1)
				players ++
				src.Panel()
				src.icon = 'ship.dmi'
//				src.icon_state = "2"
				src.Startup()
			else
				src << sound('lostindaze.mid',1)
				src.loc = locate(19,11,1)//19,11,1
				src.client.eye = locate(19,20,1)
				players ++
				src.Panel()
				src.icon = 'ship.dmi'
		else
			if(specs)
				src << sound('lostindaze.mid',1)
				src << "<b>The host has allowed spectators. You begin spectating...</b>"
				src.density = 0
				src.icon = 'turfs.dmi'
				src.icon_state = "blank"
				src.loc = locate(19,11,1)
				src.client.eye = locate(19,20,1)
				src.density = 0
				src.spec = 1
			else
				src << "<b>Sorry this room is occupied. This game is available for download.</b>"
				del(src)


mob
	verb
		Shoot()
			set hidden = 1
			if(!src.locked)
				if(usr.shooting <= usr.shots-1)
					var/obj/Blast/B=new
					B.owner = usr
					B.loc = locate(usr.x,usr.y+1,usr.z)
					usr.shooting ++
					src << sound('shot.wav')
					spawn(12)
					usr.shooting --
					sleep(7)
/**
				if(usr.client.control)
					var/obj/Blast/B2=new
					B2.owner = usr
					B2.loc = locate(usr.x,usr.y+1,usr.z)
					var/obj/Blast/B3=new
					B3.owner = usr
					B3.loc = locate(usr.client.control.x,usr.client.control.y+1,usr.client.control.z)
				if(usr.client.control2)
					var/obj/Blast/B2=new
					B2.owner = usr
					B2.loc = locate(usr.x,usr.y+1,usr.z)
					var/obj/Blast/B3=new
					B3.owner = usr
					B3.loc = locate(usr.client.control2.x+1,usr.client.control2.y+1,usr.client.control2.z)
				usr.shooting ++
				spawn(20)
				usr.shooting --
				sleep(5)
**/



mob
	Stat()
		statpanel("Stats")
		stat("Wave: ", level)
		stat("Ships: ", src.lives)
		stat("Score: ", src.score)
		stat("CPU: ", world.cpu)
		stat("")
		stat("Mission: ","You are the last pilot of the Lazerk empire. You must elliminate any invading Ghoubos.")
		stat("")
		stat("Controls: ","")
		stat("","Movement: Arrow keys")
		stat("","Firing: Spacebar")
		stat("","Kick: Press K to remove a co-pilot (Host only)")
		stat("","Give: Press G to give a co-pilot a extra ship")
		stat("")
		stat("Powerups: ","")
		stat(src.pup1)
		stat(src.pup2)
		stat(src.pup3)
		stat(src.pup4)
		stat(src.pup5)
		stat(src.pup6)
		Levelup()
		Cheat()

mob
	Bump(mob/M)
		if(ismob(M))
			if(!M:client)
				src.Death()




mob
	Logout()
		world << "<b>[src] has abandoned the mission...</b>"
		players --
		limit --
		src.Scoring()
		del(src)

mob
	verb
		Kick()
			set hidden = 1
			if(usr.host)
				var/list/Targets[0]
				for(var/mob/M in world)
					if(M.client)
						if(!M.spec)
							if(M != usr)
								Targets+=M
				if(length(Targets))
					var/mob/m = input("Who do you want to kick from the game?") in Targets
					m << "<b>You have been kicked from the game.</b>"
					players --
					del(m)


mob
	verb
		Give()
			set hidden = 1
			var/list/Targets[0]
			for(var/mob/M in world)
				if(M.client)
					if(!M.spec)
						if(M != usr)
							if(!M.dead)
								Targets+=M
			if(length(Targets))
				var/mob/m = input("Who do you want to give lives to?") in Targets
				if(usr.lives)
					usr.lives --
					m.lives ++

