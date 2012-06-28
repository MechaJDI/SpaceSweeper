client
	var/mob/control
	var/mob/control2

	North()
		if(usr.moves <= 17)
			usr.moves ++
			step(usr,NORTH)
		else
			return

/**
			if(control)
				step(control,NORTH)
			if(control2)
				step(control2,NORTH)
**/


	South()
		usr.moves --
		if(usr.moves <= 0)
			usr.moves = 0
		step(usr,SOUTH)

/**
		if(control)
			step(control,SOUTH)
		if(control2)
			step(control2,SOUTH)

	East()
		step(usr,EAST)
		if(control)
			step(control,EAST)
		if(control2)
			step(control2,EAST)

	West()
		step(usr,WEST)
		if(control)
			step(control,WEST)
		if(control2)
			step(control2,WEST)

**/