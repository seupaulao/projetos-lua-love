Bloco = Entidade:extend()

function Bloco:new(x, y)
    Bloco.super.new(self, x, y, "box.png")
end