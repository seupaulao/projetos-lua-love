function love.load()
   centrox = 250
   centroy = 250
   raio = 150
   tracos = 75
   divisor_vel = 3   -- 3, 15, 25
   velocidade = tracos / divisor_vel
   gtabela = gerar(tracos)
   padrao = 1
end

function gerar(d)
   x0 = centrox + raio * math.cos(math.rad(0)) 
   y0 = centroy + raio * math.sin(math.rad(0))
   local tabela = {}
   for i=1,d do
        local temp = {}
        local x1 = centrox + raio * math.cos(math.rad(i * 360/d)) 
        local y1 = centroy + raio * math.sin(math.rad(i * 360/d))
        local x2 = centrox + raio * math.cos(math.rad(180 + velocidade * i * 360/d)) 
        local y2 = centroy + raio * math.sin(math.rad(180 + velocidade * i * 360/d))   
        temp.x1 = x1
        temp.y1 = y1
        temp.x2 = x2
        temp.y2 = y2
        tabela[#tabela + 1] = temp
   end
   return tabela
end

function love.update(dt)
   tracos = tracos + 1/dt
   gtabela = gerar(tracos)
   if tracos > 360 then
   	tracos = 30
   end
   love.timer.sleep(0.25)
end

function love.draw()
   love.graphics.setColor(1,1,1)
   love.graphics.print('Divisor de velocidade = '..tostring(divisor_vel),50,50)
   love.graphics.setColor(0,0,1)
   for i,v in ipairs(gtabela) do
       if padrao == 1 then
	  love.graphics.line(v.x1,v.y1,v.x2,v.y2)
          love.graphics.setColor(1,0,0)
          love.graphics.points(v.x1,v.y1)
          love.graphics.setColor(0,0,1)
          love.graphics.points(v.x2,v.y2)
       elseif padrao == 2 then
	  love.graphics.line(v.x1,v.y2,v.x2,v.y1)
          love.graphics.setColor(1,0,0)
          love.graphics.points(v.x1,v.y2)
          love.graphics.setColor(0,0,1)
          love.graphics.points(v.x2,v.y1)
       elseif padrao == 3 then
	  love.graphics.line(v.x1,v.x2,v.y1,v.y2)
          love.graphics.setColor(1,0,0)
          love.graphics.points(v.x1,v.x2)
          love.graphics.setColor(0,0,1)
          love.graphics.points(v.y1,v.y2)
       end	       
   end
end

function love.keypressed(key)
    tracos = 75
    if key=='escape' then
       love.event.quit()
    elseif key=='q' then
       divisor_vel = 3.0
    elseif key=='w' then
       divisor_vel = 15.0
    elseif key=='e' then
       divisor_vel = 25.0
    elseif key=='a' then
       padrao = 1
    elseif key=='s' then
       padrao = 2
    elseif key=='d' then
       padrao = 3
    end
    velocidade = tracos / divisor_vel
    gtabela = gerar(tracos)
end

       
