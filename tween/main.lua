function love.load()
   flux = require "flux" 
   ball = {}
   ball.x = 50
   ball.y = 50
   ball.w = 50
   ball.h = 50
end

function love.update(dt)
   flux.update(dt)	
end

function love.draw()
   love.graphics.rectangle("fill",ball.x,ball.y,ball.w,ball.h)
end

function love.keypressed(key)
   if key=="escape" then
      love.event.quit()
   elseif key=="r" then   
      flux.to(ball, 3, {x=50,y=50}):ease("quadout"):delay(1) 	
   end
end

function love.mousepressed(_x,_y)
      flux.to(ball, 2, {x=_x-ball.w/2,y=_y-ball.h/2}):ease("linear") 	
end
