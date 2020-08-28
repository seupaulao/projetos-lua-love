Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("panda.png")
    self.x=300
    self.y=20
    self.speed=500
    self.width=self.image:getWidth()
    self.height=self.image:getHeight()
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then    
        self.x = self.x + self.speed * dt        
    end

    local ww = love.graphics.getWidth()
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > ww then 
        self.x = ww - self.width
    end


end

function Player:draw()
    love.graphics.draw(self.image,self.x,self.y)
end

function Player:keyPressed(key)
    if key == "space" then
        --Put a new instance of Bullet inside listOfBullets.
        table.insert(listOfBullets, Bullet(self.x+self.width/2, self.y+self.height))
    end
end


