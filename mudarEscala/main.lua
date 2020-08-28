function love.load()
    require "desenho"
    require "funcoes"
    tfonte = 15
    fonte = love.graphics.newFont("UbuntuMono-B.ttf",tfonte)
    love.graphics.setFont(fonte)
    carregarRecursos()
    carregarInterface()
end

function love.keypressed(key)
    if key=='escape' then 
        love.event.quit()
    end
end

function love.mousepressed(x,y)
    if telaAtiva==1 then
        controleTela1(x,y)
    end
end

function love.draw()
    drawBotao()
    drawMelodia()
    drawPosicao()
end
