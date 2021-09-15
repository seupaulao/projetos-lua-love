function love.load()
  deque = {}
  for naipeIndex, naipe in ipairs({'paus','espadas','copas'.'ouro'}) do
      for rank=1,13 do
         table.insert(deque, {naipe=naipe, numero=rank})
	 print("naipe: "..naipe.."   numero: "..rank)
      end
  end
  print("total de cartas:"..#deque)
end

function love.update(dt)

end

function love.draw()

end
