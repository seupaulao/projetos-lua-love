--divisor de tensao de dois resistores
function dtensao(r1,r2,vem)
	return vem * (r2 / (r2+r1))
end

--resistor 2 de uma divisao de tensao
function r2(vem, vfora, r1)
	local r2 = (vfora / (vem - vfora)) * r1
	return r2
end

--associacao em paralelo
function rfparalelo(resistores)
    local soma = 0
    for i=1,#resistores do 
        soma = soma + 1/resistores[i]
    end     
	return 1/soma
end

--associacao em paralelo
function rfserie(resistores)
	local soma = 0
    for i=1,#resistores do 
        soma = soma + resistores[i]
    end
    return soma
end

function potenciaDissipadaResistor(r,i)
	return r * i * i
end

function criarFaixa(nomecor, cor, faixa, multiplicador, tolerancia)
    local t = {}  
    t.nomecor = nomecor
    t.cor = cor
    t.faixa = faixa
    t.multiplicador = multiplicador
    t.tolerancia = tolerancia
    faixas[#faixas + 1] = t
end

function getFaixa(_nomecor)
    for i,v in ipairs(faixas) do
        if v.nomecor == _nomecor then 
            return v
        end
    end
end

function analisarFaixa(_nomefaixa)
    local faixa = getFaixa(_nomefaixa)
    if contaFaixa <= numeroFaixas then
       if contaFaixa == 1 and numeroFaixas == 4 then
            texto = texto..tostring(faixa.faixa)
       elseif contaFaixa == 2 and numeroFaixas == 4 then
            texto = texto..tostring(faixa.faixa)
       elseif contaFaixa == 3 and numeroFaixas == 4 then
            local numero = tonumber(texto)
            numero = numero * faixa.multiplicador
            texto = tostring(numero)
       elseif contaFaixa == 4 and numeroFaixas == 4 then
            local numero = tonumber(texto)
            local dif = numero * faixa.tolerancia
            local n1 = numero - dif 
            local n2 = numero + dif
            texto = tostring(numero).." Ohm e faixa = "..n1.."  a  "..n2    
            mostrarBotoes = false
       elseif contaFaixa == 1 and numeroFaixas == 5 then
            texto = texto..tostring(faixa.faixa)
       elseif contaFaixa == 2 and numeroFaixas == 5 then
            texto = texto..tostring(faixa.faixa)
       elseif contaFaixa == 3 and numeroFaixas == 5 then
             texto = texto..tostring(faixa.faixa)
       elseif contaFaixa == 4 and numeroFaixas == 5 then
            local numero = tonumber(texto)
            numero = numero * faixa.multiplicador
            texto = tostring(numero)   
       elseif contaFaixa == 5 and numeroFaixas == 5 then
            local numero = tonumber(texto)
            local dif = numero * faixa.tolerancia
            local n1 = numero - dif 
            local n2 = numero + dif
            texto = tostring(numero).." Ohm e faixa = "..n1.."  a  "..n2    
            mostrarBotoes = false
       end
    else
       contaFaixa = 1
       texto = "0".." Ohm"
    end
    contaFaixa = contaFaixa + 1
 end

function criarFaixas()
    criarFaixa("preto",{0,0,0},0,1,-1)
    criarFaixa("marrom",{153/255,102/255,51/255},1,10,0.01)
    criarFaixa("vermelho",{1,0,0},2,100,0.02)
    criarFaixa("laranja",{1,102/255,0},3,1000,-1)
    criarFaixa("amarelo",{1,1,0},4,10000,-1)
    criarFaixa("verde",{0,1,0},5,100000,0.0005)
    criarFaixa("azul",{0,0,1},6,1000000,0.0025)
    criarFaixa("violeta",{1,0,1},7,10000000,0.001)
    criarFaixa("cinza",{128/255,128/255,128/255},8,-1,0.00005)
    criarFaixa("branco",{1,1,1},9,-1,-1)
    criarFaixa("dourado",{204/255,204/255,0},-1,0.1,0.05)
    criarFaixa("prateado",{191/255,191/255,191/255},-1,0.01,0.1)
end

function loadResources()
    faixas={}
    criarFaixas()
end

function escreveFaixa(faixa,x,y)
    love.graphics.setColor(faixa.cor[1],faixa.cor[2],faixa.cor[3])
    love.graphics.circle("fill",x,y+5,10)
    love.graphics.setColor(1,1,1)
    local s = faixa.nomecor
    love.graphics.print(s,x+20,y)
    if faixa.faixa > 0 then
        s=faixa.faixa
    else
        s="-"
    end
    love.graphics.print(s,x+100,y)
    if faixa.multiplicador > 0 then
        s=faixa.multiplicador
    else
        s="-"
    end
    love.graphics.print(s,x+180,y)
    if faixa.tolerancia > 0 then
        s=faixa.tolerancia
    else
        s="-"
    end    
    love.graphics.print(s,x+300,y)
end

function printLegenda()
    local x = 10
    local y = 10
    love.graphics.print("NOME",x+20,y)
    love.graphics.print("FAIXA",x+100,y)
    love.graphics.print("MULTIPLICADOR",x+180,y)
    love.graphics.print("TOLERANCIA",x+300,y)
    y = 40 
    
    for i,v in ipairs(faixas) do 
        escreveFaixa(v,x,y + (i-1) * 20)
    end
end

function printTeste()
    print()
    print("entrada = 12V, saida = 9V, R1 = 1k Ohm          R2         =  "..tostring(r2(12, 9, 1000)).." ohms")
    print("entrada = 12V, saida = 5V, R1 = 1k Ohm          R2         =  "..tostring(r2(12, 5, 1000)).." ohms")
    print("entrada = 220V, saida = 5V, R1 = 1k Ohm         R2         =  "..tostring(r2(12, 9, 1000)).." ohms")
    print("entrada = 220V, saida = 3.3V, R1 = 1k Ohm       R2         =  "..tostring(r2(12, 3.3, 1000)).." ohms")
    print("entrada = 220V, saida = 3V, R1 = 1k Ohm         R2         =  "..tostring(r2(12, 3, 1000)).." ohms")
    print("entrada = 9V, saida = 1.5V, R1 = 10k Ohm        R2         =  "..tostring(r2(12, 3, 10000)).." ohms")
    print()
    print("R1 = 1000, R2=1000,                             RF paralelo=  "..tostring(rfparalelo({1000,1000})).." ohms")
    print("R1 = 1000, R2=1000,R3=1000,                     RF paralelo=  "..tostring(rfparalelo({1000,1000,1000})).." ohms")
    print("R1 = 1000, R2=330,                              RF paralelo=  "..tostring(rfparalelo({1000,330})).." ohms")
    print("R1 = 300, R2=400,                               RF serie   =  "..tostring(rfserie({300,400})).." ohms")
    print()
    local valor = rfserie({1000,rfparalelo({10000, 330})})
    print("resistor circuito misto,                        RF         =  "..tostring(valor).." ohms")
    print("potencia dissipada                                         =  "..tostring(potenciaDissipadaResistor(valor, 10)).." watts")    
end


