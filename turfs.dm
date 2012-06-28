turf
	name = "Space Sweeper"

turf
	icon = 'turfs.dmi'
	Space
		icon_state = "space"

turf
	icon = 'turfs.dmi'
	Exit
		icon_state = "blank"
		Entered(mob/M)
			if(ismob(M))
				if(!M.client)
					del(M)
			if(isobj(M))
				del(M)

	Exit2
		icon_state = "blank"
		Entered(obj/O)
			if(isobj(O))
				del(O)

	Test
		icon_state = "test"
		density = 1

	Barrier
		icon_state = "test"
		Enter(mob/M)
			if(ismob(M))
				if(M.client)
					return


	Background
		icon = 'background1.png'