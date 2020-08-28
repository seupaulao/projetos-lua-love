function love.load()
    arenaW = love.graphics.getWidth()
    arenaH = love.graphics.getHeight()  
    shipRadius = 30
    bulletRadius = 5
    escala = {}
    escala.x = arenaW / 800 
    escala.y = arenaH / 600

    asteroidStages = {
        {
            speed = 120,
            radius = 15
        },
        {
            speed = 70,
            radius = 30
        },
        {
            speed = 50,
            radius = 50
        },
        {
            speed = 20,
            radius = 80
        }
    }

    function reset()
        shipX = arenaW/2
        shipY = arenaH/2-50
        shipAngle = 0
        shipSpeedX = 0
        shipSpeedY = 0
        bullets = {}
        --necessario para que se o space for segurado atirar mais de uma vez (metralhadora)
        bulletTimer = 0
    
        asteroids = {
            {
                x = 100,
                y = 100,
            },
            {
                x = arenaW - 100,
                y = 100,
            },
            {
                x = arenaW / 2,
                y = arenaH - 100,
            }
        }
        for asteroidIndex, asteroid in ipairs(asteroids) do
            asteroid.angle = love.math.random() * (2 * math.pi)
            asteroid.stage = #asteroidStages
        end
    end
    reset()
end

function love.update(dt)
    local turnSpeed = 10    
    if love.keyboard.isDown('right') then
        shipAngle = (shipAngle + turnSpeed * dt) % (2 * math.pi)
    elseif love.keyboard.isDown('left') then
        shipAngle = (shipAngle - turnSpeed * dt)  % (2 * math.pi)
    elseif love.keyboard.isDown('up') then
        local shipSpeed = 100
        shipSpeedX = shipSpeedX + math.cos(shipAngle) * shipSpeed * dt
        shipSpeedY = shipSpeedY + math.sin(shipAngle) * shipSpeed * dt
    end

    shipX = (shipX + shipSpeedX * dt) % arenaW
    shipY = (shipY + shipSpeedY * dt) % arenaH

    ----OBS: efeito legal onde a bullet nao morre
    --for bi, bullet in ipairs(bullets) do 
    --    local bulletSpeed = 500
    --    bullet.x = (bullet.x + math.cos(bullet.angle) * bulletSpeed * dt) % arenaW
    --    bullet.y = (bullet.y + math.sin(bullet.angle) * bulletSpeed * dt) % arenaH
    --end

    local function areCirclesIntersecting(aX, aY, aRadius, bX, bY, bRadius)
        return (aX - bX)^2 + (aY - bY)^2 <= (aRadius + bRadius)^2
    end

    for bulletIndex = #bullets,1,-1 do
        local bullet = bullets[bulletIndex]
        bullet.timeLeft = bullet.timeLeft - dt
        if bullet.timeLeft <= 0 then
            table.remove(bullets, bulletIndex)
        else
            local bulletSpeed = 500
            bullet.x = (bullet.x + math.cos(bullet.angle) * bulletSpeed * dt) % arenaW
            bullet.y = (bullet.y + math.sin(bullet.angle) * bulletSpeed * dt) % arenaH
        end

        for asteroidIndex = #asteroids, 1, -1 do
            local asteroid = asteroids[asteroidIndex]

            if areCirclesIntersecting(bullet.x, bullet.y, bulletRadius, asteroid.x, asteroid.y, asteroidStages[asteroid.stage].radius) then
                table.remove(bullets, bulletIndex)
                if asteroid.stage > 1 then 
                    local angle1 = love.math.random() * (2 * math.pi)
                    local angle2 = (angle1 - math.pi) % (2 * math.pi)
    
                    table.insert(asteroids, {
                        x = asteroid.x,
                        y = asteroid.y,
                        angle = angle1,
                        stage = asteroid.stage - 1
                    })
                    table.insert(asteroids, {
                        x = asteroid.x,
                        y = asteroid.y,
                        angle = angle2,
                        stage = asteroid.stage - 1
                    })
                end


                table.remove(asteroids, asteroidIndex)
                break
            end
        end

    end

    bulletTimer = bulletTimer + dt 
    --retirei de keypressed para fazer a metralhadora automatica    
    if love.keyboard.isDown('space') then
        if bulletTimer >= 0.5 then
            bulletTimer = 0
            table.insert(bullets, {
                x = shipX + math.cos(shipAngle) * shipRadius,
                y = shipY + math.sin(shipAngle) * shipRadius,
                angle = shipAngle,
                timeLeft = 4
            })
        end
    end

  

    for asteroidIndex, asteroid in ipairs(asteroids) do
        local asteroidSpeed = 20
        asteroid.x = (asteroid.x + math.cos(asteroid.angle) * asteroidStages[asteroid.stage].speed * dt) % arenaW
        asteroid.y = (asteroid.y + math.sin(asteroid.angle) * asteroidStages[asteroid.stage].speed * dt) % arenaH
        if areCirclesIntersecting(shipX, shipY, shipRadius, asteroid.x, asteroid.y, asteroidStages[asteroid.stage].radius) then
            reset()
            break
        end
    end

    if #asteroids == 0 then
        reset()
    end
end

function love.draw()
    -- desenhando objetos parcialmente na tela 
    love.graphics.scale(escala.x, escala.y)
    for y = -1, 1 do
        for x = -1, 1 do
            love.graphics.origin()
            love.graphics.translate(x * arenaW, y * arenaH)

            love.graphics.setColor(0, 0, 1)
            love.graphics.circle('fill', shipX, shipY, shipRadius)

            love.graphics.setColor(0, 1, 1)
            love.graphics.circle('fill', shipX + math.cos(shipAngle) * 20, shipY + math.sin(shipAngle) * 20, bulletRadius)

            for bulletIndex, bullet in ipairs(bullets) do
                love.graphics.setColor(0, 1, 0)
                love.graphics.circle('fill', bullet.x, bullet.y, 5)
            end

            for asteroidIndex, asteroid in ipairs(asteroids) do
                love.graphics.setColor(1, 1, 0)
                love.graphics.circle('fill', asteroid.x, asteroid.y, asteroidStages[asteroid.stage].radius)
            end
        end
    end

    -- Temporary
    love.graphics.origin()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(table.concat({
        'shipAngle: '..shipAngle,
        'shipX: '..shipX,
        'shipY: '..shipY,
        'shipSpeedX: '..shipSpeedX,
        'shipSpeedY: '..shipSpeedY,
    }, '\n'))
end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
   
end

