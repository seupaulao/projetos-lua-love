function carregarRecursos()
    controles = {}
    telaAtiva=1
    melodia = {}
    linha=1
    coluna=0
    oitava=3
    raio = 30
end

function carregarInterface()
    local x = 20
    local y = 40
    novoBotao(x,y,"Do",1,0,1)
    novoBotao(x,y+40,"Re",1,0,1)
    novoBotao(x+40,y,"Mi",1,0,1)
    novoBotao(x+40,y+40,"Fa",1,0,1)
    novoBotao(x+80,y,"Sol",1,0,1)
    novoBotao(x+80,y+40,"La",1,0,1)
    novoBotao(x+120,y,"Si",1,0,1)
    novoBotao(x+120,y+40,"#",1,0,1)

    novoBotao(x,y+80,"<",0,190/255,190/255)
    novoBotao(x+40,y+80,">",0,190/255,190/255)
    novoBotao(x+80,y+80,"^",0,190/255,190/255)
    novoBotao(x+120,y+80,"v",0,190/255,190/255)
    novoBotao(x+160,y+80,"+",102/255,32/255,190/255)

    novoBotao(x,y+120,"-8",0,0,1)
    novoBotao(x+40,y+120,"+8",0,0,1)
    novoBotao(x+120,y+120,"?",0,0,1)
    novoBotao(x+160,y+120,"R",102/255,32/255,190/255)

    novoBotao(x+40*0,y+160,"PA",0,202/255,0)
    novoBotao(x+40*1,y+160,"Pl",0,202/255,0)
    novoBotao(x+40*2,y+160,"Sp",0,202/255,0)
    novoBotao(x+40*3,y+160,"Ps",0,202/255,0)

    novoBotao(x+40*0,y+200,"C",102/255,102/255,0)
    novoBotao(x+40*1,y+200,"G",102/255,102/255,0)
    novoBotao(x+40*2,y+200,"D",102/255,102/255,0)
    novoBotao(x+40*0,y+240,"A",102/255,102/255,0)
    novoBotao(x+40*1,y+240,"E",102/255,102/255,0)
    novoBotao(x+40*2,y+240,"B",102/255,102/255,0)
    novoBotao(x+40*0,y+280,"F",102/255,102/255,0)
    novoBotao(x+40*1,y+280,"Bb",102/255,102/255,0)
    novoBotao(x+40*2,y+280,"Eb",102/255,102/255,0)
    novoBotao(x+40*0,y+320,"Ab",102/255,102/255,0)
    novoBotao(x+40*1,y+320,"Db",102/255,102/255,0)
    novoBotao(x+40*2,y+320,"Gb",102/255,102/255,0)
end


function novoBotao(_x,_y,_texto,_r,_g,_b)
    local t = {}
    t.id = "id_"..tostring(#controles+1)
    t.x = _x
    t.y = _y
    t.r = _r
    t.g = _g
    t.b = _b
    t.w = raio
    t.h = raio
    t.texto = _texto
    controles[#controles+1] = t
end

function drawBotao()
    for i,botao in ipairs(controles) do 
        love.graphics.setColor(botao.r,botao.g,botao.b)
        love.graphics.rectangle("fill",botao.x,botao.y,botao.w,botao.h)
        love.graphics.setColor(1,1,1) 
        love.graphics.print(botao.texto,botao.x+5,botao.y+10)
    end
end

--interessante usar uma fonte monospaced ou courier
function drawMelodia()
    local px = 260
    local py = 20
    for i,estrofe in ipairs(melodia) do
        for j,nota in ipairs(estrofe) do
            if i==linha and coluna==j then 
                love.graphics.setColor(1,0,0)
                love.graphics.rectangle("fill",px+45*(j-1)-3,py+35*(i-1)-5,raio+15,raio)
            end
            love.graphics.setColor(1,1,1)
            love.graphics.print(nota,px+45*(j-1),py+35*(i-1))
        end
    end
end

function drawPosicao()
    love.graphics.setColor(1,1,1)
    local y = 20
    love.graphics.print("Linha: "..tostring(linha),135,y+240)
    love.graphics.print("Coluna: "..tostring(coluna),135,y+260)
    love.graphics.print("Oitava: "..tostring(oitava),135,y+280)
end

function haColisao(id,x,y,w,h,mx,my)
    local resultado = mx > x and mx < (x + w) and my > y and my < (y + h)
    --print (id,x,y,w,h,mx,my, resultado)
    if resultado then 
        return id
    end
    return nil
end


function controleTela1(x,y)
    for i,item in ipairs(controles) do
        local _id = haColisao(item.id, item.x, item.y, item.w, item.h, x, y)
        if _id ~= nil then
            dispararFuncaoId(_id)
            break
        end
    end
end
