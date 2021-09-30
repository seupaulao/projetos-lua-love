--1. criar tela abertura, 
--         START
--         HELP 
--             tela de ajuda
--             tela de ensinar tecnica de loci/palacio mental
--             tela de doação
--             tela de requisitar AD em video
--2. criar tela de pontuacao
--                 pontuacao : usuario, qte deques, num total cartas, qte acertos cartas, qte erros cartas, tempo memorizacao
--3. criar tela de escolher a quantidade de deques
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
    love.graphics.print("CARD's MEMORY",100,100)
    love.graphics.print("START",240,100)
    love.graphics.print("HELP",360,100)
end

function telaDefinirQuantidadeDeques()
    love.graphics.print("HOW MANY DECKS?",100,100)

end

function telaVisualizarDeques()

end

function telaModoJogo()

end

function subTelaInformarCarta()

end

function telaPontuacao()

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

function telaReqVideo()
    love.graphics.print("PATRON ME! WATCH THE AD!",100,100)
end
