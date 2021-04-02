function love.load()
    cellSize = 15
    gridXCount = math.floor(love.graphics.getWidth()/cellSize)
    gridYCount = math.floor(love.graphics.getHeight()/cellSize)
    
    --comida que aumenta 1 celula
    --comida que aumenta 2 celulas
    --comida bomba que mata pelo tempo se nao for consumida
    ------explosao da bomba
    ------quebrar a cobra ao explodir bomba
    --comida que aumenta a velocidade
    --inimigo que cruza a tela em diagonal
    --comida que aumenta 1 celula e coloca as paredes
    --comida que retira as paredes
    --comida que reduz 1 celula
    --comida chave que abre uma porta para outro nivel
    --timer para cada comida diferente (aparecer e desaparecer)
    --tocar na tela e ir : esquerda e direita

    function moveFood()
        local possibleFoodPositions = {}

        for foodX = 1, gridXCount do
            for foodY = 1, gridYCount do
                local possible = true

                for segmentIndex, segment in ipairs(snakeSegments) do
                    if foodX == segment.x and foodY == segment.y then
                        possible = false
                    end
                end

                if possible then
                    table.insert(possibleFoodPositions, {x = foodX, y = foodY})
                end
            end
        end

        foodPosition = possibleFoodPositions[love.math.random(#possibleFoodPositions)]
    end

    function reset()
        snakeSegments = {
            {x = 3, y = 1},
            {x = 2, y = 1},
            {x = 1, y = 1},
        }
        directionQueue = {'right'}
        timer = 0
        snakeAlive = true
        moveFood()        
    end

    reset()

end

function love.update(dt)
    timer = timer + dt
    if snakeAlive then 

        local timerLimit = 0.15
        if timer >= timerLimit then
            timer = timer - timerLimit
    
            if #directionQueue>1 then
                table.remove(directionQueue,1)
            end
    
            local nextXPosition = snakeSegments[1].x
            local nextYPosition = snakeSegments[1].y
    
            if directionQueue[1] == 'right' then
                nextXPosition = nextXPosition + 1
                if nextXPosition > gridXCount then nextXPosition = 1 end
            elseif directionQueue[1] == 'left' then
                nextXPosition = nextXPosition - 1
                if nextXPosition < 1 then nextXPosition = gridXCount end
            elseif directionQueue[1] == 'down' then
                nextYPosition = nextYPosition + 1
                if nextYPosition > gridYCount then nextYPosition = 1 end
            elseif directionQueue[1] == 'up' then
                nextYPosition = nextYPosition - 1
                if nextYPosition < 1 then nextYPosition = gridYCount end
            end
    
    
            local canMove = true
    
            for segmentIndex, segment in ipairs(snakeSegments) do
                if segmentIndex ~= #snakeSegments
                and nextXPosition == segment.x
                and nextYPosition == segment.y then
                    canMove = false
                end
            end
    
            if canMove then 
                table.insert(snakeSegments, 1, {x = nextXPosition, y = nextYPosition})
        
                if snakeSegments[1].x == foodPosition.x and snakeSegments[1].y == foodPosition.y  then
                    moveFood()
                else 
                    table.remove(snakeSegments)
                end
            else 
                snakeAlive = false    
            end
        end
    elseif timer >= 2 then
        reset()
    end
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    elseif key == 'right'
    and directionQueue[#directionQueue] ~= 'right'
    and directionQueue[#directionQueue] ~= 'left' then
        table.insert(directionQueue, 'right')

    elseif key == 'left'
    and directionQueue[#directionQueue] ~= 'left'
    and directionQueue[#directionQueue] ~= 'right' then
        table.insert(directionQueue, 'left')

    elseif key == 'up'
    and directionQueue[#directionQueue] ~= 'up'
    and directionQueue[#directionQueue] ~= 'down' then
        table.insert(directionQueue, 'up')

    elseif key == 'down'
    and directionQueue[#directionQueue] ~= 'down'
    and directionQueue[#directionQueue] ~= 'up' then
        table.insert(directionQueue, 'down')
    end
end

function love.draw()
   
    
    local function drawCell(x, y)
        love.graphics.rectangle(
            'fill',
            (x - 1) * cellSize,
            (y - 1) * cellSize,
            cellSize - 1,
            cellSize - 1
        )
    end

    for segmentIndex, segment in ipairs(snakeSegments) do
        if snakeAlive then
            love.graphics.setColor(.6, 1, .32)
        else
            love.graphics.setColor(.5, .5, .5)
        end
        drawCell(segment.x, segment.y)
    end

    love.graphics.setColor(1, .3, .3)
    drawCell(foodPosition.x, foodPosition.y)

end