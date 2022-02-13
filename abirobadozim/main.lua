function love.load()
    Object = require "classic"

    require "Entidade"
    require "Player"
    require "Parede"
    require "Caixa"
    require "Mapas"

    player = Player(100,100)
    box = Caixa(400, 150)

    objects = {}
    table.insert(objects, player)
    table.insert(objects, box)

    walls = {}

    -- usar camadas
    --  -- camada wall, onde o player esbarra
    --  -- camada background, o plano de fundo ou cor aplicada e movimentada se for parallax
    --  -- camada objetos, o que o player coleta [mesma camada do player]
    --  -- inimigos, nao precisa ser uma camada, pode ser colocado no mapa
    --               grupos de inimigos diferentes = comportamento diferente dos inimigos
    --  --  -- camada ornamento 1, o player passa por cima desse ornamento [mesma camada do player]
    --  -- camada ornamento 2, o player passa por baixo desse ornamento
  

    for i,linha in ipairs(mapas[1]) do
        for j,w in ipairs(linha) do 
            if w==1 then
                table.insert(walls, Parede((j-1)*50, (i-1)*50))
            end
        end
    end
end

function love.update(dt)
    for i,v in ipairs(objects) do
            v:update(dt)
    end

    for i,w in ipairs(walls) do
        w:update(dt)
    end


    local loop = true
    local limit = 0

    while loop do
        loop = false

        limit = limit + 1
        if limit > 100 then
            break
        end

        for i=1,#objects-1 do
            for j=i+1,#objects do
                local collision = objects[i]:resolveCollision(objects[j])
                if collision then
                    loop = true
                end
            end
        end

        for i,wall in ipairs(walls) do
            for j,object in ipairs(objects) do
                local colisao = object:resolveCollision(wall)
                if colisao then
                    loop =true
                end
            end
        end

    end
end

function love.keypressed(key)
    if key=="escape" then
        love.event.quit()
    elseif key=="up" then
        player:jump()    
    end
end

function love.draw() 
    for i,v in ipairs(objects) do
        v:draw()
    end
    for i,v in ipairs(walls) do
        v:draw()
    end

end