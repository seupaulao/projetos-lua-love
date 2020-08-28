function love.load()
    --Load the image
    image = love.graphics.newImage("tile.png")

    --Get the width and height
    width = image:getWidth()
    height = image:getHeight()

    tilemap = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
        {1, 2, 3, 4, 5, 5, 4, 3, 2, 1},
        {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    }

    colors = {
        --Fill it with tables filled with RGB numbers
        {1, 1, 1},
        {1, 0, 0},
        {1, 0, 1},
        {0, 0, 1},
        {0, 1, 1}
    }
end

function love.update(dt)

end

function love.draw()
    for i,linha in ipairs(tilemap) do
        for j,tile in ipairs(linha) do
            if tile ~= 0 then
                love.graphics.setColor(colors[tile])
                love.graphics.draw(image, j*width, i*height)
            end
        end
    end
end