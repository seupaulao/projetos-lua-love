function love.load()
    glossario = {}	
    manobra={}
    infracoes={}

    adicionar('medida_longitudinal' , {'comprimento'})
    adicionar('medida_transversal' , {'boca'})
    adicionar('quem_esta_parte_frente' , {'a vante'})
    adicionar('quem_esta_parte_tras' , {'a reh'})
    adicionar('lado_direito',{'boreste'})
    adicionar('lado_esquerdo',{'bombordo'})
    adicionar('parte_frente',{'proa'})
    adicionar('parte_tras',{'popa'})
    adicionar('parte_casco_divide_frente_tras',{'meia-nau'})
    adicionar('revestimento_forro_exterior_envolve_toda_embarcacao',{'costado'})
    adicionar('partes-curvada-costado-proximas-a-proa',{'bochechas'})
    adicionar('parte-curvada-costado-proa-a-direita',{'bochecha boreste'})
    adicionar('parte-curvada-costado-proa-a-esquerda',{'bochecha bombordo'})
    adicionar('parte-curvada-costado-prox-popa',{'alheta'})
    adicionar('parte-curvada-costado-popa-direita',{'alheta de boreste'})
    adicionar('parte-curvada-costado-popa-esquerda',{'alheta de bombordo'})
    adicionar({'intersecao-superficie-agua-costado','faixa-pintada-casco-entre-calado-maximo-leve'},{'linha d\'agua'})
    adicionar('calado-maximo',{'plena carga'})
    adicionar('calado-leve',{'embarcacao vazia'})
    adicionar('fundo-embaracacao',{'quilha'})
    adicionar('altura-quilha-ate-linha-dagua-quando-embarcacao-flutuando',{'calado'})
    adicionar('linha-flutuacao',{'superficie da agua'})
    adicionar('distancia-vertical-entre-linha-flutuacao-e-conves-principal',{'borda livre'})
    adicionar('medida-vertical-entre-conves-principal-e-quilha',{'pontal','pontal moldado'})
    adicionar('parte-casco-mergulhado-agua',{'obras vivas','carena'})
    adicionar('parte-casco-acima-linha-dagua',{'obras mortas'})
    adicionar('capacidade que uma embarcacao tem de voltar ao equibilibrio logo apos um caturro ou balanco motivado por forcas',{'estabilidade'})
    adicionar('forcas externas que afetam o equibilibrio',{'efeito das ondas','estado do mar conjugado com a velocidade da embarcacao','arrumação dos pessos a bordo','embarque e desembarque de cargas'})
    adicionar('é o movimento de oscilação vertical de uma embarcacao no sentido longitudinal (proa-popa)',{'caturro','arfagem'})
    adicionar('eh o movimento de oscilacao vertical de uma embarcacao de um bordo para outro (BE-BB)',{'balanco'})
    adicionar('a diferenca entre os calados a vante e a re de uma embarcacao(calados de proa e de popa)',{'trim'})
    adicionar('quando o calado de uma embarcacao a vante é igual ao calado de re',{'embarcacao trimada','trim correto','sem compasso','aguas parelhas'})
    adicionar('quando o calado a re eh maior que o a vante',{'derrabada'})
    adicionar('quando o calado a vante eh maior que o a re',{'embicada'})
    adicionar('quando os principais problemas de uma embarcacao estao ligados ao ritmo do caturro e a modificacao do trim',{'estabilidade longitudinal'})
    adicionar('quando os principais problemas de uma embarcacao estao ligados a seguranca da embarcacao e a correta distribuicao de pesos',{'estabilidade transversal'})
    adicionar('balanco rapido',{'boa estabilidade'})
    adicionar('balanco mento',{'estabilidade deficiente'})
    adicionar('maior concentracao de pesos nas extremidades (popa-proa) provocando curvatura longitudinal com convexidade para cima',{'alquebramento'})
    adicionar('maior concentracao de pesos no centro da embarcacao (meia-nau) e pouco nas extremidades, curvatura longitunal com convexidade para baixo',{'contra-alquebramento'})
    adicionar('quando a embarcacao pende para um dos lados devido a movimentacao dos pesos ou por embarque e desenbarque de carga',{'banda'})
    adicionar('quando a embarcacao nao esta inclinada transversalmente',{'adricada'})
    adicionar('',{'centro de gravidade'})
    adicionar('',{'deslocamente'})
    adicionar('',{'empuxo'})
    adicionar('',{'centro de carena'})
    adicionar('',{'braco de endireitamento'})
    adicionar('',{'metacentro'})
    adicionar('',{'efeito de pesos altos'})
    adicionar('',{'efeito de superficie livre'})
    adicionar('',{'leme'})
    adicionar('',{'madre'})
    adicionar('',{'cabeça'})
    adicionar('',{'cana do leme'})
    adicionar('',{'timão','roda do leme'})
    adicionar('',{'porta'})
    adicionar('',{'governaduras'})
    adicionar('',{'eixo propulsor'})
    adicionar('',{'bucha telescopica'})
    adicionar('',{'cadaste'})
    adicionar('',{'efeito maximo do leme'})
    adicionar('',{'atacar'})
    adicionar('',{'amarra'})
    adicionar('',{'desatracar'})
    adicionar('',{'atracar a contrabordo de outra embarcacao'})
    adicionar('',{'pegar a boia','amarrar'})
    adicionar('',{'desamarrar','largar'})
    adicionar('',{'fundear','ancorar'})
    adicionar('',{'suspender'})
    adicionar('',{'quartéis'})
    adicionar('',{'quartelada'})
    adicionar('usados nas manobras de atracar',{'cabos de grande bitola'})
    adicionar('',{'espias'})
    adicionar('',{'cabeços','argolas'})
    adicionar('',{'espias'})
    adicionar('',{'lancante de proa'})
    adicionar('',{'espringue de proa'})
    adicionar('',{'traves'})
    adicionar('',{'espringue de popa'})
    adicionar('',{'lancante de popa'})
    adicionar('',{'seguimento'})
    adicionar('a melhor hora para atracar é quando',{'a maré está parada'})
    adicionar('atracação com vento ou corrente perpendiculares ao cais',{'atracação mais perigosa'})
    --atracar
    adicionar('',{'aproximação do barlavento'})
    adicionar('',{'aproximação por sotavento'})
    adicionar('',{'fundeadouro'})
    adicionar('',{'ferro'})
    adicionar('',{'boia de arinque'})
    adicionar('',{'filame'})
    adicionar('',{'ancora ancorote'})
    adicionar('',{'ancora tipo almirantado'})
    adicionar('',{'ancora tipo patente'})
    adicionar('',{'ancora danforth'})
    adicionar('',{'ancora bruce'})
    adicionar('',{'ancora arado'})
    adicionar('',{'ancora garatéia'})
    adicionar('',{'ancora fateixa dobravel'})
    adicionar('',{'ancora flutuante'})
    adicionar('',{'tença'})
    adicionar('',{'aa matroca'})
    adicionar('',{'carena'})
    adicionar('',{'correr com o tempo'})
    adicionar('',{'curva de giro padrao'})
    adicionar('',{'garrando'})
    adicionar('',{'unhando'})
    adicionar('',{'por a embarcacao aa capa'})
    adicionar('',{'vento nordeste'})
    adicionar('',{'nó veia volta'})
    adicionar('',{'nó de azelha'})
    adicionar('',{'nó direito'})
    adicionar('',{'nó torto'})
    adicionar('',{'nó de escota'})
    adicionar('',{'nó lais de guia'})
    adicionar('',{'nó de catau'})
    adicionar('',{'nó de pescador'})
    adicionar('',{'nó volta falida'})
    adicionar('',{'nó volta da ribeira'})
    adicionar('',{'nó volta do fiel'})
    adicionar('',{'nó oito'})
    adicionar('',{'nó volta de cunho'})
    adicionar('',{'nó volta redonda com dois cotes'})
    adicionar('',{''})
    adicionar('',{''})
    

    --sem seguimento [seguimento == false] = partindo do repouso
    addmanobra('meio','AV',false,'BB lentamente','Grande','AV')
    addmanobra('BB','AV',false,'BB rapidamente','Grande','AV')
    addmanobra('BE','AV',false,'BE lentamente','Grande','AV')
    addmanobra('meio','AV',true,'BE lentamente','Grande','AV')
    addmanobra('BB','AV',true,'BB','Grande','AV')
    addmanobra('BE','AV',true,'BE','Grande','AV')
    addmanobra('meio','AR',false,'BE lentamente','Muito pequena','AR')
    addmanobra('BB','AR',false,'BE muito lentamente','Muito pequena','AR')
    addmanobra('BE','AR',false,'BE lentamente','Muito Pequena','AR')
    addmanobra('meio','AR',true,'BE lentamente','Pouco maior sem maquina','AR')
    addmanobra('BB','AR',true,'BE rapidamente','Pouco maior sem maquina','AR')
    addmanobra('BE','AR',true,'BE lentamente','Pouco maior sem maquina','AR')
    addmanobra('meio', 'AR', true,'BE lentamente','Pequeno','AV')
    addmanobra('BB', 'AR', true,'Inialmente BB seguido de BE rapidamente','Pequeno','AV')
    addmanobra('BE', 'AR', true,'BE','Pequeno','AV')
    addmanobra('meio', 'AV', true,'BB ou BE','Medio','AR')
    addmanobra('BB', 'AV', true,'BE lentamente','Medio','AR')
    addmanobra('BE', 'AV', true,'BE lentamente','Medio','AR')

    addinfracao('A','Portar habilitacao desatualizada','ate 30 dias', 40, 200)
    addinfracao('A','Deixar de efetuar outras marcacoes previstas (refere-se aa identificacao visual da embarcacao)','ate 30 dias', 'de 40 a 200 reais')
    addinfracao('B','Não portar a documentação relativa à habilitação','ate 60 dias',40,400)
    addinfracao('B','Luzes de navegação em desacordo com as normas','ate 60 dias',40,400)
    addinfracao('B','Equipamento de navegação defeituoso ou inoperante','ate 30 dias',40,400)
    addinfracao('C','Apresentar-se com a dotação incompleta.','ate 30 dias', 40, 800)
    addinfracao('C','Apresentar-se com item ou equipamento da dotação inoperante, em mau estado ou vencido.','ate 30 dias', 40, 800)
    addinfracao('C','Não portar o documento de inscrição ou registro da embarcação.','ate 30 dias', 40, 800)
    addinfracao('C','Deixar de marcar no casco o nome da embarcação e o porto de inscrição (Para outras marcações, ver Grupo A).','ate 30 dias', 40, 800)
    addinfracao('C','Não portar os certificados ou documentos equivalentes exigidos.','ate 30 dias', 40, 800)
    addinfracao('C','Certificados ou documentos equivalentes com prazo de validade vencido.','ate 30 dias', 40, 800)
    addinfracao('C','Navegar sem as luzes de navegação','***', 40, 800)
    addinfracao('C','Apresentar-se com falta de equipamento de navegação exigido.','ate 60 dias', 40, 800)
    addinfracao('C','Equipamentos de comunicações inoperantes ou funcionando precariamente.','ate 30 dias', 40, 800)
    addinfracao('C','Equipamentos de combate e de proteção contra incêndios inoperantes ou funcionando precariamente.','ate 60 dias', 40, 800)
    addinfracao('C','Velocidade superior à permitida.','ate 30 dias', 40, 800)
    addinfracao('D','Não possuir a documentação relativa à habilitação.','***', 40, 1600)
    addinfracao('D','Apresentar-se sem a dotação regulamentar de itens e equipamentos de bordo.','ate 60 dias', 40, 1600)
    addinfracao('D','Deixar de inscrever ou de registrar a embarcação.','***', 40, 1600)
    addinfracao('D','Não possuir qualquer certificado ou documento equivalente, pertinentes à embarcação.','ate 60 dias', 40, 1600)
    addinfracao('D','Trafegar em área reservada a banhistas ou exclusiva para determinado tipo de embarcação.','ate 60 dias', 40, 1600)
    addinfracao('D','Descumprir regra do RIPEAM.','ate 60 dias', 40, 1600)
    addinfracao('D','Causar danos a sinais náuticos','ate 60 dias', 40, 1600)
    addinfracao('D','Descumprir as regras regionais sobre tráfego, estabelecidas pelo representante local da autoridade marítima.','ate 60 dias', 40, 1600)
    addinfracao('E','Conduzir embarcação sem habilitação.','***', 40, 2200)
    addinfracao('E','Efetuar alterações ou modificações nas características da embarcação em desacordo com as normas.','***', 40, 2200)
    addinfracao('E','Descumprir qualquer outra regra referente às normas de transporte previstas.','ate 30 dias', 40, 2200)
    addinfracao('F','Transportar carga perigosa ou carga no convés em desacordo com as normas.','ate 30 dias', 80, 2800)
    addinfracao('G','Transportar excesso de carga ou passageiros, ou exceder lotação autorizada.','ate 60 dias', 80, 3200)
    addinfracao('G','Conduzir embarcação em estado de embriaguez ou após uso de substância entorpecente ou tóxica, quando não constituir crime previsto em lei. A reincidência sujeitará o infrator à pena de cancelamento.','ate 120 dias', -1, -1)

end

function addinfracao(grupo, descricao, suspensao, multamin,multamax)
   local t={}
   t.grupo=grupo
   t.descricao=descricao
   t.suspensao=suspensao
   t.multamin=multamin
   t.multamax=multamax
   infracoes[#infracoes+1]=t
end

function addmanobra(leme, helice, seguimento, proa, acaoleme, direcaoseguimento)
   local t={}
   t.leme=leme
   t.helice=helice
   t.embarcacao=direcaoseguimento
   t.seguimento=seguimento
   t.proa=proa
   t.acao=acaoleme
   manobra[#manobra+1]=t
end

function adicionar(descricao, valor)
  local t = {}
  t.descricao = descricao
  t.valor = valor
  glossario[#glossario+1]=t
end

function love.update(dt)

end

function love.keypressed(key)
	if key=='ESCAPE' then
		love.event.quit()
	end
end

function love.draw()

end
