mob
	proc
		Location()
			var/obj/o = locate(/obj/Spawner) in world
			src.loc = locate(rand(10,28),o.y,o.z)

mob
	proc
		Shoot2()
			var/random = rand(0,2)
			if(!random)
				var/obj/Blast2/B=new
				B.loc = locate(src.x,src.y+1,src.z)

mob
	proc
		Shoot3()
			var/random = rand(0,2)
			if(!random)
				var/obj/Blast3/B=new
				B.loc = locate(src.x,src.y-1,src.z)
				var/obj/Blast3/B2=new
				B2.loc = locate(src.x+1,src.y-1,src.z)
				var/obj/Blast3/B3=new
				B3.loc = locate(src.x-1,src.y-1,src.z)

mob
	proc
		AI1()
			walk(src,SOUTH,5)
			var/moves = 10
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI2()
			walk(src,SOUTH,4)
			var/moves = 15
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI3()
			walk(src,SOUTH,3)
			var/moves = 20
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI4()
			walk(src,SOUTH,2)
			var/moves = 25
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI5()
			walk(src,SOUTH,1)
			var/moves = 30
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI6()
			walk(src,SOUTH)
			var/moves = 35
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				else
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI7()
			walk(src,SOUTH)
			var/moves = 35
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
					step(src,EAST)
				else
					step(src,WEST)
					step(src,WEST)
				src.Shoot2()
				moves --
				sleep(5)

mob
	proc
		AI8()
			walk(src,SOUTH,20)
			var/moves = 70
			while(moves)
				var/random = rand(0,3)
				if(!random)
					step(src,NORTH)
				if(random == 1)
					step(src,SOUTH)
				if(random == 2)
					step(src,EAST)
				if(random == 3)
					step(src,WEST)
				var/random2 = rand(0,1)
				if(random2)
					src.Shoot3()
				moves --
				sleep(3)

mob
	proc
		AI9()
			var/moves = 95000
			while(moves)
				var/random = rand(0,1)
				if(!random)
					step(src,EAST)
				if(random == 1)
					step(src,WEST)
				src.Shoot3()
				moves --
				sleep(5)