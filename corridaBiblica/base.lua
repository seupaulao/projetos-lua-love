function carregar()
    base = {}
    criarPergunta("O que Deus fez no sétimo dia?","Não fez nada","Criou o homem", "Abencoou e Santificou o sétimo dia, porque nesse dia Deus descansou de toda a Sua obra que havia feito","Gn 2:2-3")
    criarPergunta("Complete o verso : 'No princípio Deus...'", "criou a terra", "estava descansando", "criou os céus e a terra","Gn 1:1")
    criarPergunta("O que Deus criou no primeiro dia da Criação?", "Os peixes do mar", "O sol e as estrelas", "Luz","Gn 1:3-5")
    criarPergunta("Complete o Salmo: O _ é meu _ nada me _", "homem,amigo,incomodará", "Senhor,sustento,atrapalhará", "Senhor,pastor,faltará","Sl 23:1")
    criarPergunta("Qual mandamento proibe o uso de fazer e adorar esculturas?", "4o mandamento", "10o mandamento", "2o mandamento","Ex 20:3 a 5")
    criarPergunta("Qual personagem bíblico que tinha um sobrinho de nome Ló?", "Isaque", "Jacó", "Abraão","Gn 13")
    criarPergunta("Qual personagem bíblico transformou-se numa estátua de sal?", "Maria mãe de Jesus", "A mulher de Ló", "Sarah a esposa de Abraão","Gn 13")
    criarPergunta("Qual personagem bíblico rasgou um leão ao meio?", "Gideão", "Golias", "Sansão","Gn 13")
    criarPergunta("Qual personagem bíblico foi juíza no tempo dos Juízes de Israel?", "Nunca houve mulher juíza em Israel", "Raabe", "Débora","Gn 13")
    criarPergunta("Quantas pedras Davi tomou para si para ir batalhar com Golias?", "3 pedras", "5 pedras", "6 pedras","Gn 13")
    criarPergunta("Nome dos filhos de Noé?", "Ananias,Zacarias e Malaquias", "Senaqueribe,Beltsar e Josué", "Sem,Cão e Jafé","Gn 13")
    criarPergunta("Complete: O temor ao SENHOR é o princípio da _; e diante da honra vai a _", "fé,humildade", "honestidade,instrução", "sabedoria,simplicidade","Pv 1:6")
    
    criarPergunta("Qual discipulo de Jesus era cobrador de impostos?", "fé,humildade", "honestidade,instrução", "sabedoria,simplicidade","Pv 1:6")
    criarPergunta("Qual discipulo de Jesus andou com ele sobre as águas?", "fé,humildade", "honestidade,instrução", "sabedoria,simplicidade","Pv 1:6")
    criarPergunta("Qual foi o discipulo do amor?", "fé,humildade", "honestidade,instrução", "sabedoria,simplicidade","Pv 1:6")
    
end

function criarPergunta(pergunta, opcaoA, opcaoB, opcaoC, dica)
    local t = {}
    t.pergunta = pergunta
    t.opcaoA = opcaoA
    t.opcaoB = opcaoB
    t.opcaoC = opcaoC
    t.dica = dica
    base[#base+1] = t
end