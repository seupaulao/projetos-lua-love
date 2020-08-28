Wall = Entidade:extend()

function Wall:new(x,y)
    Wall.super.new(self,x,y,"wall.png")
    self.strength = 100
end

function Wall:update(dt)
    Wall.super.update(self, dt)
end