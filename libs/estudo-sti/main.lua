local sti = require "sti"

--próximos passos
--tratando colisões
  -- 1. itens
  -- 2. final da tela
  -- 3. lugares instransponiveis
  -- 4. usar o plugin bump
  -- 5. usar o plugin box2d

function love.load()
    map = sti("mapa.lua")

	--adiciona uma camada customizada e coloca um número de index maior que as existentes
    map:addCustomLayer("Sprites", 4)

	--recupera os dados do objeto player da camada de objetos/entidades
    local dadosPlayer 
	for k, object in pairs(map.objects) do
		if object.name == "player" then
			dadosPlayer = object
			break
		end
	end

	--pega a nova camada, e posiciona a imagem do player no local designado no tiled
	local layer = map.layers["Sprites"]
	layer.sprites = {
		player = {
			image = love.graphics.newImage("brother.png"),
			x      = dadosPlayer.x,
			y      = dadosPlayer.y,
			r      = 0
		}
	}

	--atualiza a camada nova = do player e recebe a entrada de dados
	function layer:update(dt)
		local speed = 96 * dt

		-- Move player up
		if love.keyboard.isDown("w", "up") then
			self.sprites.player.y = self.sprites.player.y - speed
		end

		-- Move player down
		if love.keyboard.isDown("s", "down") then
			self.sprites.player.y = self.sprites.player.y + speed
		end

		-- Move player left
		if love.keyboard.isDown("a", "left") then
			self.sprites.player.x = self.sprites.player.x - speed
		end

		-- Move player right
		if love.keyboard.isDown("d", "right") then
			self.sprites.player.x = self.sprites.player.x + speed
		end
	end

	-- Draw player
    function layer:draw()
			for _, sprite in pairs(self.sprites) do
				local x = math.floor(sprite.x)
				local y = math.floor(sprite.y)
				local r = sprite.r
				love.graphics.draw(sprite.image, x, y, r)
			end
	end


	-- Remove unneeded object layer
	map:removeLayer("objetos")
end

function love.update(dt)
    map:update(dt)
end

function love.draw()
    map:draw()
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end
end