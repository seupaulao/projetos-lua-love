Enemy = Object:extend()

function Enemy:new()
    self.image = love.graphics.newImage("snake.png")
    self.x = 525
    self.y=650
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Enemy:update(dt)
    self.x = self.x + self.speed * dt
    local ww = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > ww then
        self.x = ww - self.width
        self.speed = -self.speed
    end
end

function Enemy:draw()
    love.graphics.draw(self.image,self.x, self.y)
end
