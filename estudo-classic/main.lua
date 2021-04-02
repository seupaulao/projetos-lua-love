Object = require "classic"

--criando a classe e inicializando
Fruta = Object:extend()

function Fruta:new(_docura)
    self.docura = _docura or 0
end

--heranca
Limao = Fruta:extend()
function Limao:new()
    Limao.super.new(self, 1)
end
function Limao:__tostring()
    return 'AZEDO!!!!!   Docura='..tostring(self.docura)
end

--mixing, implementando uma interface
Salada = Object:extend()

function Salada:imprimir()
    for k,v in pairs(self) do 
        print(k,v)
    end
end

Fruta:implement(Salada)

--metodos 
function Fruta:isDoce()
    return self.docura > 5
end

function Fruta:getScale()
    return self.docura * 2
end

function Fruta:__tostring()
    return 'DOCURA!!!!!'..tostring(self.docura)
end

function love.load()
   local p1 = Fruta(1)
   local p2 = Fruta(7)
   print(p1:isDoce())
   print(p2:isDoce())
   local p3 = Limao()
   print("Classe LIMAO:",p3.docura, p3:isDoce())
   print(p3:is(Limao), p3:is(Fruta), p3:is(Object)) 
   print(p2:is(Limao), p2:is(Fruta), p2:is(Object)) 
   local p = Fruta(77)
   p:imprimir()
   print(p3:getScale())
   print(p3)
end

function love.keypressed(key) 
    if key == 'escape' then 
        love.event.quit()
    end
end

function love.update(deltatime)

end

function love.draw()

end