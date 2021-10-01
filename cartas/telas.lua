--1. criar tela abertura [IMG], 
--         START
--         HELP 
--             tela de ajuda
--             tela de ensinar tecnica de loci/palacio mental
--             tela de doação 
--             tela de requisitar AD em video
--2. criar tela de pontuacao
--                 pontuacao : usuario, qte deques, num total cartas, qte acertos cartas, qte erros cartas, tempo memorizacao
--3. criar tela de escolher a quantidade de deques [IMG]
--         numDeques
--4. criar tela de visualizar as cartas/modo jogo
--      até 8 deques por subtela, cada subtela eh uma pagina, mostrar qual pagina está sendo exibida
--      botao rever cartas, botao iniciar jogo
--      clicar no deque na tela para selecionar
--      botao Qual carta? abre subtela
--             escolher numero : A 2 3 4 5 6 7 8 9 10 J Q K
--             escolher naipe  : heart, spade, club, diamond
--             botao Confirmar, botao Cancelar
--      avancar tela, voltar tela, primeira tela, ultima tela
--      pintar o deque atual de vermelho, ou claro; e os deques não trabalhados deve-se escurecer

function drawRButton(texto,x,y)

end

function drawCButton(texto,x,y)

end

function telaAbertura()
    love.graphics.setBackgroundColor(0/255,0/255,180/255)	
    love.graphics.print("CARD's MEMORY",240,100)
    love.graphics.print("START",240,140)
    love.graphics.print("HELP",240,180)
    love.graphics.draw(gui[1],300,130,0,1,1)
end

function telaDefinirQuantidadeDeques()
    love.graphics.print("HOW MANY DECKS?",100,100)

end

function telaVisualizarDeques()
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

function telaModoJogo()
    love.graphics.print("MODO JOGO - EM DESENVOLVIMENTO",100,100)

end

function subTelaInformarCarta(mostrar)
    -- A 2 3 4 5
    -- 6 7 8 9 10 
    -- J Q K
    -- heart spade club diamond
     if mostrar == true then 
         
     end
end

function telaPontuacao()
    love.graphics.print("PONTUACAO - EM DESENVOLVIMENTO",100,100)
end

function telaAjuda()
    love.graphics.print("TECNICA DE PALACIO MENTAL OU LOCI",100,100)
end

function telaRemoveAds()
    love.graphics.print("BUY ME AND REMOVE ADS : USD 5",100,100)
end

function telaDoacao()
    love.graphics.print("BUY ME A COFFEE!",100,100)
end


