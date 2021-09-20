
function love.load()
    require "gerador"

end

function love.draw()

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end