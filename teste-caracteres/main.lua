function criarVerso(_colecao,_abrev, _cap, _verso, _texto, _corTexto)
    local t = {}
    t.abrev = _abrev
    t.capitulo = _cap
    t.versiculo = _verso
    t.texto = _texto
    _colecao[#_colecao+1] = t
end

function carregarDemo()
    local biblia={}
    criarVerso(biblia, "PSA", 23, 1, "Salmo de Davi:O SENHOR é meu pastor, nada me faltará.")
    criarVerso(biblia, "PSA", 23, 2, "Ele me faz deitar em pastos verdes, [e] me leva a águas quietas.")
    criarVerso(biblia, "PSA", 23, 3, "Ele restaura minha alma, [e] me guia pelos caminhos da justiça por seu nome.")
    criarVerso(biblia, "PSA", 23, 4, "Ainda que eu venha a andar pelo vale da sombra da morte, não temerei mal algum, porque tu estás comigo; tua vara e teu cajado me consolam.")
    criarVerso(biblia, "PSA", 23, 5, "Tu preparas uma mesa diante de mim à vista de meus adversários; unges a minha cabeça com azeite, meu cálice transborda.")
    criarVerso(biblia, "PSA", 23, 6, "Certamente o bem e a bondade me seguirão todos os dias de minha vida; e habitarei na casa do SENHOR por muitos e muitos dias.")
    return biblia
end

function quebrarCapitulo(_biblia,_ab, _cap)
    local tt = {}
    for i=1,#_biblia do 
        local verso = _biblia[i]
        if verso.abrev == _ab and verso.capitulo == _cap then
            local ot = quebrarVerso(verso.versiculo, verso.texto, 45)
            for c, item in ipairs(ot) do table.insert(tt, item) end
        end
    end
    return tt
end

function quebrarVerso(_verso,_texto, _maxLinha)
    local tt = {}
    local texto = tostring(_verso)..". ".._texto
    
    if texto:len() <= _maxLinha then
        table.insert(tt, texto)
    else
        local temp = texto
        while math.floor(temp:len()/_maxLinha) >= 1 do
            table.insert(tt, temp:sub(1,_maxLinha))
            temp = temp:sub(_maxLinha+1)   
        end
        table.insert(tt, temp)
    end
    return tt
end


function love.load()
    --fonte = love.graphics.newFont("courier.ttf",20)
    --love.graphics.setFont(fonte)
    utf8 = require("utf8")
    biblia = carregarDemo()
    texto = quebrarCapitulo(biblia,'PSA',23)
end


function love.draw()
    local y = 20
    for i,v in ipairs(texto) do
        love.graphics.print(v,20,y)
        y=y+15
    end
   
end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
end
