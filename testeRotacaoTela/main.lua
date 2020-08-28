function love.load()
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
    x= width/2-100
    y = height/2-100
end

local angle = 0

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    elseif key=='right' then 
        x = x + 50
    elseif key=='left' then 
        x = x - 50
    end
end

function love.update(dt)
	love.timer.sleep(.01)
	angle = angle + dt * math.pi/2
	angle = angle % (2*math.pi)
end

function love.draw()

 
	-- rotate around the center of the screen by angle radians
	love.graphics.translate(width/2, height/2)
	love.graphics.rotate(math.pi/2)
    love.graphics.translate(-width/2, -height/2)
    
   -- draw a white rectangle slightly off center
	love.graphics.setColor(0xff, 0xff, 0xff)
	love.graphics.rectangle('fill',x, y, 300, 400)
	-- draw a five-pixel-wide blue point at the center
	love.graphics.setPointSize(5)
	love.graphics.setColor(0, 0, 0xff)
	love.graphics.points(width/2, height/2)

end