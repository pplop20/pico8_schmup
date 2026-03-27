function draw_game()
	cls(0)

	startfield()

	spr(shp_spr,x_s,y_s)--ship
	spr(16,x_b,y_b) --enemy 
    spr(blt_spr, shp_bul_x, shp_bul_y) --my bullet
    spr(expls_spr, expls_x, expls_y) -- enemy explosion
    circfill(x_s+3,y_s,muzzle,7)
    

	print("score:"..score , 50,1,12)

	for i=1,4 do 
		if lives>=i then
			spr(heart_spr,i*9-8,1)
		else
			spr(heart_spr-1,i*9-8,1)
		end
		
	end

	for j=0,2 do 
		if bombs>=j then
			spr(bomb_spr, 121-(8*j),1)
		else
			spr(bomb_spr+1,121-(8*j),1)
		end
	end
end

function draw_start()
    cls(1)
    print("welcome to my schmup!",25, 40, 3)
    print("press any key to start", 20, 80, 7)
end