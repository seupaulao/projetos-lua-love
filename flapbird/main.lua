function love.load()
    birdX = 62
    birdWidth = 30
    birdHeight = 25
    playingAreaWidth = love.graphics.getWidth()
    playingAreaHeight = love.graphics.getHeight()
    pipeSpaceHeight = 100
    pipeWidth = 54

    function newPipeSpaceY()
        local pipeSpaceYMin = 54
        local pipeSpaceY = love.math.random(
            pipeSpaceYMin,
            playingAreaHeight - pipeSpaceHeight - pipeSpaceYMin
        )
        return pipeSpaceY
    end

    function reset()
        birdY = 200
        birdYSpeed = 0
    
        pipe1X = playingAreaWidth
        pipe1SpaceY = newPipeSpaceY()
    
        pipe2X = playingAreaWidth + ((playingAreaWidth + pipeWidth) / 2)
        pipe2SpaceY = newPipeSpaceY()
    
        score = 0
        upcomingPipe = 1    

        pipeXSpeed = 60
    end
  
    reset()
end

function love.update(dt)
    birdYSpeed = birdYSpeed + (516 * dt)
    birdY = birdY + birdYSpeed * dt

    local function movePipe(pipeX, pipeSpaceY)
        pipeX = pipeX - (pipeXSpeed * dt)
        if (pipeX + pipeWidth) < 0 then
            pipeX = playingAreaWidth
            pipeSpaceY = newPipeSpaceY()
        end 
        return pipeX, pipeSpaceY
    end

    pipe1X, pipe1SpaceY = movePipe(pipe1X, pipe1SpaceY)
    pipe2X, pipe2SpaceY = movePipe(pipe2X, pipe2SpaceY)

    local function isBirdCollidingWithPipe(_pipeX, _pipeSpaceY)
        return birdX < (_pipeX + pipeWidth) 
        and (birdX + birdWidth) > _pipeX 
        and (birdY < _pipeSpaceY or (birdY + birdHeight) > (_pipeSpaceY + pipeSpaceHeight)) 
    end    

    if isBirdCollidingWithPipe(pipe1X, pipe1SpaceY) or 
       isBirdCollidingWithPipe(pipe2X, pipe2SpaceY) or 
       birdY > playingAreaHeight 
    then
        reset()
    end

    local function atualizarScore(estePipe, pipeX, outroPipe)
        if upcomingPipe == estePipe
        and (birdX > (pipeX + pipeWidth)) then
            score = score + 1
            if score % 2 == 0 then 
                pipeXSpeed = pipeXSpeed + 25
            end
            upcomingPipe = outroPipe
        end    
    end
    atualizarScore(1, pipe1X, 2)
    atualizarScore(2, pipe2X, 1)
end

function love.mousepressed( x, y, button, istouch, presses) 
    if birdY > 0 then
        birdYSpeed = -165
   end
end


function love.draw()
    --fundo
    love.graphics.setColor(0.14,0.36,0.46)
    love.graphics.rectangle("fill",0,0,playingAreaWidth,playingAreaHeight)
    --bird
    love.graphics.setColor(0.87, 0.84, 0.27)
    love.graphics.rectangle('fill', birdX, birdY, birdWidth, birdHeight)
    --tubes
   
    local function drawPipe(pipeX, pipeSpaceY)
        love.graphics.setColor(.37, .82, .28)
        love.graphics.rectangle(
            'fill',
            pipeX,
            0,
            pipeWidth,
            pipeSpaceY
        )
        love.graphics.rectangle(
            'fill',
            pipeX,
            pipeSpaceY + pipeSpaceHeight,
            pipeWidth,
            playingAreaHeight - pipeSpaceY - pipeSpaceHeight
        )
      end
    
  
      drawPipe(pipe1X, pipe1SpaceY)
      drawPipe(pipe2X, pipe2SpaceY)

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(score, 15, 15)
end

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    end
end