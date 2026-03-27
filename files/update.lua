function update_game()
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

	stars_move()
	--update_star_color()
	
end

function update_start()
    if btnp(4) then 
        start_game()
    end
end