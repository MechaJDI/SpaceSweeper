obj
	name = "Space Sweeper"
	var
		owner
		shots
		powup



//BLASTS

obj
	Blast
		icon = 'misc.dmi'
		icon_state = "blast1"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(!M.client)
					var/mob/m = src.owner
					m.score += M.points
					del(M)
					del(src)
				else
					src.loc = M.loc

		New()
			..()
			walk(src,NORTH,1)

obj
	Blast2
		icon = 'misc.dmi'
		icon_state = "blast2"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)
				else
					src.loc = M.loc
			if(isobj(M))
				del(M)
				del(src)

		New()
			..()
			walk(src,SOUTH,2)


obj
	Blast3
		icon = 'misc.dmi'
		icon_state = "blast2"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)
				else
					src.loc = M.loc
			if(isobj(M))
				del(M)
				del(src)

		New()
			..()
			walk(src,SOUTH,1)


//SPAWNER

obj
	Spawner
		icon = 'turfs.dmi'
		icon_state = "space"
		density = 0
		New()
			..()
			Spawn()

obj
	PSpawner
		icon = 'turfs.dmi'
		icon_state = "space"
		density = 0
		New()
			..()
			PSpawn()

obj
	proc
		Spawn()
			var/mons//how many enemies to make
			var/time
			if(level == 0)
				sleep(10)
				Spawn()
			if(level == 1)//if level 1
				mons = 5//5
				time = 220//200
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane1
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 2)//if level 2
				mons = 10//10
				time = 200//180
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane2
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 3)//if level 2
				mons = 15//15
				time = 180//
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane3
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 4)//if level 2
				mons = 20//20
				time = 160//140
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane4
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 5)//if level 2
				mons = 25//25
				time = 140//120
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane5
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 6)//if level 2
				mons = 35//35
				time = 140//120
				sleep(rand(time/10,time))
				while(mons)
					var/random = rand(0,4)
					if(!random)
						new /mob/Plane1
					if(random == 1)
						new /mob/Plane2
					if(random == 2)
						new /mob/Plane3
					if(random == 3)
						new /mob/Plane4
					if(random == 4)
						new /mob/Plane5
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 7)//if level 2
				mons = 40//40
				time = 120//100
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane6
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 8)//if level 2
				mons = 45//45
				time = 100//80
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane7
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 9)//if level 2
				mons = 50//50
				time = 80//60
				sleep(rand(time/10,time))
				while(mons)
					var/random = rand(0,6)
					if(!random)
						new /mob/Plane1
					if(random == 1)
						new /mob/Plane2
					if(random == 2)
						new /mob/Plane3
					if(random == 3)
						new /mob/Plane4
					if(random == 4)
						new /mob/Plane5
					if(random == 5)
						new /mob/Plane6
					if(random == 6)
						new /mob/Plane7
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)
			if(level == 10)//if level 2
				mons = 100//100
				time = 60//40
				sleep(rand(time/10,time))
				while(mons)
					var/random = rand(0,1)
					if(!random)
						new /mob/Plane6
					if(random == 1)
						new /mob/Plane7
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)

			if(level == 11)//if level 2
				mons = 1//50
				time = 60//60
				sleep(rand(time/10,time))
				while(mons)
					new /mob/Plane8
					mons --
					sleep(rand(time/10,time))
				if(mons <= 0)
					del(src)

			if(level == 12)
				del(src)

			if(level == 15)//if level 2
				mons = 5000//50
				time = 80//60
				sleep(rand(time/10,time))
				while(mons)
					var/random = rand(0,4)
					if(!random)
						new /mob/Plane1
					if(random == 1)
						new /mob/Plane2
					if(random == 2)
						new /mob/Plane3
					if(random == 3)
						new /mob/Plane4
					if(random == 4)
						new /mob/Plane5

			if(level == 17)
				sleep(10)
				Spawn()

obj
	proc
		PSpawn()
			var/time = 3000
			var/mons = 5000
			sleep(rand(time/10,time))
			if(level == 0)
				sleep(10)
				PSpawn()
			while(mons)
				var/random = rand(0,5)
				if(!random)
					var/obj/Powerups/Shotup1/S=new
					S.loc = src.loc
				if(random == 1)
					var/obj/Powerups/Shotup2/S=new
					S.loc = src.loc
				if(random == 2)
					var/obj/Powerups/Lifeup/S=new
					S.loc = src.loc
				if(random == 3)
					var/obj/Powerups/Lifeup2/S=new
					S.loc = src.loc
				if(random == 4)
					var/obj/Powerups/Pointup/S=new
					S.loc = src.loc
				if(random == 5)
					var/obj/Powerups/Pointup2/S=new
					S.loc = src.loc
				mons --
				sleep(rand(time/10,time))


//OTHER

obj
	icon = 'pups2.dmi'
	P1
		icon_state = "1.2"
		name = "Increases maximum number of shots by 1"
	P2
		icon_state = "2.2"
		name = "Increases maximum number of shots by 2"
	P3
		icon_state = "3.2"
		name = "Increases number of ships by 1"
	P4
		icon_state = "4.2"
		name = "Increases number of ships by 2"
	P5
		icon_state = "5.2"
		name = "Increases score by 1000"
	P6
		icon_state = "6.2"
		name = "Increases score by 5000"