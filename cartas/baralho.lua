Baralho = Object:extend()

function Baralho:new(_deque)
    self.baralho = _deque
    self.contador = 1
end

function Baralho:add()
    self.contador = self.contador + 1
    if self.contador > #self.baralho then 
        self.contador = 1
    end
end

function Baralho:rem()
    self.contador = self.contador - 1
    if self.contador < 1 then 
        self.contador = 1
    end
end

function Baralho:zerar()
    self.contador = 1
end

function Baralho:cont()
    return self.contador
end

function Baralho:qte()
    return #self.baralho
end

function Baralho:setCartas(_cartas)
    self.baralho = _cartas
end

function Baralho:getCartas()
    return self.baralho
end

function Baralho:getCarta()
    return self.baralho[self.contador]
end