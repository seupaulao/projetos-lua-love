function love.load()
    --animação em uma linha
    image = love.graphics.newImage("jump.png")
    frames = {}
    local frame_width = 117
    local frame_height = 233
    local width = image:getWidth()
    local height = image:getHeight() 
    for i=0,4 do
        table.insert(frames, love.graphics.newQuad(i * frame_width, 0, frame_width, frame_height, width, height))
    end

    currentFrame = 1
end

function love.update(dt)
    currentFrame = currentFrame + 10 * dt
    if currentFrame >= 6 then
        currentFrame = 1
    end
end

function love.draw() 
 love.graphics.draw(image, frames[math.floor(currentFrame)], 100, 100)
end