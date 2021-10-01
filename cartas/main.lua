

function love.load()
  Object = require "classic"

  require "baralho"
  require "funcoes"
  require "telas"

  images = {}
  for nameIndex, name in ipairs({
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
      'pip_heart', 'pip_diamond', 'pip_club', 'pip_spade',
      'mini_heart', 'mini_diamond', 'mini_club', 'mini_spade',
      'card', 'card_face_down',
      'face_jack', 'face_queen', 'face_king',
  }) do
      images[name] = love.graphics.newImage('images/'..name..'.png')
  end

  baralhos = {}

  gui = {}
  table.insert(gui, love.graphics.newImage('gui/'..'seta-direita-verde.png'))

  table.insert(baralhos, Baralho(criarDeque()))
  --deque = criarDeque()
  --deque = embaralhar(deque)

  indice = 1
  numDeques = 1
  baralhos[indice]:setCartas(embaralhar(baralhos[indice]:getCartas()))
  telaAtual = 1
  --print(baralhos[indice]:qte())
  --print(baralhos[indice]:cont())
  --printCards(baralhos[indice]:getCartas())
end



function love.keypressed(key)
  if key=='escape' then
    love.event.quit()
  elseif key=='n' then
    baralhos[indice]:add() 
  elseif key=='p' then
    baralhos[indice]:rem()
  elseif key == 'e' then
    baralhos[indice]:setCartas(embaralhar(baralhos[indice]:getCartas()))
    baralhos[indice]:zerar()
  elseif key == 't' then
    telaAtual = telaAtual + 1
    if telaAtual > 8 then 
      telaAtual = 1
    end  
  end
end


function love.draw()
  if telaAtual == 1 then 
    telaAbertura()
  elseif telaAtual == 2 then   
    telaDefinirQuantidadeDeques()
  elseif telaAtual == 3 then   
    telaVisualizarDeques()
  elseif telaAtual == 4 then   
    telaModoJogo()
  elseif telaAtual == 5 then   
    telaPontuacao()
  elseif telaAtual == 6 then   
    telaAjuda()
  elseif telaAtual == 7 then   
    telaRemoveAds()
  elseif telaAtual == 8 then   
    telaDoacao()
  end 

end
