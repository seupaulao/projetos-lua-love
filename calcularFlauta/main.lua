function love.load()
diametro_externo = 25
espessura_parede=4.5
tamanho_flauta=400
posicao_bocal_janela = diametro_externo * 2/3
janela = 10
corpo = tamanho_flauta - posicao_bocal_janela
print("Flauta Ocidental")
print("Tamanho Total Tubo:"..tamanho_flauta)
print("Posicao Bocal = "..posicao_bocal_janela)
print("Corpo = "..corpo)
--43% do corpo, partindo da janela
centro_buracos = {0.43 , 0.5 , 0.58 , 0.68 , 0.73 , 0.83 }
for i,v in ipairs(centro_buracos) do print("TAM="..tostring(v * corpo)..", "..tostring(v * 100).."%") end

--cano pvc agua quente (mm)
print()
diametro_interno = 16
diametro_externo = 25
espessura_parede = 4.5
tamanho_flauta=400
distancia_furos_do_bocal = {188,218,244,280,303,338}
bocal_base=9.8
bocal_altura=8.5
print("Flauta Quena")
print("Tamanho Total Tubo:"..tamanho_flauta)
print("base bocal:"..bocal_base)
print("altura bocal:"..bocal_altura)
for i,v in ipairs(distancia_furos_do_bocal) do print("TAM="..tostring(v)..", "..tostring(v/tamanho_flauta*100).."%") end
end

function love.keypressed(key)
    love.event.quit()
end