function love.load()

    flux = require "flux"
    colors = {
        {1,0,0},
        {1,0,1},
        {1,1,0},
        {0,0,1},
        {0,1,1},
        {0,1,0},
        {0,0.3,0.9},
        {0.6,0.8,0.6},
    }
    origem = {}
    destino = {}
    fieldSize = 7
    ajusteh = 64
    ajustew = 48
    gw = math.floor((love.graphics.getWidth()-ajustew)/fieldSize)
    gh = math.floor((love.graphics.getHeight()-ajusteh)/fieldSize)

    matriz = {}
    local ax = math.floor(ajustew / 2)
    local ay = math.floor(ajusteh / 2)
    for i=1,fieldSize do
        local v={}
        for j=1,fieldSize do
            v[#v+1] = { x=ax+gw*(j-1), y=ay+gh*(i-1), w=gw-1, h=gh-1, size=20, alfa=10, cor=math.random(#colors) }
        end
        matriz[#matriz+1] = v
    end   
end

function love.update(dt)
    flux.update(dt)
end

function getGema(lin,col)
    if col < 1 or col > fieldSize or lin < 1 or lin > fieldSize then
       return -1 
    end
    return matriz[lin][col]
end

function trocar(_o,_d)
    --local temp1 = getGema(_o[1],_o[2])
    --local temp2 = getGema(_d[1],_d[2])
    --getGema(_o[1],_o[2]) = getGema(_d[1],_d[2])
    --getGema(_d[1],_d[2]) = temp
    sweep(_o,_d)
    sweep(_d,_o)
end

function sweep(_o,_d)
    local lino = _o[1]
    local colo = _o[2]
    local lind = _d[1]
    local cold = _d[2]
    local temp_o = getGema(lino,colo)
    local temp_d = getGema(lind,cold)
    local _x = temp_d.x
    local _y = temp_d.y
    flux.to(temp_o, 0.3, {x=_x,y=_y}):ease("linear") 	
end

--pensar nos jogos e objetivos
--fazer:
-------corrigir a troca
-------detalhes que nao estao funcionando corretamente
-------destruir em linha ou bloco

function love.mousepressed( x, y, button, istouch, presses )
    x = x - math.floor(ajustew / 2)
    y = y - math.floor(ajusteh / 2)
    local lin = math.floor(y/gh) + 1
    local col = math.floor(x/gw) + 1
    if col > 0 and lin > 0 then
        if #origem == 0 and #destino == 0 then
            origem = {lin,col}
        elseif #destino == 0 then    
            destino = {lin,col}
            trocar(origem,destino)
           --- checar(destino)
            origem={}
            destino={}
        end
    end
end

function checar(destino)
    local lin = destino[1]
    local col = destino[2]
    return hasVertical(lin,col) or hasHorizontal(lin,col)
end

function hasVertical(lin,col)
    return getGema(lin,col).cor == getGema(lin-1,col).cor and getGema(lin,col).cor == getGema(lin-2,col).cor
end

function hasHorizontal(lin,col)
    return getGema(lin,col).cor == getGema(lin,col-1).cor and getGema(lin,col).cor == getGema(lin,col-2).cor
end


function love.draw()
    for i=1,fieldSize do
        for j=1,fieldSize do
            local tile = matriz[i][j];
            local v = colors[tile.cor];
            love.graphics.setColor(v[1],v[2],v[3])
            love.graphics.rectangle("fill",tile.x,tile.y,tile.w,tile.h)
        end
    end
end

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end
end


