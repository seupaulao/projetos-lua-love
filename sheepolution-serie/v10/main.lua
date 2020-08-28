function love.load()
    Object = require "classic"

    require "entity"
    require "player"
    require "wall"
    require "box"

    player = Player(100,100)
    wall = Wall(200,200)
    box1 = Box(400, 150)
    box2 = Box(400, 250)
    box3 = Box(400, 300)

    objects = {}
    table.insert(objects, player)
    table.insert(objects, wall)
    table.insert(objects, box1)
    table.insert(objects, box2)
    table.insert(objects, box3)
end

function love.update(dt)
 -- Update all the objects
    for i,v in ipairs(objects) do
            v:update(dt)
    end

    local loop = true
    local limit = 0

    while loop do
        -- Set loop to false, if no collision happened it will stay false
        loop = false

        limit = limit + 1
        if limit > 100 then
            -- Still not done at loop 100
            -- Break it because we're probably stuck in an endless loop.
            break
        end

        for i=1,#objects-1 do
            for j=i+1,#objects do
                local collision = objects[i]:resolveCollision(objects[j])
                if collision then
                    loop = true
                end
            end
        end
    end
end

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end
end

function love.draw() 
    for i,v in ipairs(objects) do
        v:draw()
    end
end