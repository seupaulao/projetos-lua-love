function love.load()
   centrox = 100
   centroy = 100
   r = 0
   p = 5
   v = 15
   w = love.graphics.getWidth()
   h = love.graphics.getHeight()
   gtabela = gerar(r,p,v)
end

function gerar(raio,passos,voltas)
   local numRep = 360 * (voltas / passos)
   local x = w/2
   local y = w/2
   local xa = w/2
   local ya = h/2
   local retorno = {}
   for i=1,numRep do
       t = love.math.noise(i/30) * 1.5
       -- t = math.random(0.9,1.1)
       x = w/2 + t * r * math.cos( math.rad(i * passos) )
       y = h/2 + t * r * math.sin( math.rad(i * passos) )
       temp = {}
       temp.xa=xa
       temp.ya=ya
       temp.x=x
       temp.y=y
       retorno[#retorno+1]=temp
       xa = x
       ya = y
       r = r + 0.1
   end   
   return retorno
end

function love.update(dt)

end

function love.draw()
   love.graphics.setColor(1,1,1)
   love.graphics.print('Quantidade:'..tostring(#gtabela),100,50)
   for i=1,#gtabela do
       love.graphics.setColor(i/#gtabela,0.2,i*5/#gtabela)
       love.graphics.line(gtabela[i].xa,gtabela[i].ya,gtabela[i].x,gtabela[i].y)
   end    

end

function love.keypressed(key)
    if key=='escape' then
       love.event.quit()
    end   
    gtabela = gerar(r,p,v)
end

       
