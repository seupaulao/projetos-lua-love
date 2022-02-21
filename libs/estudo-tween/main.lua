local tween = require 'tween'

function criarTexto(_texto,_x,_y,_ty,_tempo,_efeito,r,g,b)
    local ob = { x=_x, y=_y, texto=_texto, r=r, g=g, b=b }
    local tw = tween.new(_tempo, ob, {y=_ty}, _efeito)
    local item = {
        objeto = ob,
        efeito = tw
    }
    data[#data+1] = item
 end
 
 function exemplo1()
    local x = 100;
    criarTexto("OLA", x+30*0, 0, 300, 4, 'outBounce',1,1,1)
    criarTexto("OLX", x+30*1, 0, 300, 4, 'inBounce',1,1,1)
    criarTexto("OLD", x+30*2, 0, 300, 4, 'inOutBounce',1,1,1)
    criarTexto("OLE", x+30*3, 0, 300, 4, 'outInBounce',1,1,1)
    
    criarTexto("ELY", x+30*4, 0, 300, 4, 'outElastic',1,1,1)
    criarTexto("ELU", x+30*5, 0, 300, 4, 'inElastic',1,1,1)
    criarTexto("ELP", x+30*6, 0, 300, 4, 'inOutElastic',1,1,1)
    criarTexto("ELL", x+30*7, 0, 300, 4, 'outInElastic',1,1,1)

    criarTexto("LIN", x+30*8, 0, 300, 4, 'linear',1,1,1)

    criarTexto("QUA", x+30*9, 0, 300, 4, 'inQuad',1,1,1)
    criarTexto("QUB", x+30*10, 0, 300, 4, 'outQuad',1,1,1)
    criarTexto("QUC", x+30*11, 0, 300, 4, 'inOutQuad',1,1,1)
    criarTexto("QUD", x+30*12, 0, 300, 4, 'outInQuad',1,1,1)

    criarTexto("BKA", x+30*13, 0, 550, 8, 'inQuad',1,1,1)
    criarTexto("BKB", x+30*14, 0, 550, 5, 'outQuad',1,1,1)
    criarTexto("BKC", x+30*15, 0, 550, 3, 'inOutQuad',1,1,1)
    criarTexto("BKD", x+30*16, 0, 550, 4, 'outInQuad',1,1,1)

    criarTexto("LO", x+16*17, 0, 500, 4, 'inQuad',1,0,1)
    criarTexto("UR", x+16*18, 0, 500, 9, 'linear',1,0,1)
    criarTexto("DE", x+16*19, 0, 500, 8, 'inOutCirc',1,0,1)
    criarTexto("ZE", x+16*20, 0, 500, 4, 'outInSine',1,0,1)
    criarTexto("LIA", x+16*21, 0, 500, 4, 'outInElastic',1,0,1)

    criarTexto("AMA", x+30*17, 0, 450, 5, 'inExpo',1,0,0)
    criarTexto("AMA", x+30*18, 0, 450, 5, 'outExpo',1,0,0)
    criarTexto("AMA", x+30*19, 0, 450, 5, 'inOutCirc',1,0,0)
    criarTexto("AMA", x+30*20, 0, 450, 5, 'outInCirc',1,0,0)

    criarTexto("PAULO", x+32*8, 0, 400, 7, 'inExpo',1,1,1)
    criarTexto("CESAR", x+32*12, 0, 400, 6, 'outSine',0,1,1)
    criarTexto("SILVA", x+32*16, 0, 400, 5, 'inOutBounce',1,0,1)
    criarTexto("JUNIOR", x+32*20, 0, 400, 2, 'outInQuart',1,1,0)

 end

 function love.load()
    data = {}
    exemplo1()
end


function love.update(dt)
    for k,v in ipairs(data) do 
        v.efeito:update(dt)
    end
end

function love.draw()
    for k,v in ipairs(data) do 
        love.graphics.setColor(v.objeto.r,v.objeto.g,v.objeto.b)
        love.graphics.print(v.objeto.texto, v.objeto.x, v.objeto.y)
    end
end

function love.keypressed(key)
  if key == 'escape' then 
     love.event.quit()
  end
end