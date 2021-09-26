function printCards(b)
    for index, card in ipairs(b) do 
        print(index.." --- "..card.suit.."   "..card.rank)
    end
 end
 
 function criarDeque()
   local baralho = {}
   for naipeIndex, naipe in ipairs({'club','spade','heart','diamond'}) do
     for rank=1,13 do
        table.insert(baralho, {suit=naipe, rank=rank})
     end
   end
   return baralho
 end
 
 function embaralhar(cartas)
     local n = #cartas
     for i=n,1,-1 do
        local j = math.floor(love.math.random(i + 1))
        local tmp = cartas[i]
        cartas[i] = cartas[j]
        cartas[j] = tmp 
     end
     return cartas
 end