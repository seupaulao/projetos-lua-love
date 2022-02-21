local Camera = require 'Camera'

function love.load()
  camera = Camera()
  player = {
      x = 100,
      y = 100,
      r = 40
  }
  moedas = {}
  for i=1,100 do 
       local t = {
           x = love.math.random(0, 1200),
           y = love.math.random(0, 1200),
           r = 10
       }  
       moedas[#moedas + 1] = t
  end
  
end

function love.keypressed(key) 
    if key == 'escape' then 
        love.event.quit()
    end
end

function love.update(deltatime)
    
  
    if love.keyboard.isDown('w') then    
        player.y = player.y - 5
    elseif love.keyboard.isDown('s') then    
        player.y = player.y + 5
    elseif love.keyboard.isDown('a') then    
        player.x = player.x - 5
    elseif love.keyboard.isDown('d') then    
        player.x = player.x + 5
    end

    camera:update(dt)
    camera:follow(player.x, player.y)

end

function love.draw()
    camera:attach()
    love.graphics.circle('line',player.x,player.y,player.r)
    for k,v in ipairs(moedas) do 
        love.graphics.circle('fill',v.x,v.y,v.r)
    end
    camera:detach()
    camera:draw()
end