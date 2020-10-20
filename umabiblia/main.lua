function love.load()
    
    require "dados"
    require "navegacao"
    loadRecursos()
    require "biblia"
    tfonte = 18
    fonte = love.graphics.newFont("courier.ttf",tfonte)
    love.graphics.setFont(fonte)
    carregar()
    camera ={
        x = 32,
        y = 70
    }
    delta = 0
    clicado = false
end

function love.update(dt)

end

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    elseif key=="down" then
        camera.y = camera.y + 20
        --rolarPraBaixo()
    elseif key=="up" then
        camera.y = camera.y - 20
        --rolarPraCima()
    elseif key=="right" then
        proximoCapitulo()
        camera ={x = 32,y = 70}
    elseif key=="left" then
        anteriorCapitulo()
        camera ={x = 32,y = 70}
    end    
end

function dispararFuncaoId(id)
    if id == "bt1" then
        proximoCapitulo()
        camera ={x = 32,y = 70}
    elseif id == "bt2" then
        anteriorCapitulo()
        camera ={x = 32,y = 70}
    elseif id == "bt3" then
        --camera.y = camera.y - 20
        fundoCorAtiva = fundoCorAtiva + 1
        if fundoCorAtiva > #cores then 
            fundoCorAtiva = 1
        end
    elseif id == "bt4" then
        --camera.y = camera.y + 20
    elseif id == "bt5" then
        telaAtiva=2
    elseif id == "bt6" then
        telaAtiva=3
    end
end

function love.mousemoved( x, y, dx, dy, istouch)
    if clicado then
        if y > delta then camera.y = camera.y - 2 end
        if y < delta then camera.y = camera.y + 2 end
    else
        delta = 0    
    end
end

function love.mousereleased( x, y, button, istouch, presses )
    clicado = false
end

function controleTela1(x,y)
    for i,item in ipairs(controles) do
        local _id = haColisao(item.id, item.x, item.y, item.w, item.h, x, y)
        if _id ~= nil then
            dispararFuncaoId(_id)
            break
        end
    end
--    for i,item in ipairs(quadros) do
--        local _id = haColisao(item.id, item.x, item.y, item.w, item.h, x, y)
--        if _id ~= nil then
--            local posicao = buscarQuadroPorId(_id)
--            if quadros[posicao].cf ==nil then
--                quadros[posicao].cf={0.38,0.58,0.72}
--            else
--                quadros[posicao].cf=nil
--            end
--        end
--    end
--
end

function controleTela2(x,y)
    local w = math.floor(love.graphics.getWidth()/tela2w)
    local h = math.floor(love.graphics.getHeight()/tela2h)
    local cx = math.floor(x/w) + 1
    local cy = math.floor(y/h) + 1
    if cx==1 and cy==1 then
        telaAtiva = 1
    elseif cy > 1 then
        plivro = tela2w * (cy - 2) + cx
        telaAtiva = 3
        gcapitulo = 1
        --textoCapituloAtual = quebrarCapitulo(biblia,getLivro(plivro),gcapitulo)
    end
end

function controleTela3(x,y)
        --15 horizontal
        --10 vertical
        local tw = 15
        local th = 10
        local ajusteh = 32
        local ajustew = 48
        local ajustehp2 = math.floor(ajusteh/2)
        local ajustewp2 = math.floor(ajustew/2)
        local w = math.floor((love.graphics.getWidth()-ajustew)/tw)
        local h = math.floor((love.graphics.getHeight()-ajusteh)/th)
        x = x - ajustewp2
        y = y - ajustehp2
        local cx = math.floor(x/w) + 1 
        local cy = math.floor(y/h) + 1 
        telaAtiva = 1
        gcapitulo = 15 * (cy - 1) + cx
        local _total = getNumeroCapitulos(getLivro(plivro))
        --print(getLivro(plivro), _total)
        if gcapitulo > _total then
            gcapitulo = _total  
        end
        carregarCapitulo()
        salvar()
end

function love.mousepressed(x,y)
    if telaAtiva==1 then
        delta = y
        clicado = true
        controleTela1(x,y)
    elseif telaAtiva == 2 then
        controleTela2(x,y)
    elseif telaAtiva == 3 then
        controleTela3(x,y)
    end

end
---problemas 
---1. acentos
---4. marcar o quadro/texto e gravar a marcacao por livro/cap/versiculo


function desenharCabecalho(_y)
    love.graphics.setColor(1,0,0)
    love.graphics.print(getNomeLivro(getLivro(plivro)).." "..tostring(gcapitulo),225,_y+3)
end

function leituraPorQuadro()
    local x = 32
    local y = 45
    love.graphics.push()
   -- love.graphics.rotate(270 * math.pi / 180)
    if camera.y <= 70 then camera.y = 70 end
    love.graphics.translate(-camera.x+x, -camera.y+y)
    desenharCabecalho(y)
    y = 70
    for indice, quadro in ipairs(quadros) do
        desenharQuadro(quadro,x,y)
        y = y + 22 * #quadro.textos
    end 
    love.graphics.pop()
end

function livrosNaTela()
    local w = math.floor(love.graphics.getWidth()/tela2w)
    local h = math.floor(love.graphics.getHeight()/tela2h)
    local c = 1
    for i=1,tela2h do
        for j=1,tela2w do
            if i == 2 and c <= 5 then 
                love.graphics.setColor(0,102/255,1)
            elseif c > 5 and c < 18 then
                love.graphics.setColor(0,1,0)
            elseif c >= 18 and c <= 22 then
                love.graphics.setColor(0,1,1)
            elseif c >= 23 and c <= 27 then
                love.graphics.setColor(1,0.5,0.8)
            elseif c >= 28 and c <= 39 then
                love.graphics.setColor(0.0,0.7,0.7)
            elseif c >= 40 and c <= 44 then
                love.graphics.setColor(1,1,0.0)
            elseif c >= 45 and c <= 58 then
                love.graphics.setColor(0.7,0.7,0.5)
            elseif c >= 59 and c <= 59 then
                love.graphics.setColor(0.3,0.8,0.4)
            elseif c >= 60 and c <= 61 then
                love.graphics.setColor(204/255,102/255,1)
            elseif c >= 62 and c <= 64 then
                love.graphics.setColor(1,102/255,0)
            elseif c >= 65 and c <= 65 then
                love.graphics.setColor(204/255,51/255,0)
            elseif c >65 then
                love.graphics.setColor(1,0,0)
            else
                love.graphics.setColor(1,0,1)
            end
            love.graphics.rectangle("fill",w*(j-1),h*(i-1),w-1,h-1)
            love.graphics.setColor(0,0,0)
            if i==1 and j==1 then
                love.graphics.print("VOLTAR",w*(j-1)+5,h*(i-1)+35)
            elseif i>1 then
                love.graphics.print(getLivro(c),w*(j-1)+15,h*(i-1)+35)
                c = c + 1
            end
        end
    end
end

function capitulosNaTela()
   local tw = 15
   local th = 10
   local ajusteh = 32
   local ajustew = 48
   local ajustehp2 = math.floor(ajusteh/2)
   local ajustewp2 = math.floor(ajustew/2)
   local w = math.floor((love.graphics.getWidth()-ajustew)/tw)
   local h = math.floor((love.graphics.getHeight()-ajusteh)/th)
   local _total = getNumeroCapitulos(getLivro(plivro))
   local c = 1
   love.graphics.push()
   love.graphics.translate(ajustewp2, ajustehp2)
   for i=1,th do
        for j=1,tw do
            local x = w * (j - 1) 
            local y = h * (i - 1) 
            love.graphics.setColor(0.3,0.3,0.3) 
            love.graphics.rectangle("fill",x,y,w-1,h-1)
            love.graphics.setColor(0,0,0)
            if c <= _total then
                love.graphics.print(tostring(c),x+15,y+25)
            end
            c = c + 1
        end
    end
    love.graphics.pop()
    
end

function desenharTela()
    if telaAtiva == 1 then
        --leitura()
        leituraPorQuadro()
    elseif telaAtiva == 2 then 
        livrosNaTela()        
    elseif telaAtiva == 3 then 
        capitulosNaTela()        
    end
end

function desenharControles(_tela)
    for i=1,#controles do 
       local item =  controles[i] 
       if item.telaAtiva == _tela then
            if item.id:sub(1,2) == "bt" then
                love.graphics.setColor(item.cb[1], item.cb[2], item.cb[3])
                love.graphics.rectangle("fill", item.x, item.y, item.w, item.h)
                love.graphics.setColor(item.ct[1], item.ct[2], item.ct[3])
                love.graphics.print(item.texto,item.x+15,item.y+item.h/3)
            end
       end
    end
end

function desenharQuadro(quadro, _x, _y)
    quadro.x = _x+2
    quadro.y = _y-1

    if quadro.cf == nil then 
        love.graphics.setColor(cores[fundoCorAtiva].r,cores[fundoCorAtiva].g,cores[fundoCorAtiva].b)
    else
        love.graphics.setColor(quadro.cf[1],quadro.cf[2],quadro.cf[3])
    end
    love.graphics.rectangle("fill",quadro.x,quadro.y,quadro.w,quadro.h)
    love.graphics.setColor(quadro.ct[1],quadro.ct[2],quadro.ct[3])
    local itens = quadro.textos
    for i,v in ipairs(itens) do
        love.graphics.print(v, quadro.x, _y + 22 * (i - 1))
    end
end

function love.draw()
    desenharTela()
    desenharControles(telaAtiva)
end
