function love.load()
 --   image = love.graphics.newImage("1.png")
    images = {}
   -- tile = 18
    cellSize = 18
    gridYCount = 14
    gridXCount = 19
  -- usando quads é mais econômico, porém não reconhece o fundo vazio  
  --  local i = 0
  --  local j = 0
  --  local n = 8
 --   local w = image:getWidth()
 --   local h = image:getHeight()
    --for imageIndex, nome in ipairs({'uncovered', 'covered_highlighted', 'covered', 'flower', 'flag', 'question','x1','x2',
    --                                1, 2, 3, 4, 5, 6, 7, 8, })
    for imageIndex, nome in ipairs({'uncovered', 'covered_highlighted', 'covered', 'flower', 'flag', 'question',
                                    1, 2, 3, 4, 5, 6, 7, 8, })
    do 
--        if i >= n then
--            i = 0 
--            j = 1
--        end
        --print (i,j,nome)
        --table.insert(images, love.graphics.newQuad(1 + i * (tile), 1 + j * (tile), tile, tile, w, h))
        images[nome] = love.graphics.newImage("images/"..nome.. ".png")
--        i = i + 1
    end
    selectedX = 0
    selectedY = 0
    grade = {}
    gameOver = false
    firstClick=true

    function reset()
        grade = {}

        for y = 1, gridYCount do
            grade[y] = {}
            for x = 1, gridXCount do
                grade[y][x] = { 
                    flower = false,
                    state = 'covered', --covered or uncovered
                }
            end
        end

        gameOver = false
        firstClick=true

       
    
    end 
    --temporario
    --grade[1][1].state='flag'
    --grade[2][1].state='question'


    function getFloresAoRedorCount(x,y)
        local floresAoRedorCount = 0
        for dy = -1,1 do
            for dx = -1,1 do 
                if not (dy == 0 and dx == 0)
                and grade[y + dy]
                and grade[y + dy][x + dx]
                and grade[y + dy][x + dx].flower then 
                    floresAoRedorCount = floresAoRedorCount + 1
                end
            end
        end
        return floresAoRedorCount
    end

    reset()



end

function love.update(dt)
    selectedX = math.floor(love.mouse.getX() / cellSize) + 1
    selectedY = math.floor(love.mouse.getY() / cellSize) + 1
    if selectedX > gridXCount then selectedX = gridXCount end
    if selectedY > gridYCount then selectedY = gridYCount end
end

function love.mousereleased(mouseX, mouseY, button)
   -- if button == 2 then
   --     -- Temporary
   --     grade[selectedY][selectedX].flower = not grade[selectedY][selectedX].flower
   -- end
    if not gameOver then 
        if button == 1 and grade[selectedY][selectedX].state ~= 'flag' then 
            if firstClick then 
                firstClick = false
                local possiveisPosicoesFlores = {}
                for y=1,gridYCount do
                    for x=1,gridXCount do 
                        if not( x == selectedX and y == selectedY) then 
                            table.insert(possiveisPosicoesFlores,{x=x,y=y})
                        end
                    end
                end
            
                for flowerIndex = 1,40 do 
                    local posicao = table.remove(possiveisPosicoesFlores, love.math.random(#possiveisPosicoesFlores))
                    grade[posicao.y][posicao.x].flower = true
                end
            end
            if grade[selectedY][selectedX].flower then 
                grade[selectedY][selectedX].state = 'uncovered'
                gameOver = true
            else
                local pilha = {
                    {
                        x = selectedX,
                        y = selectedY
                    }
                }
        
                while #pilha > 0 do
                    local current = table.remove(pilha)
                    local x = current.x
                    local y = current.y
                    grade[y][x].state = 'uncovered'
        
                    if getFloresAoRedorCount(x, y) == 0 then 
                        for dy = -1,1 do
                            for dx = -1,1 do 
                                if not (dy == 0 and dx == 0)
                                    and grade[y + dy]
                                    and grade[y + dy][x + dx]
                                    and ( grade[y + dy][x + dx].state == 'covered' or grade[y + dy][x + dx].state == 'question' ) then 
                                        table.insert(pilha, {
                                            x = x + dx,
                                            y = y + dy
                                        })
                                end
                            end
                        end
                    end
                end
                local completo = true
                for y =1,gridYCount do 
                    for x = 1,gridXCount do 
                        if grade[y][x].state ~= 'uncovered' 
                        and not grade[y][x].flower then 
                            completo = false
                        end
                    end
                end
                if completo then 
                    gameOver=true
                end 
            end
        elseif button == 2 then 
            if grade[selectedY][selectedX].state == 'covered' then
                grade[selectedY][selectedX].state = 'flag'
    
            elseif grade[selectedY][selectedX].state == 'flag' then
                grade[selectedY][selectedX].state = 'question'
    
            elseif grade[selectedY][selectedX].state == 'question' then
                grade[selectedY][selectedX].state = 'covered'
            end    
        end
    else 
        reset()    
    end
end

function love.draw()
    for y = 1, gridYCount do
        for x = 1, gridXCount do
            local function drawCell(_image, _x, _y)
                love.graphics.draw(
                    _image,
                    (_x - 1) * cellSize, (_y - 1) * cellSize
                )    
            end
            if grade[y][x].state == 'uncovered' then 
                drawCell(images.uncovered,x,y)
            else
                if x == selectedX and y == selectedY and not gameOver then 
                    if love.mouse.isDown(1) then 
                        if grade[y][x].state == 'flag' then 
                            drawCell(images.covered,x,y)
                        else
                            drawCell(images['uncovered'], x, y)
                        end
                    else         
                        drawCell(images['covered_highlighted'], x, y)
                    end
                else     
                    drawCell(images['covered'], x, y)
                end
            end 

           
            if (grade[y][x].flower and gameOver) then 
                drawCell(images['flower'], x, y)
            elseif getFloresAoRedorCount(x,y)>0 
            and grade[y][x].state=='uncovered' then 
                drawCell(images[getFloresAoRedorCount(x,y)],x,y)    
            end

            if grade[y][x].state == 'flag' then
                drawCell(images.flag,x,y)
            elseif grade[y][x].state == 'question' then
                drawCell(images.question,x,y)
            end
        end
    end
   love.graphics.setColor(1,1,1)
   love.graphics.print('selected x: '..tostring(selectedX)..' selected y: '..tostring(selectedY),10,300)
end

function love.keypressed(key)
    if key == 'escape' then 
         love.event.quit()
    --else 
    --    love.load()     
    end
end
