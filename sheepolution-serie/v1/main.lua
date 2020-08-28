function love.load()
   x = 100
   l = 1
end

function love.update(dt)
   x = x + 80 * dt * l
   if x > 400 or x < 100 then 
     l = l * -1 
   end
end

function love.draw()
   love.graphics.rectangle("line", x, 50, 200, 150)
end
