function love.load()
   circle = {}
   circle.x = 100
   circle.y = 100
   circle.raio = 25
   circle.velocidade = 200
end

function love.update(dt)
    mouse_x, mouse_y = love.mouse.getPosition()
    angulo = math.atan2(mouse_y - circle.y, mouse_x - circle.x)
    angulo_graus = 360 - math.abs((angulo * 360) / (2 * math.pi)) 
    cosseno = math.cos(angulo)
    seno = math.sin(angulo)

    local distancia = getDistancia(circle.x, circle.y, mouse_x, mouse_y)

    if distancia < 400 then
        circle.x = circle.x + circle.velocidade * cosseno * (distancia/100) * dt
        circle.y = circle.y + circle.velocidade * seno * (distancia/100) * dt
    end
end

function love.draw()
    --saidatexto(angulo, angulo_graus)
    desenho2(circle, mouse_x, mouse_y)
end

function saidatexto(ang,angg)
    love.graphics.print("angulo radianos:" .. ang, 10, 10)
    love.graphics.print("angulo graus:" .. angg, 10, 30)
end

function desenho1(c,mx,my)
    love.graphics.circle("line", c.x,c.y,c.raio)
    love.graphics.line(c.x, c.y, mx, c.y)
    love.graphics.line(c.x, c.y, c.x, my)
    love.graphics.line(c.x, c.y, mx, my)
end

function desenho2(c,mx,my)
    love.graphics.circle("line", c.x,c.y,c.raio)
    love.graphics.line(c.x, c.y, mx, my)
    love.graphics.line(c.x, c.y, mx, c.y)
    love.graphics.line(mx, my, mx, c.y)

    local distancia = getDistancia(c.x, c.y, mx, my)
    love.graphics.circle("line",c.x,c.y,distancia)
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
