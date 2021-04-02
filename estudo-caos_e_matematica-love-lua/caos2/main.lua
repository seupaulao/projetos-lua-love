function love.load()
   h = love.graphics.getHeight()
   w = love.graphics.getWidth()
   t = {}
   gerar()
end

function love.update(dt)
end

function love.draw()
  for k,v in ipairs(t) do
    love.graphics.setColor(v.r,v.g,v.b)
    love.graphics.rectangle("fill",v.x, v.y, v.w, v.h)
  end
end

function gerar()
  t = {}
  for i=1,500 do
    local temp = {}
    temp.x = love.math.random(1, w)
    temp.y = love.math.random(1, h)
    temp.r = love.math.random(1,255)/255.0
    temp.g = love.math.random(1,255)/255.0
    temp.b = love.math.random(1,255)/255.0
    temp.w = 45
    temp.h = 45
    t[#t+1] = temp
  end 
end

function love.keypressed(key)
 if key=='escape' then
    love.event.quit()
 else
    gerar()
 end
end
