Object = require "classic"

Verde = Object:extend()

function Verde:new(X)
    self.chave = X
end

function Verde:getChave()
    return self.chave
end

function Verde:testar()
    for i=1,self:getChave() do
        print(i,"chato")
    end    
end

local p1 = Verde(10)
p1:testar()