mob
	proc
		Scoring()
			if(src.client)
				var/list/records
				var/scores = world.GetScores(src.key, "") // retrieve scores of player
				if(!isnull(scores)) // if hub is accessible
					records = params2list(scores)
					var/list/newScores = new
					if(!text2num(records["Points"]))
						newScores["Points"] = 0
					if(!text2num(records["Level"]))
						newScores["Level"] = 0
					if(!text2num(records["Lives"]))
						newScores["Lives"] = 0

					newScores["Points"] = max(text2num(records["Points"]),src.score)
					newScores["Level"] = max(text2num(records["Level"]), level)
					newScores["Lives"] = max(text2num(records["Lives"]), src.lives)


					if(world.SetScores(src.key, list2params(newScores)))
						src << "<b>Your statistics have been recorded.</b>"
					else
						src << "<b>Unable to record statistics.</b>"


mob
	proc
		Death()
			world << sound('explosion.wav')
			if(src.lives <= 0)
				players --
				src.icon = 'turfs.dmi'
				src.dead = 1
				src.density = 0
				src.locked = 1
				icon_state = "blank"
				src << "<b>Mission failed...Your score is [src.score].</b>"
				src.Scoring()
				src << sound(null)
				src << sound('disappear.mid')
				if(limit > 1)//if one person dies
					limit = 1//no mroe cna join til the game finishes
//				if(level != 15)
//					src.Scoring()
				src << "<b>Gameover...</b>"
				if(players <= 0)//if there are no more surviving people, delete the screen
					for(var/obj/O in world)
						if(O.icon != 'pups2.dmi')
							del(O)
					for(var/mob/M in world)
						if(!M.client)
							M.hits = 30
							del(M)
			else
				src.lives -= 1
				src.shots = 3
				src.moves = 0
				src.loc = locate(19,11,1)

mob
	proc
		Panel()
			var/obj/P1/S=new//create new objects to add to statpanel
			src.pup1 = S
			var/obj/P2/S2=new
			src.pup2 = S2
			var/obj/P3/S3=new
			src.pup3 = S3
			var/obj/P4/S4=new
			src.pup4 = S4
			var/obj/P5/S5=new
			src.pup5 = S5
			var/obj/P6/S6=new
			src.pup6 = S6


mob
	proc
		Levelup()
			if(!src.dead)
				if(level <= 11)
					var/obj/o = locate(/obj/Spawner) in world
					if(!o)
						level += 1
						src << "<b>Wave cleared</b>"
						if(level <= 9)
							world.Repop()
						else
							if(level == 11)
								src << "Congratulations. Mission complete."
								for(var/obj/O in world)
									if(O.icon != 'pups2.dmi')
										del(O)
								for(var/mob/M in world)
									if(!M.client)
										del(M)
//								src.Scoring()
								level = 0
								world.Repop()
								src << "Wait..."
								sleep(20)
								src << "They are still coming..This must be their last standing.."
								src << "Give it all you got..."
								src.lives += 10
								level = 11
				else
					if(level != 15)
						if(!boss)
							level = 12
							src << "<b>The Mothership has revealed itself. Defeat it at all costs!</b>"
							new /mob/Boss
							boss = 1
						else
							if(level == 13)
								src << sound(null)
								src << sound('grin.mid')
								src << "You have succeeded in vanquishing the the Ghoubo empire. Your great accomplishment will never be forgotton."
								src << "Now the Lazerk Empire can live in peace and harmony..."
								src << "Thank you for playing."
								src.dead = 1
//								src.Scoring()




mob
	proc
		Startup()
			switch(input("Which mode do you want to play?") in list ("Single Player", "Two Player"))
				if("Two Player")
					limit = 2
				else
					limit = 1
					switch(input("Which Single Player mode do you want to play?") in list ("Normal", "Survival"))
						if("Survival")
							level = 17
							boss = 1
			switch(input("Do you want to allow spectators?") in list ("Yes", "No"))
				if("Yes")
					specs = 1
			if(!level)
				src << "<b>First wave approaching...</b>"
				src.locked = 0
				sleep(30)
				level = 1
			else
				if(level == 17)
					src << "<b>You must survive the wave of Ghoubos as long as possible...</b>"
					src.locked = 0
					src.lives = 15
					src.shots = 5
					sleep(30)
					level = 15

mob
	proc
		Cheat()
			var/a = src.x
			var/b = src.y
			sleep(100)
			if(src.x == a)
				if(src.y == b)
					var/random = rand(0,1)
					if(!random)
						step(src,EAST)
					else
						step(src,WEST)


/**
mob
	proc
		Destroy()
			var/total
			for(var/mob/M in world)
				if(!M.client)
					total += M.points
					del(M)
			src.points += total

**/