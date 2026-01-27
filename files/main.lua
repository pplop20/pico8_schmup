--this is the second class
function _init()
	cls(0)
	
	x_s = 10
	y_s = 60
	
	reset_blt()
	
	v_shp_x = 0
    v_shp_y = 0
	s_b = rnd(5)
	
    shp_bul_x = 164
    shp_bul_y = 164

    --sprite variables
    shp_spr=1

    --enemy explosion
    enemy_hit=0
    expls_spr = 21
    expls_x = -10
    expls_y = -10
    expls_x_hit = 0
    expls_y_hit = 0
    
    --muzzle
    muzzle=0
end

function _update()
    shp_spr=1
	-- movement of ship

    ship_move_update()

    -- enemy bullet movement
	y_b=y_b+s_b
    
	--bullet hit
	if abs(x_s-x_b)<4 and abs(y_s-y_b)<4 then
		x_s=64
		y_s=64
        sfx(1)
		
		reset_blt()
	end
	
	if y_b>=128 then
		reset_blt()
	end
	
    ship_shoot_update()
    animate_muzzle()
    was_enemy_hit()
    animate_explosion()
	
end

function _draw()
	cls(0)

	spr(shp_spr,x_s,y_s)--ship
	spr(16,x_b,y_b) --enemy bullet
    spr(20, shp_bul_x, shp_bul_y) --my bullet
    spr(expls_spr, expls_x, expls_y) -- enemy explosion
    circfill(x_s+3,y_s,muzzle,7)
    
	--draw_blt()
end

function reset_blt()
	x_b = rnd(120)
	y_b = -4
end

function draw_blt()
	for i=1,10 do
		spr(2,x_b,y_b)
		reset_blt()
	end
end

