function love.load()
   centrox = 100
   centroy = 100
   raio = 50
   gtabela = gerar(5)
end

function gerar(divisor)
   local tabela = {}
   xanterior = centrox + raio * math.cos(math.rad(0)) 
   yanterior = centroy + raio * math.sin(math.rad(0)) 
   for i=1,divisor do
        local temp = {}
        local x = centrox + raio * math.cos( math.rad (i * 360 / divisor) )
        local y = centroy + raio * math.sin( math.rad (i * 360 / divisor) )
        temp.x = x
        temp.y = y
        tabela[#tabela + 1] = temp
   end
   return tabela
end

function love.update(dt)

end

function love.draw()
   for i,v in ipairs(gtabela) do
       x = v.x
       y = v.y
       love.graphics.line(x,y,xanterior,yanterior)
       xanterior = x
       yanterior = y
   end    
end

function love.keypressed(key)
    if key=='escape' then
       love.event.quit()
    elseif key=='q' then    
       gtabela = gerar(5)
    elseif key=='w' then    
       gtabela = gerar(10)
    elseif key=='e' then    
       gtabela = gerar(50)
    end
end

       
