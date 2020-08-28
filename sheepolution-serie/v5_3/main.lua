function love.load()
    --animacao em multiplas linhas
    image = love.graphics.newImage("jump_2.png")
    frames = {}
    local frame_width = 117
    local frame_height = 233
    local width = image:getWidth()
    local height = image:getHeight() 
    maxFrames = 5
    for i=0,1 do
        for j=0,2 do
            table.insert(frames, love.graphics.newQuad(1 + j * (frame_width + 2), 1 + i * (frame_height + 2), frame_width, frame_height, width, height))
            if #frames == maxFrames then
                break
            end 
        end
        print("I don't break!")
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