function love.load()
    -- ****************Tilemap com Imagens e Movimento de um player*******************
    -- *********SONS e MUSICA*********
    --Load the image
    image = love.graphics.newImage("tileset.png")

    --We need the full image width and height for creating the quads
    local image_width = image:getWidth()
    local image_height = image:getHeight()

    --The width and height of each tile is 32, 32
    --So we could do:
    width = 32
    height = 32
    --But let's say we don't know the width and height of a tile
    --We can also use the number of rows and columns in the tileset
    --Our tileset has 2 rows and 3 columns
    --But we need to subtract 2 to make up for the empty pixels we included to prevent bleeding
    width = (image_width / 3) - 2
    height = (image_height / 2) - 2

    --Create the quads
    quads = {}

    for i=0,1 do
        for j=0,2 do
            --The only reason this code is split up in multiple lines
            --is so that it fits the page
            table.insert(quads,
                love.graphics.newQuad(
                    1 + j * (width + 2),
                    1 + i * (height + 2),
                    width, height,
                    image_width, image_height))
        end
    end

    tilemap = {
        {1, 6, 6, 2, 1, 6, 6, 2},
        {3, 0, 0, 4, 5, 0, 0, 3},
        {3, 0, 0, 0, 0, 0, 0, 3},
        {4, 2, 0, 0, 0, 0, 1, 5},
        {1, 5, 0, 0, 0, 0, 4, 2},
        {3, 0, 0, 0, 0, 0, 0, 3},
        {3, 0, 0, 1, 2, 0, 0, 3},
        {4, 6, 6, 5, 4, 6, 6, 5}
    }

     --Create our player
     player = {
        image = love.graphics.newImage("player.png"),
        tile_x = 2,
        tile_y = 2
    }

    song = love.audio.newSource("song.ogg", "stream")
    --primeiro metodo de acionar o som
    --love.audio.play(song)
    song:setLooping(true)
    --segundo metodo de acionar o som
    song:setVolume(0.10)
    song:play()
    -- sfx is short for 'sound effect', or at least I use it like that.
    sfx = love.audio.newSource("sfx.ogg", "static")
end

function love.update(dt)

end

function love.keypressed(key)
    local x = player.tile_x
    local y = player.tile_y
    if key == "left" then
        x = x - 1
    elseif key == "right" then
        x = x + 1
    elseif key == "up" then
        y = y - 1
    elseif key == "down" then
        y = y + 1
    elseif key == "space" then
            sfx:setVolume(1)
            sfx:play()
    end
    if isEmpty(x,y) then 
        player.tile_x = x
        player.tile_y = y
    end
end

function isEmpty(x, y)
    return tilemap[y][x] == 0
end

function love.draw()
    for i,linha in ipairs(tilemap) do
        for j,tile in ipairs(linha) do
            if tile ~= 0 then
                love.graphics.draw(image, quads[tile], j * width, i * height)
            end
        end
    end
    --Draw the player and multiple its tile position with the tile width and height
    love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)
end