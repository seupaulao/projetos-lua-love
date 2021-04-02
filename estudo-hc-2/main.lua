HC = require 'HC'

Camera = require 'Camera'

local camera = Camera()

function love.load()
    gmoedas = {}
    player = {
        x = 100,
        y = 100,
        r = 40
    }
    gplayer = HC.circle(player.x, player.y, player.r)
    moedas = {}
    for i=1,100 do 
         local t = {
             x = love.math.random(0, 1200),
             y = love.math.random(0, 1200),
             r = 10
         }  
         moedas[#moedas + 1] = t
         gmoedas[#moedas] = HC.circle(moedas[#moedas].x, moedas[#moedas].y, moedas[#moedas].r)
    end
end

function love.update(dt)
    if love.keyboard.isDown('w') then    
        player.y = player.y - 5
    elseif love.keyboard.isDown('s') then    
        player.y = player.y + 5
    elseif love.keyboard.isDown('a') then    
        player.x = player.x - 5
    elseif love.keyboard.isDown('d') then    
        player.x = player.x + 5
    end
    
    --atualizar posicao do player
    gplayer:moveTo(player.x, player.y)

    --testar colisao entre player e as moedas
    for i=#gmoedas,1,-1 do
        if gplayer:collidesWith(gmoedas[i]) then 
            --apaga a imagem da moeda e o objeto hc.circle que envolve a moeda
            table.remove(gmoedas,i)
            table.remove(moedas,i)
        end
    end

    -- atualiza a camera
    camera:update(dt)
    -- solicita que a camera siga o player
    camera:follow(player.x, player.y)
end

function love.draw()
    camera:attach()
    love.graphics.circle('line',player.x,player.y,player.r)
    for k,v in ipairs(moedas) do 
        love.graphics.circle('fill',v.x,v.y,v.r)
    end
    --for k,v in ipairs(gmoedas) do 
    --   v:draw('fill')
    --end
    camera:detach()
    camera:draw()
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end
end
