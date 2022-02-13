Parede = Entidade:extend()

function Parede:new(x,y)
    Parede.super.new(self,x,y,"wall.png")
    self.strength = 100
    self.peso = 0
end

function Parede:update(dt)
    Parede.super.update(self, dt)
end