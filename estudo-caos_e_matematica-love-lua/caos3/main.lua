function love.load()
   h = love.graphics.getHeight()
   w = love.graphics.getWidth()
   t = {}
   nr = 1
   ng = 700
   nb = 600
   ig = 1
   ib = 2
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
    temp.r = love.math.noise(nr)
    temp.g = love.math.noise(ig,ng)
    temp.b = love.math.noise(ib,nb)
    temp.w = 45
    temp.h = 45
    print(temp.r,temp.g,temp.b)
    t[#t+1] = temp
    nr = nr + 1
    ig = ig + 1
    ib = ib + 1
  end 
end

function love.keypressed(key)
 if key=='escape' then
    love.event.quit()
 else
    gerar()
 end
end
