# The script of the game goes in this file.

# Declare characters used by this game. The color argument colorizes the
# name of the character.

define e = Character("Estudante", color="#30300a")
define p = Character("Professor", color="#0003AD")
define s = Character("Salmista",  color="#00AC00")
define sv = Character("Salmista",  color="#00AC00", kind=nvl)


# The game starts here.

label start:

    show sylvie green normal

    # These display lines of dialogue.

    e "Você é novo aqui."

    e "Estamos numa aula de salmos, cujo objetivo é memorizar a maior quantidade de salmos possíves."

    e "E entendermos o significado de Meditar na voz do SENHOR."

menu:
    "Quer iniciar a aula?"
    
    "Sim, com certeza!":
        jump iniciar_aula

    "Não, passo.":
        jump final_triste 

label iniciar_aula:
    show sylvie green smile
    e "Então vamos começar! Inicialmente com o básico:"
    hide sylvie green smile
    p "Os Salmos são {i}canções{/i} e poemas de {b}louvor{/b} a Deus"
    p "A partir do surgimento da imprensa, a bíblia foi dividida em capítulos e versículos."
    p "Vamos para nossa primeira aula e também o primeiro salmo de estudo!"
    jump aula_01

label aula_01:
    p "Para começar nada melhor que o Salmo capítulo 01"
    call salmo01()
    p "Estudamos o capítulo 01 do livro de Salmos, e vimos que é composto por 6 versículos."
    menu:
       "Professor, você poderia detalhar esse capítulo melhor para nossa assimilação?": 
          jump explicacao_aula_01
       "Professor, vamos para próxima aula?":
          jump aula_02
label explicacao_aula_01:
    p "Esse salmo é uma bênção incrível, não?"
    p "No versículo 1 é revelado que tipo de homem é Abençoado ou Bem-aventurado pelo Senhor."
    p "Ele precisa saír do conselho dos homens maus, ou seja, dos ímpios."
    p "É necessário que ele não ande nos caminhos dos pecadores, ou seja, aqueles que buscam a fazer coisas erradas o tempo todo."
    p "E também que não se assente a cadeira ou dentro da roda dos escarnecedores, ou seja aquels que falam mal dos outros pelas costas."
    p "Segundo o verso 2, vemos que esse homem é abençoado por Deus, não apenas por desviar do mau, mas por ter prazer, se deleitar na lei do SENHOR e meditar, refletir dia e noite nessa lei."
    p "As bênçãos que vemos no verso 3 são diversas, e dentre elas: fertilidade, e prosperidade."
    p "No verso 4 é mostrado como são os maus para Deus. E o verso 5 finaliza o pensamento mostrando que esses no dia do juízo não estarão de pé entre os justos."
    p "Porque o Deus Altíssimo conhece o caminho dos justos e ímpios, e ambos terão recompensa. Sendo que os maus, a recompensa é a perdição e destruição."
    jump pergunta_explicacao_aula_01

label pergunta_explicacao_aula_01:
    menu:
       "Você entendeu todas as verdades explicadas nesse capítulo?"
       "Sim, entendi tudo! Podemos prosseguir":
           jump aula_02
       "Sim. Entendi, mas quero ver o salmo novamente":
           call salmo01()
           jump pergunta_explicacao_aula_01
       "Não. Por favor repita a explicacao novamente.":
           jump explicacao_aula_01

label aula_02:
    menu:
       p "Você quer ver o próximo salmo ou a lista de aulas?"
       "Quero ver o Salmo da Aula 02 ou seja o próximo salmo.":
            p "Salmo 02"
            call salmo02()
            jump pergunta_explicacao_aula_02
       "Quero ver a lista de aulas":
            jump lista_aulas 

label pergunta_explicacao_aula_02:
    menu:
        p "Você quer que eu repita novamente? Ou quer ver a explicação?"
        "Repita novamente":
              call salmo02()
              jump pergunta_explicacao_aula_02
        "Pode ir para explicação":
              jump explicacao_aula02
        "Não, pode ir para próxima aula":
              jump aula03
        "Não, quero sair":
              jump sair 

label explicacao_aula02:
    p "Aqui temos um salmo de 12 versos."
    show sylvie green surprised
    e "UAU! Doze versos é muito!"
    hide sylvie green surprised
    p "Você acha? Há salmos de mais de 150 versos."
    show sylvie green surprised
    e "Professor como eu posso memorizar esses salmos?"
    hide sylvie green surprised
    menu:
       p "Posso te explicar uma estratégia simples agora. Você quer ouvir?"
       "Sim, por favor!":
           call estrategia_01
           jump continuar_explicacao_aula02
       "Não, quero ouvir a explicação apenas.":
           "Então vamos continuar a explicação"
           jump continuar_explicacao_aula02

label continuar_explicacao_aula02:

label aula_03:
    p "Esse salmo agora foi feito por Davi quanto fugia de Absalão, seu filho."
    call salmo03
    menu:
        p "Você quer que eu repita novamente? Ou quer ver a explicação?"
        "Repita novamente":
              jump aula_03
        "Pode ir para explicação":
              jump explicacao_aula03
        "Não, pode ir para próxima aula":
              jump aula_04
        "Não, quero sair":
              jump sair 

label explicacao_aula03:

label aula_04:
    p "Mais um salmo de 8 versos para memorizar"
    call salmo04
    p "O final é uma verdade avalassadora para hoje e para sempre: {i}Eu deitarei e dormirei em paz, porque somente tu Senhor, me fazer descansar seguro{/i}"

label aula_05:
    p "Mais um salmo de 12 versos para memorizar"
    call salmo05
    jump sair 

label sair:
    p "Até a próxima!"
    jump final_jogo

label final_triste:
    p "Que pena."
    jump final_jogo

label lista_aulas:
    menu:
      "Qual aula você deseja ver?"
      "Aula 1":
          jump aula_01
      "Aula 2":
          jump aula_02
      "Aula 3":
          jump aula_03
      "Aula 4":
          jump aula_04 
      "Aula 5":
          jump aula_05
      "Apenas sair":
          jump sair 


label final_jogo:
    return
