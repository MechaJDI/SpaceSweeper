mob
	Plane
		icon = 'ship.dmi'
		ship = 1
		density = 1

mob
	Plane1
		icon = 'monsters.dmi'
		icon_state = "1"
		points = 50
		New()
			..()
			src.Location()
			src.AI1()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)


mob
	Plane2
		icon = 'monsters.dmi'
		icon_state = "2"
		points = 100
		New()
			..()
			src.Location()
			src.AI2()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)


mob
	Plane3
		icon = 'monsters.dmi'
		icon_state = "3"
		points = 200
		New()
			..()
			src.Location()
			src.AI3()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)


mob
	Plane4
		icon = 'monsters.dmi'
		icon_state = "4"
		points = 400
		New()
			..()
			src.Location()
			src.AI4()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)


mob
	Plane5
		icon = 'monsters.dmi'
		icon_state = "5"
		points = 800
		New()
			..()
			src.Location()
			src.AI5()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)

mob
	Plane6
		icon = 'monsters.dmi'
		icon_state = "6"
		points = 1600
		New()
			..()
			src.Location()
			src.AI6()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)

mob
	Plane7
		icon = 'monsters.dmi'
		icon_state = "7"
		points = 3200
		New()
			..()
			src.Location()
			src.AI7()
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					del(src)

mob
	Plane8
		icon = 'monsters.dmi'
		icon_state = "8"
		points = 6400
		hits = 0
		New()
			..()
			src.Location()
			src.AI8()
		Del()
			if(src.hits >= 3)
				..()
			else
				src.hits ++

		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					src.hits ++
					del(src)

mob
	Boss
		icon = 'monsters.dmi'
		icon_state = "9"
		points = 666
		hits = 0
		New()
			..()
			src.loc = locate(19,28,1)
			src.AI9()
		Del()
			if(src.hits >= 30)
				level ++
				..()
			else
				src.hits ++

		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.Death()
					src.hits ++
					del(src)


