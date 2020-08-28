function love.load()
   flecha = {}
   flecha.x = 100
   flecha.y = 100
   flecha.angulo = 0
   flecha.velocidade = 300
   flecha.imagem = love.graphics.newImage("flecha.png")
   flecha.origin_x = flecha.imagem:getWidth() / 2
   flecha.origin_y = flecha.imagem:getHeight() / 2
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    flecha.angulo = math.atan2(mouse_y - flecha.y, mouse_x - flecha.x)
    cosseno = math.cos(flecha.angulo)
    seno = math.sin(flecha.angulo)

    local distancia = getDistancia(flecha.x, flecha.y, mouse_x, mouse_y)

    --if distancia < 400 then
        flecha.x = flecha.x + flecha.velocidade * cosseno  * dt
        flecha.y = flecha.y + flecha.velocidade * seno  * dt
    --end
end

function love.draw()
    love.graphics.draw(flecha.imagem, flecha.x, flecha.y, flecha.angulo, 1, 1, flecha.origin_x, flecha.origin_y)
    love.graphics.circle("fill",mouse_x, mouse_y, 5)
end


function getDistancia(x1,y1,x2,y2)
    local horizontal_distance = x1 - x2
    local vertical_distance = y1 - y2
    local a = horizontal_distance * horizontal_distance
    local b = vertical_distance * vertical_distance
    local c = a + b
    local distancia = math.sqrt(c)
    return distancia
end
