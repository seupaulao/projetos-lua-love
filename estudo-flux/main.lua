local flux = require "flux"
function love.load()
    bola = {
        x = 100,
        y = 100,
        r = 30
    }
    flux.to(bola, 2, {x = 200, y = 300}):ease('sinein'):after(bola, 1, {x = 250, y = 200}):ease('expoout'):after(bola, 1, {x = 300, y = 100}):ease('linear'):after(bola, 1, {x = 400, y = 400}):ease('elasticout')
    bolas={}
    for i=1,100 do 
        criarBolas(love.math.random(100,500),love.math.random(1,100),love.math.random(10,50))
    end
    for k,v in ipairs(bolas) do
        flux.to(v, 4, {x=220, y=340, r=20, red=1, green=1, blue=1}):after(v, 1, {red=love.math.random(1,255)/255, green=1, blue=love.math.random(1,255)/255,x = love.math.random(100,600), y = love.math.random(1,455)}):ease('elasticinout')
    end    
end

function criarBolas(x,y,r)
    local item = {}
    item.x = x
    item.y = y
    item.r = r
    item.red = love.math.random(1,255)/255
    item.green = love.math.random(1,255)/255
    item.blue = love.math.random(1,255)/255
    bolas[#bolas + 1] = item
end

function love.update(dt)
    flux.update(dt)
end

function love.keypressed(key)
  if key=='escape' then 
     love.event.quit()
  end
end

function love.draw()
    love.graphics.setColor(1,0,0)
    love.graphics.circle("fill",bola.x,bola.y,bola.r)
    for k,v in ipairs(bolas) do 
        love.graphics.setColor(v.red,v.green,v.blue)
        love.graphics.circle("fill",v.x,v.y,v.r)
    end
end