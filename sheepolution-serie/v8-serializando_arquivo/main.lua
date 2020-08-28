function love.load()
    -- Player, Coins, Colisões + Salvar , Carregar e Resetar
    lume = require "lume"

    player = {
        x = 100,
        y = 100,
        size = 25,
        image = love.graphics.newImage("face.png")
    }

    coins = {}

    if love.filesystem.getInfo("savedata.txt") then
        file = love.filesystem.read("savedata.txt")
        data = lume.deserialize(file)

        --Apply the player info
        player.x = data.player.x
        player.y = data.player.y
        player.size = data.player.size

        for i,v in ipairs(data.coins) do
            coins[i] = {
                x = v.x,
                y = v.y,
                size = 10,
                image = love.graphics.newImage("dollar.png")
            }
        end
    else
        for i=1,25 do
            table.insert(coins, {
                x = love.math.random(50,650),
                y = love.math.random(50,450),
                size = 10,
                image = love.graphics.newImage("dollar.png")
            })
        end
    end

    
end

function love.update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - 200 * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + 200 * dt
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - 200 * dt
    elseif love.keyboard.isDown("down") then
        player.y = player.y + 200 * dt
    end

    for i=#coins,1,-1 do
        -- Use coins[i] instead of v
        if checkCollision(player, coins[i]) then
            table.remove(coins, i)
            player.size = player.size + 1
        end
    end

end

function love.draw()
    love.graphics.circle("line", player.x, player.y, player.size)
    love.graphics.draw(player.image, player.x, player.y,
        0, 1, 1, player.image:getWidth()/2, player.image:getHeight()/2)
    for i,v in ipairs(coins) do
            love.graphics.circle("line", v.x, v.y, v.size)
            love.graphics.draw(v.image, v.x, v.y,
                0, 1, 1, v.image:getWidth()/2, v.image:getHeight()/2)
    end    
end

function checkCollision(p1,p2)
    local x = p1.x - p2.x
    local y = p1.y - p2.y
    local distance = math.sqrt(x*x + y*y)
    return distance < p1.size + p2.size
end

function love.keypressed(key)
    if key == "f1" then
        saveGame()
    elseif key == "f2" then
        love.filesystem.remove("savedata.txt")
        love.event.quit("restart")    
    end
end

function saveGame()
    data = {}
    data.player = {
      x = player.x,
      y = player.y,
      size = player.size
    }
    data.coins = {}
    for i,v in ipairs(coins) do
        data.coins[i] = {x = v.x, y = v.y}
    end
    serialized = lume.serialize(data)
    love.filesystem.write("savedata.txt", serialized)
end