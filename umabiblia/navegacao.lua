
lume = require "lume"

function quebrarCapitulo(_biblia,_ab, _cap)
    local tt = {}
    for i=1,#_biblia do 
        local verso = _biblia[i]
        if verso.abrev == _ab and verso.capitulo == _cap then
            local ot = quebrarVerso(verso.versiculo, verso.texto)
            --for c, item in ipairs(ot) do table.insert(tt, item) end
            --print(#ot)
            tt[#tt + 1] = ot
        end
    end
    return tt
end

function salvar()
    local data = {}
    data.capitulo = gcapitulo
    data.livro = plivro
    local serialized = lume.serialize(data)
    love.filesystem.write("savedata.txt", serialized)
end

function carregar()
    if love.filesystem.getInfo("savedata.txt") then
        local file = love.filesystem.read("savedata.txt")
        local data = lume.deserialize(file)
        gcapitulo = data.capitulo
        plivro = data.livro
        carregarCapitulo()
    else
        gcapitulo = 23
        plivro = 19
        carregarCapitulo()
    end
end

function quebrarVerso(_verso,_texto)
    local tt = {}
    local texto = tostring(_verso)..". ".._texto
    
    if texto:len() <= maxLinha then
        table.insert(tt, texto)
    else
        local acum = ""
        --print(texto)
        for v in string.gmatch(texto,"%g+") do
            local s = acum..v
            if s:len() > maxLinha then
                table.insert(tt, acum)
                acum = v.." "                 
            else
                acum=acum..v.." "
            end
        end    
        table.insert(tt, acum)
    end
    return tt
end

function rolarPraBaixo()
    if rolar+numlinhas <= #textoCapituloAtual + 10 then
        rolar = rolar + 1    
    end
end

function rolarPraCima()
    if rolar > 1 then 
        rolar = rolar - 1    
    end    
end

function carregarCapitulo()
    rolar = 1 
    textoCapituloAtual = quebrarCapitulo(biblia,getLivro(plivro),gcapitulo)
    gerarQuadros(textoCapituloAtual, 580, 21, {1,1,1})
end

function proximoCapitulo()
    gcapitulo = gcapitulo + 1
    if gcapitulo > getNumeroCapitulos(getLivro(plivro)) and plivro <= 66 then
        gcapitulo = 1
        plivro = plivro + 1
    end
    if plivro > 66 then
        plivro = 66
        gcapitulo = 22
    end
    carregarCapitulo()
    salvar()
end

function anteriorCapitulo()
    gcapitulo = gcapitulo - 1
    if gcapitulo < 1 and plivro >= 1 then
        plivro = plivro - 1
        gcapitulo = getNumeroCapitulos(getLivro(plivro))
    end
    if plivro < 1 then
        plivro = 1
        gcapitulo = 1
    end
    carregarCapitulo()
    salvar()
end

function montarVetorLivros()
    local file = 'bliv.txt'
    local linhas=lines_from(file)
    local texto = {}
    for i,item in ipairs(linhas) do
        local p = item:sub(1,3)
        local contem = false
        for i=1,#texto do 
             if  texto[i] == p then
                 contem = true
                 break
             end
        end
        if not contem then
           texto[#texto+1] = p
        end
    end
    for i=1,#texto do print(texto[i]..",") end
end

function montarVetorTamanhosCapitulos()
    local biblia = carregar()
    local anterior = 1
    local livroatual = "GEN"
    for i,item in ipairs(biblia) do
        if item.abrev ~= livroatual then
            print("livros[\""..biblia[anterior].abrev.."\"]="..tostring(biblia[anterior].capitulo)) 
            livroatual = item.abrev
        end
        anterior = i
    end  
end

function novoBotao(id,texto,x,y,w,h,corTexto,corBotao,_tela)
    local t = {}
    t.id = id 
    t.texto = texto 
    t.x = x
    t.y = y 
    t.w = w 
    t.h = h 
    t.ct = corTexto 
    t.cb = corBotao 
    t.telaAtiva = _tela
    controles[#controles + 1] = t
end

function novoQuadro(textos, w, h, corTexto)
    local t = {}
    t.id = 'idq_'..tostring(#quadros + 1) 
    t.textos = textos
    t.x = -1
    t.y = -1 
    t.w = w 
    t.h = h * #textos
    t.ct = corTexto 
    t.cf = nil 
    quadros[#quadros + 1] = t
end

function buscarQuadroPorId(id)
    for i,v in ipairs(quadros) do
        if v.id == id then 
            return i
        end
    end
    return -1
end

function zerarQuadros()
    quadros = {}
end

function gerarQuadros(listaTextos, w, h, ct)
    zerarQuadros()
    for k,v in ipairs(listaTextos) do 
        novoQuadro(v, w, h, ct)  
    end
end

function haColisao(id,x,y,w,h,mx,my)
    local resultado = mx > x and mx < (x + w) and my > y and my < (y + h)
    --print (id,x,y,w,h,mx,my, resultado)
    if resultado then 
        return id
    end
    return nil
end



function loadRecursos()
    biblia={}
    maxLinha = 50        
    gcapitulo = 23
    numlinhas = 15
    rolar = 1
    plivro = 19  
    controles = {}
    quadros = {}
    telaAtiva = 1
    cores = {
        {r=0,g=0,b=0},
        {r=0.58,g=0,b=0},
        {r=0.58,g=0.58,b=0},
        {r=0,g=0.58,b=0},
        {r=0,g=0.58,b=0.58},
        {r=0,g=0,b=0.58},
        {r=0.58,g=0,b=0.58}
    }

    fundoCorAtiva = 1

    --carregar()
    novoBotao("bt2","Anterior",650,50,120,30,{1,1,1},{1,0,0},1)
    novoBotao("bt1","Proximo",650,100,120,30,{1,1,1},{1,0,0},1)
    novoBotao("bt3","Fundo Cor",650,180,120,30,{1,1,1},{0.4,0,0.5},1)
    --novoBotao("bt4","Descer",650,200,120,30,{1,1,1},{0.4,0,0.5},1)
    novoBotao("bt5","Livros",650,250,120,30,{1,1,1},{0,0.8,1},1)
    novoBotao("bt6","Capitulos",650,300,120,30,{1,1,1},{0,0.8,1},1)
    tela2w=11
    tela2h=7
    corFundo={0,0,0}
end

function leitura()
    local x = 32
    local y = 45

    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",x-2,y-2,600,362)

    love.graphics.setColor(1,0,0)
    love.graphics.print(getNomeLivro(getLivro(plivro)).." "..tostring(gcapitulo),225,y+3)
   -- love.graphics.print(tostring(#biblia),100,150)
    y = 70
    if #textoCapituloAtual > 0 then
        for i=rolar,rolar+numlinhas  do
            local v = textoCapituloAtual[i]
            if v==nil or v=="" then
                v=" "
            end
            if y < 400 then     
                love.graphics.setColor(1,1,1)
                love.graphics.print(v,x,y)
            end    
            y=y+22
        end
    end    
end