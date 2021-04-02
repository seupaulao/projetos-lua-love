function love.load()
   h = love.graphics.getHeight() - 200
   w = love.graphics.getWidth() - 300

end

function love.update(dt)
  x, y = love.mouse.getPosition()
end

function love.draw()
   local xAnterior = 0
  local yAnterior = h*love.math.random(0, 1)
   for i=1,w do
      local y = h*love.math.random(0, 1)
      love.graphics.line(xAnterior, yAnterior, i, y)
      yAnterior = y
      xAnterior = i
   end
   love.graphics.circle("line",x,y,10)	
end

function love.keypressed(key)
 if key=='escape' then
    love.event.quit()
 end
end
