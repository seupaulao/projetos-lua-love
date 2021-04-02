function love.load()
   h = love.graphics.getHeight()
   w = love.graphics.getWidth()
   t = {}
   vermelhos = 0
   verdes = 0
   azuis = 0
   gerar()
end

function love.update(dt)
end

function love.draw()
  for k,v in ipairs(t) do
    love.graphics.setColor(v.r,v.g,v.b)
    love.graphics.rectangle("fill",v.x, v.y, v.w, v.h)
  end
end

function gerar()
  t = {}
  for i=1,w/5 do
    for j=1,h/5 do 
       local chance = math.random()
       local temp = {}
       if (chance < 0.2) then
          temp.r = 1
          temp.g = 0
          temp.b = 0
          vermelhos = vermelhos + 1
       else
          if chance < 0.5 then
		  temp.r = 0
		  temp.g = 1
		  temp.b = 0
		  verdes = verdes + 1          
	  else
		  temp.r = 0
		  temp.g = 0
		  temp.b = 1
		  azuis = azuis + 1          	  	  
          end
       end
       temp.x = i*5
       temp.y = j*5
       temp.w = 5
       temp.h = 5
       t[#t+1] = temp
    end   
  end 
  print(vermelhos,verdes,azuis)
end

function love.keypressed(key)
 if key=='escape' then
    love.event.quit()
 else
    gerar()
 end
end
