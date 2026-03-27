--this is the second class
function _init()
	cls(0)
	

	reset_blt()
	
	v_shp_x = 0
    v_shp_y = 0
	s_b = rnd(5)
	
    shp_bul_x = 164
    shp_bul_y = 164

    --sprite variables
    shp_spr=1 
	blt_spr = 51 --ship bullet

    --enemy explosion
    enemy_hit=0
    expls_spr = 21
    expls_x = -10
    expls_y = -10
    expls_x_hit = 0
    expls_y_hit = 0
    
    --muzzle
    muzzle=0

	--score
	score=30000
	lives=3
	heart_spr=11
	bomb_spr=26
	bombs=2

	--starfield
	star_color=1
	starx={}
	stary={}
	star_s={}

	for i=1,100 do 
		add(starx,flr(rnd(128)))
		add(stary,flr(rnd(128)))
		add(star_s,rnd(2)+0.5)
	end

	--game start/game over
	mode = "start"

end

function _update()
	if mode=="game" then
		update_game()
	elseif mode=="start" then
		update_start()
	end
end

function _draw()
	if mode=="game" then
		draw_game()
	elseif mode=="start" then
		draw_start()
	end
end

function start_game()
	mode="game"

	--game start variables

	--ship
	x_s = 64
	y_s = 64
end



function reset_blt()
	x_b = rnd(120)
	y_b = -4
end

function startfield()
	for i=1,#starx do 
		local scol=6
		if star_s[i]<1 do 
			scol=1
		elseif star_s[i]<1.5 do 
			scol=13
		else 
			line(starx[i], stary[i], starx[i], stary[i]-3)
		end
		pset(starx[i],stary[i],scol)
	end
end

function update_star_color()
	star_color=rnd(8)
end

function stars_move()
	for i=1,#starx do 
		local sy=stary[i]

		sy=sy+star_s[i]
		if sy>128 then 
			sy=sy-128
		end
		stary[i]=sy
	end
end

-- one star is starx[i]=x, stary[i]=y, for it to move i would need to 
-- update their y value


