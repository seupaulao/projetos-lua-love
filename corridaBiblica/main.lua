function love.load()
    require "base"
end

function love.draw()

end

function love.update(dt)

end

function love.keypressed(key)
    if key=='escape' then
        love.event.quit()
    end
end