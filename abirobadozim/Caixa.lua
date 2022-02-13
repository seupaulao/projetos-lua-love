Caixa = Entidade:extend()

function Caixa:new(x, y)
    Caixa.super.new(self, x, y, "box.png")
end