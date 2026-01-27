function ship_move_update()
    if btn(0) then
        v_shp=-1
        x_s=x_s+v_shp
        shp_spr=2
	end
	
	if btn(1) then
		v_shp=1
		x_s=x_s+v_shp
        shp_spr=4
	end
	
	if btn(2) then
		v_shp_y=-1
		y_s=y_s+v_shp_y
        shp_spr=3
	end
	
    if btn(3) then
		v_shp_y=1
		y_s=y_s+v_shp_y
        shp_spr=5
	end

    --loop around
    if x_s > 128 then
        x_s = 0
    end
    
    if x_s < -8 then
        x_s = 128
    end
end

function ship_shoot_update()
    if btnp(4) then
        shp_bul_x = x_s
        shp_bul_y = y_s-3
        sfx(0)
        muzzle=4
    end
    shp_bul_y=shp_bul_y-6
    
end

function animate_muzzle()
    if muzzle>0 then
        muzzle=muzzle-1
    end
end

function was_enemy_hit()
    if abs(shp_bul_x-x_b)<4 and abs(shp_bul_y-y_b)<4 then
        -- bullet has hit enemy
        -- remove enemy from screen
        expls_x_hit = x_b
        expls_y_hit = y_b
        x_b=-10
        y_b=-10
        enemy_hit=1
    end
end

function animate_explosion()
    if enemy_hit==1 then
        --enemy was hit
        sfx(2)
        expls_spr=expls_spr+1
        expls_x = expls_x_hit
        expls_y = expls_y_hit
        if expls_spr>24 then
            expls_x=-10
            expls_y=-10
            enemy_hit=0
            expls_spr=21
        end
    end
end