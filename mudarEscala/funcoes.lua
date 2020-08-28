function getTom(_melodia)
    tom = {}
    tom['lab'] = {'sol#','la#','do#','re#'}
    tom['mib'] = {'re#','sol#','la#'}
    tom['sib'] = {'la#','re#'}
    tom['fa'] = {'la#'}
    tom['do'] = {}
    tom['sol'] = {'fa#'}
    tom['re'] = {'fa#','do#'}
    tom['la'] = {'do#','fa#','sol#'}
    tom['mi'] = {'fa#','sol#','do#','re#'}
    tom['si'] = {'do#','re#','fa#','sol#','la#'}
    local lista1 = {}
    for i, linha in ipairs(_melodia) do
        for j, nota in ipairs(linha) do 
            if nota:match("#") ~= nil then
                if contem(nota, lista1)==false then  
                    lista1[#lista1 + 1] = nota:lower()
                end
            end
        end
    end
    if #lista1 == 0 then 
        return 'do'
    end
    for nota, lista2 in ipairs(tom) do 
        if listaTemTodos(lista1, lista2) then 
            return nota
        end    
    end
    return nil
end

function listaTemTodos(_lista1, _lista2)
    if #_lista1 ~= #_lista2 then 
       return false  
    end
    for i, nota in ipairs(_lista1) do 
        if contem(nota, _lista2)==false then 
            return false
        end
    end
    return true
end

function contem(_valor, _lista)
    for _, x in ipairs(_lista) do
        if x == _valor then 
            return true
        end
    end
    return false
end


-- 1. calcular a mudanca de escala para escala 3 e 4
-- 2. calcular a mudanca de escala para todas as escalas
function mudarEscala(_tomdestino, _melodia)
    escala={}
    escala['solb'] = {'fa#','sol#','la#','si','do#','re#','fa'}
    escala['reb'] = {'do#','re#','fa','fa#','sol#','la#','do'}
    escala['lab'] = {'sol#','la#','do','do#','re#','fa','sol'}
    escala['mib'] = {'re#','fa','sol','sol#','la#','do','re'}
    escala['sib'] = {'la#','do','re','re#','fa','sol','la'}
    escala['fa'] = {'fa','sol','la','la#','do','re','mi'}
    escala['do'] = {'do','re','mi','fa','sol','la','si'}
    escala['sol'] = {'sol','la','si','do','re','mi','fa#'}
    escala['re'] = {'re','mi','fa#','sol','la','si','do#'}
    escala['la'] = {'la','si','do#','re','mi','fa#','sol#'}
    escala['mi'] = {'mi','fa#','sol#','la','si','do#','re#'}
    escala['si'] = {'si','do#','re#','mi','fa#','sol#','la#'}
    --calcular a nova melodia baseada no tom atual e o tom destino
    local escalaOrigem = escala[getTom(_melodia)]
    local escalaDestino = escala[_tomdestino]
    local novaMelodia = {}
end

function testeOitava(_texto)
    if oitava==2 then 
        return _texto.."2"
    elseif oitava==3 then 
            return _texto
    elseif oitava==4 then
            return string.upper(_texto)
    elseif oitava==5 then
            return string.upper(_texto).."5"
    end
end


function dispararFuncaoId(id)
    if id == "id_1" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("do")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_2" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("re")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_3" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("mi")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_4" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("fa")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_5" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("sol")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_6" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("la")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_7" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota=testeOitava("si")
        --print(nota)
        coluna = coluna + 1
        estrofe[coluna]=nota
        melodia[linha] = estrofe        
    elseif id == "id_8" then
        local estrofe = melodia[linha]
        if estrofe == nil then
            estrofe = {}
        end
        local nota="#"
        estrofe[coluna]=estrofe[coluna]..nota
        melodia[linha] = estrofe        
    elseif id == "id_9" then
        coluna = coluna - 1
        if coluna <= 0 then coluna = 1 end
    elseif id == "id_10" then
        coluna = coluna + 1
        if coluna > #melodia[linha] then coluna = #melodia[linha] end
    elseif id == "id_11" then
        linha = linha - 1
        if linha <= 0 then linha = 1 end
    elseif id == "id_12" then
        linha = linha + 1
        if linha > #melodia then linha=#melodia end
    elseif id == "id_13" then
        linha = linha + 1
        coluna = 0
    elseif id == "id_14" then
        oitava = oitava - 1
        if oitava < 2 then oitava = 2 end 
    elseif id == "id_15" then
        oitava = oitava + 1
        if oitava > 5 then oitava = 5 end 
    elseif id == "id_17" then
        melodia = {}
        coluna = 0
        linha = 1
    elseif id == "id_22" then
        mudarEscala("do",melodia)
    elseif id == "id_23" then
        mudarEscala("sol",melodia)
    elseif id == "id_24" then
        mudarEscala("re",melodia)
    elseif id == "id_25" then
        mudarEscala("la",melodia)
    elseif id == "id_26" then
        mudarEscala("mi",melodia)
    elseif id == "id_27" then
        mudarEscala("si",melodia)
    elseif id == "id_28" then
        mudarEscala("fa",melodia)
    elseif id == "id_29" then
        mudarEscala("sib",melodia)
    elseif id == "id_30" then
        mudarEscala("mib",melodia)
    elseif id == "id_31" then
        mudarEscala("lab",melodia)
    elseif id == "id_32" then
        mudarEscala("reb",melodia)
    elseif id == "id_33" then
        mudarEscala("solb",melodia)
    end
end
