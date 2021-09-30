

function love.load()
  Object = require "classic"

  require "baralho"
  require "funcoes"
  require "telas"

  images = {}
  for nameIndex, name in ipairs({
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
      'pip_heart', 'pip_diamond', 'pip_club', 'pip_spade',
      'mini_heart', 'mini_diamond', 'mini_club', 'mini_spade',
      'card', 'card_face_down',
      'face_jack', 'face_queen', 'face_king',
  }) do
      images[name] = love.graphics.newImage('images/'..name..'.png')
  end

  baralhos = {}

  table.insert(baralhos, Baralho(criarDeque()))
  --deque = criarDeque()
  --deque = embaralhar(deque)

  indice = 1
  numDeques = 1
  baralhos[indice]:setCartas(embaralhar(baralhos[indice]:getCartas()))
  --print(baralhos[indice]:qte())
  --print(baralhos[indice]:cont())
  --printCards(baralhos[indice]:getCartas())
end



function love.keypressed(key)
  if key=='escape' then
    love.event.quit()
  elseif key=='n' then
    baralhos[indice]:add() 
  elseif key=='p' then
    baralhos[indice]:rem()
  elseif key == 'e' then
    baralhos[indice]:setCartas(embaralhar(baralhos[indice]:getCartas()))
    --printCards(baralhos[indice]:getCartas())
    baralhos[indice]:zerar()
  end
end


function love.draw()

    local function drawCard(card, x, y)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(images.card, x, y)

        if card.suit == 'heart' or card.suit == 'diamond' then
          love.graphics.setColor(.89, .06, .39)
        else
          love.graphics.setColor(.2, .2, .2)
        end

        local cardWidth = 53
        local cardHeight = 73

        local function drawCorner(image, offsetX, offsetY)
          love.graphics.draw(
              image,
              x + offsetX,
              y + offsetY
          )
          love.graphics.draw(
              image,
              x + cardWidth - offsetX,
              y + cardHeight - offsetY,
              0,
              -1
          )
        end

      drawCorner(images[card.rank], 3, 4)
      drawCorner(images['mini_'..card.suit], 3, 14)

      if card.rank > 10 then
          local faceImage
          if card.rank == 11 then 
            faceImage = images.face_jack
          elseif card.rank == 12 then 
            faceImage = images.face_queen  
          elseif card.rank == 13 then 
            faceImage = images.face_king
          end
          love.graphics.setColor(1,1,1)
          love.graphics.draw(faceImage,x+12,y+11)  
      else
            local function drawPip(offsetX, offsetY, mirrorX, mirrorY)
              local pipImage = images['pip_'..card.suit]
              local pipWidth = 11

              love.graphics.draw(
                  pipImage,
                  x + offsetX,
                  y + offsetY
              )
              if mirrorX then
                  love.graphics.draw(
                      pipImage,
                      x + cardWidth - offsetX - pipWidth,
                      y + offsetY
                  )
              end
              if mirrorY then
                  love.graphics.draw(
                      pipImage,
                      x + offsetX + pipWidth,
                      y + cardHeight - offsetY,
                      0,
                      -1
                  )
              end
              if mirrorX and mirrorY then
                  love.graphics.draw(
                      pipImage,
                      x + cardWidth - offsetX,
                      y + cardHeight - offsetY,
                      0,
                      -1
                  )
              end
          end

          local xLeft = 11
          local xMid = 21
          local yTop = 7
          local yThird = 19
          local yQtr = 23
          local yMid = 31

          if card.rank == 1 then
              drawPip(xMid, yMid)

          elseif card.rank == 2 then
              drawPip(xMid, yTop, false, true)

          elseif card.rank == 3 then
              drawPip(xMid, yTop, false, true)
              drawPip(xMid, yMid)

          elseif card.rank == 4 then
              drawPip(xLeft, yTop, true, true)

          elseif card.rank == 5 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xMid, yMid)

          elseif card.rank == 6 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xLeft, yMid, true)

          elseif card.rank == 7 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xLeft, yMid, true)
              drawPip(xMid, yThird)

          elseif card.rank == 8 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xLeft, yMid, true)
              drawPip(xMid, yThird, false, true)

          elseif card.rank == 9 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xLeft, yQtr, true, true)
              drawPip(xMid, yMid)

          elseif card.rank == 10 then
              drawPip(xLeft, yTop, true, true)
              drawPip(xLeft, yQtr, true, true)
              drawPip(xMid, 16, false, true)
          end
      end
  end


if  baralhos[indice]:cont() < baralhos[indice]:qte() then 
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(images.card_face_down, 60, 20)
end

drawCard(baralhos[indice]:getCarta(), 2 * 60, 20)


end
