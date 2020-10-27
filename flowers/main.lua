function love.load()
    tileset = love.graphics.newImage("tileset.png")
    local image_width = tileset:getWidth()
    local image_height = tileset:getHeight()
    width = (image_width / 3) - 2
    height = (image_height / 2) - 2

    quads = {}
    imagens = {}

    for i=0,1 do
        for j=0,7 do
            --The only reason this code is split up in multiple lines
            --is so that it fits the page
            table.insert(imagens,
                love.graphics.newQuad(
                    1 + j * (width + 2),
                    1 + i * (height + 2),
                    width, height,
                    image_width, image_height))
        end
    end

end

function love.draw()

end

function love.keypressed(key)
    if key == 'escape' then 
         love.event.quit()
    end
end

function love.update(dt)

end