function love.load()
    image = love.graphics.newImage("1.png")
    images = {}
    tile = 18
    cellSize = 18
    gridYCount = 14
    gridXCount = 19
    local i = 0
    local j = 0
    local n = 8
    local w = image:getWidth()
    local h = image:getHeight()
    for imageIndex, nome in ipairs({'uncovered', 'covered_highlighted', 'covered', 'flower', 'flag', 'question','x1','x2',
                                    1, 2, 3, 4, 5, 6, 7, 8, })
    do 
        if i >= n then
            i = 0 
            j = 1
        end
        --print (i,j,nome)
        table.insert(images, love.graphics.newQuad(1 + i * (tile), 1 + j * (tile), tile, tile, w, h))
        i = i + 1
    end
    selectedX = 0
    selectedY = 0
    grade = {}
    for y = 1, gridYCount do
        grade[y] = {}
        for x = 1, gridXCount do
            grade[y][x] = { 
                flower = false
            }
        end
    end
    grade[1][1].flower=true
    grade[2][1].flower=true
end

function love.update(dt)
    selectedX = math.floor(love.mouse.getX() / cellSize) + 1
    selectedY = math.floor(love.mouse.getY() / cellSize) + 1
    if selectedX > gridXCount then selectedX = gridXCount end
    if selectedY > gridYCount then selectedY = gridYCount end
end

function love.mousereleased(mouseX, mouseY, button)
    if button == 2 then
        -- Temporary
        grade[selectedY][selectedX].flower = not grade[selectedY][selectedX].flower
    end
end

function love.draw()
    for y = 1, gridYCount do
        for x = 1, gridXCount do
            local function drawCell(_image, _x, _y)
                love.graphics.draw(
                    image,
                    _image,
                    (_x - 1) * cellSize, (_y - 1) * cellSize
                )    
            end
            if x == selectedX and y == selectedY then 
                if love.mouse.isDown(1) then 
                    drawCell(images[3], x, y)
                else         
                    drawCell(images[2], x, y)
                end
            else     
                drawCell(images[1], x, y)
            end

            if (grade[y][x].flower) then 
                drawCell(images[4], x, y)
            end
        end
    end
   love.graphics.setColor(1,1,1)
   love.graphics.print('selected x: '..tostring(selectedX)..' selected y: '..tostring(selectedY),10,300)
end

function love.keypressed(key)
    if key == 'escape' then 
         love.event.quit()
    end
end
