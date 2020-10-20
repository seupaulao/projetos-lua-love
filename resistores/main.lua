function love.load()
   require "funcoes"
   loadResources()
   suit = require 'suit'
   numeroFaixas = 4
   contaFaixa = 1
   texto = "220".." Ohms"
   mostrarBotoes = false
end

function love.update(dt)
   -- Put a button on the screen. If hit, show a message.
   local px = 10
   if suit.Button("4 Faixas", px,300, 100,30,{id=1}).hit then
      numeroFaixas = 4
      contaFaixa = 1
      texto = ""
      mostrarBotoes = true
   end

   if suit.Button("5 Faixas", px+120,300, 100,30,{id=2}).hit then
      numeroFaixas = 5
      contaFaixa = 1
      texto = ""
      mostrarBotoes = true
   end

   if mostrarBotoes then
      local m = 1
      local py = 50 
      px = 280
      for i,v in ipairs(faixas) do
         if suit.Button(v.nomecor, px+120*m,py, 100,30).hit then
            analisarFaixa(v.nomecor)
         end
         if py > 200 then
            m = m + 1
            py = 50    
         end
         py = py + 50
      end
   end
   px=10
   suit.Label(texto, px+420,300, 200,30)
end



function love.draw()
   printLegenda()
   suit.draw()
end

function love.keypressed(key,unicode)
   if key=='escape' then
      love.event.quit()
   end
end
function love.mousepressed(x, y, button)

end

function love.mousereleased(x, y, button)


end

function love.keyreleased(key)


end