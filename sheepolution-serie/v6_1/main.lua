function love.load()
    --Introducao aos Tiles
    tilemap1 = {1, 0, 0, 1, 1, 0, 1, 1, 1, 0}
    tilemap2 = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 0, 0, 1, 1, 1, 1, 0, 0, 1},
        {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    }
    tilemap3 = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
        {1, 2, 3, 4, 5, 5, 4, 3, 2, 1},
        {1, 2, 2, 2, 2, 2, 2, 2, 2, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
    }
     --Create a table named colors
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

function desenhoHorizontal()
    for i,v in ipairs(tilemap1) do
        if v == 1 then
            love.graphics.rectangle("line", i * 25, 100, 25, 25)
        end
    end
end

function desenhoMapa()
    for i,linha in ipairs(tilemap2) do
        for j,tile in ipairs(linha) do
            if tile == 1 then
                love.graphics.rectangle("line", j * 25, i * 25, 25, 25)
            end
        end
    end
end

function desenhoMapaTilemap3()
    for i,linha in ipairs(tilemap3) do
        for j,tile in ipairs(linha) do
            if tile ~= 0 then

                --Set the color based on the tile number
                if tile == 1 then
                    --setColor uses RGB, A is optional
                    --Red, Green, Blue, Alpha
                    love.graphics.setColor(1, 1, 1)
                elseif tile == 2 then
                    love.graphics.setColor(1, 0, 0)
                elseif tile == 3 then
                    love.graphics.setColor(1, 0, 1)
                elseif tile == 4 then
                    love.graphics.setColor(0, 0, 1)
                elseif tile == 5 then
                    love.graphics.setColor(0, 1, 1)
                end
                love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
            end
        end
    end
end

function desenhoMapaCores(_tilemap,_cores)
    for i,linha in ipairs(_tilemap) do
        for j,tile in ipairs(linha) do
            if tile ~= 0 then
                love.graphics.setColor(_cores[tile])
                love.graphics.rectangle("fill", j * 25, i * 25, 25, 25)
            end
        end
    end

end

function love.draw()
    --desenhoHorizontal()
    --desenhoMapa()
    --desenhoMapaTilemap3()
    desenhoMapaCores(tilemap3,colors)
end