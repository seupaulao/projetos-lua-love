Wall = Entidade:extend()

function Wall:new(x,y)
    Wall.super.new(self,x,y,"wall.png")
    self.strength = 100
    self.peso = 0
end

function Wall:update(dt)
    Wall.super.update(self, dt)
end