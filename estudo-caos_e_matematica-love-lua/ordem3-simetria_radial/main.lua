function love.load()
   centrox = 100
   centroy = 100
   di = 6
   re = 100
   ri = re/10
   incremento = 0
   gtabela = gerar(di)
   p = 1
end
-- ideia : gerar figuras radiais com vertices aleatorios
-- ideia : gerar figuras radiais com vertices sob ruido
function gerar(divisor)
   local tabela = {}
   for i=1,divisor do
        local r = 0
        if i%2 == 0 then
           --r = love.math.random(1, re)
           r = re
        else
           --r = love.math.random(1, ri)
           r = ri
        end
        local temp = {}
        local x = love.graphics.getWidth()/2 + r * math.cos(incremento + math.rad( i*360/divisor + (i%2)*love.timer.getFPS()))
        local y = love.graphics.getHeight()/2 + r * math.sin(incremento + math.rad( i*360/divisor + (i%2)*love.timer.getFPS()))
        temp.x = x
        temp.y = y
        tabela[#tabela + 1] = temp
   end
   return tabela
end

function love.update(dt)
	incremento = incremento  + 0.02 * 1/dt
	di = di + 2 * p
	gtabela = gerar(di)
	love.timer.sleep(0.1)
	if di > 60 or di < 6 then
	   p = p * -1
	end   
end

function love.draw()
   love.graphics.print("Vertices:"..tostring(di),60,60)
   for i=2,#gtabela do
       if i%2==0 then
          love.graphics.setColor(0,1,0)
       else   
          love.graphics.setColor(1,0,0)
       end   
       love.graphics.line(gtabela[i-1].x,gtabela[i-1].y,gtabela[i].x,gtabela[i].y)
   end    
   love.graphics.line(gtabela[1].x,gtabela[1].y,gtabela[#gtabela].x,gtabela[#gtabela].y)
end

function love.keypressed(key)
    if key=='escape' then
       love.event.quit()
    elseif key == 'a' then
       ri = ri - 2   
    elseif key == 's' then
       ri = ri + 2   
    end
    gtabela = gerar(di)
end

       
