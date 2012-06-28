obj/Powerups
	icon = 'pups.dmi'
	powup = 1
	Shotup1
		icon_state = "1"
		shots = 1
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					if(M.shots <= 4)
						M.shots += src.shots
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Shotup2
		icon_state = "2"
		shots = 2
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					if(M.shots <= 4)
						M.shots += src.shots
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Lifeup
		icon_state = "3"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.lives ++
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Lifeup2
		icon_state = "4"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.lives += 2
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Pointup
		icon_state = "5"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.score += 1000
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Pointup2
		icon_state = "6"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					M.score += 5000
					del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)





/**
	Shipup
		icon_state = "4"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				if(M.client)
					if(!M.ships)
						var/mob/Plane/P=new
						P.loc = locate(M.x-1,M.y,M.z)
						M.client.control = P
						M.ships ++
						del(src)
					if(M.ships == 1)
						var/mob/Plane/P=new
						P.loc = locate(M.x+1,M.y,M.z)
						M.client.control2 = P
						M.ships ++
						del(src)
			if(isobj(M))
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

	Shotup3
		icon_state = "3"
		density = 1
		Bump(mob/M)
			if(ismob(M))
				M.Destroy()
				del(src)
		New()
			..()
			walk(src,SOUTH,5)

**/