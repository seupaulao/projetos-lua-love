function getNomeLivro(_abrev)
    local livros = {}
    livros["GEN"]="Genesis"
    livros["EXO"]="Exodo"
    livros["LEV"]="Levitico"
    livros["NUM"]="Numeros"
    livros["DEU"]="Deuteronomio"
    livros["JOS"]="Josue"
    livros["JDG"]="Juizes"
    livros["RUT"]="Rute"
    livros["1SA"]="1 Samuel"
    livros["2SA"]="2 Samuel"
    livros["1KI"]="1 Reis"
    livros["2KI"]="2 Reis"
    livros["1CH"]="1 Cronicas"
    livros["2CH"]="2 Cronicas"
    livros["EZR"]="Esdras"
    livros["NEH"]="Neemias"
    livros["EST"]="Esther"
    livros["JOB"]="Jo"
    livros["PSA"]="Salmos"
    livros["PRO"]="Proverbios"
    livros["ECC"]="Eclesiastes"
    livros["SOL"]="Cantares"
    livros["ISA"]="Isaias"
    livros["JER"]="Jeremias"
    livros["LAM"]="Lamentacoes"
    livros["EZE"]="Ezequiel"
    livros["DAN"]="Daniel"
    livros["HOS"]="Oseias"
    livros["JOE"]="Joel"
    livros["AMO"]="Amos"
    livros["OBA"]="Obadias"
    livros["JON"]="Jonas"
    livros["MIC"]="Miqueias"
    livros["NAH"]="Naum"
    livros["HAB"]="Habacuque"
    livros["ZEP"]="Sofonias"
    livros["HAG"]="Ageu"
    livros["ZEC"]="Zacarias"
    livros["MAL"]="Malaquias"
    livros["MAT"]="Mateus"
    livros["MAR"]="Marcos"
    livros["LUK"]="Lucas"
    livros["JOH"]="Joao"
    livros["ACT"]="Atos"
    livros["ROM"]="Romanos"
    livros["1CO"]="1 Corintios"
    livros["2CO"]="2 Corintios"
    livros["GAL"]="Galatas"
    livros["EPH"]="Efesios"
    livros["PHI"]="Filipenses"
    livros["COL"]="Colossenses"
    livros["1TH"]="1 Tessalonisences"
    livros["2TH"]="2 Tessalonisences"
    livros["1TI"]="1 Timoteo"
    livros["2TI"]="2 Timoteo"
    livros["TIT"]="Tito"
    livros["PHM"]="Filemon"
    livros["HEB"]="Hebreus"
    livros["JAM"]="Tiago"
    livros["1PE"]="Pedro 1"
    livros["2PE"]="Pedro 2"
    livros["1JO"]="Joao 1"
    livros["2JO"]="Joao 2"
    livros["3JO"]="Joao 3"
    livros["JUD"]="Judas"
    livros["REV"]="Apocalipse"
    return livros[_abrev]
end

function getNumeroCapitulos(_abrev)
    local livros = {}
    livros["GEN"]=50
    livros["EXO"]=40
    livros["LEV"]=27
    livros["NUM"]=36
    livros["DEU"]=34
    livros["JOS"]=24
    livros["JDG"]=21
    livros["RUT"]=4
    livros["1SA"]=31
    livros["2SA"]=24
    livros["1KI"]=22
    livros["2KI"]=25
    livros["1CH"]=29
    livros["2CH"]=36
    livros["EZR"]=10
    livros["NEH"]=13
    livros["EST"]=10
    livros["JOB"]=42
    livros["PSA"]=150
    livros["PRO"]=31
    livros["ECC"]=12
    livros["SOL"]=8
    livros["ISA"]=66
    livros["JER"]=52
    livros["LAM"]=5
    livros["EZE"]=48
    livros["DAN"]=12
    livros["HOS"]=14
    livros["JOE"]=3
    livros["AMO"]=9
    livros["OBA"]=1
    livros["JON"]=4
    livros["MIC"]=7
    livros["NAH"]=3
    livros["HAB"]=3
    livros["ZEP"]=3
    livros["HAG"]=2
    livros["ZEC"]=14
    livros["MAL"]=4
    livros["MAT"]=28
    livros["MAR"]=16
    livros["LUK"]=24
    livros["JOH"]=21
    livros["ACT"]=28
    livros["ROM"]=16
    livros["1CO"]=16
    livros["2CO"]=13
    livros["GAL"]=6
    livros["EPH"]=6
    livros["PHI"]=4
    livros["COL"]=4
    livros["1TH"]=5
    livros["2TH"]=3
    livros["1TI"]=6
    livros["2TI"]=4
    livros["TIT"]=3
    livros["PHM"]=1
    livros["HEB"]=13
    livros["JAM"]=5
    livros["1PE"]=5
    livros["2PE"]=3
    livros["1JO"]=5
    livros["2JO"]=1
    livros["3JO"]=1
    livros["JUD"]=1
    livros["REV"]=22
    return livros[_abrev]
end

function getNumeroVersiculos(_abrev, _cap)
    local _chave = _abrev..tostring(_cap)
    local capitulo = {}
    capitulo["PSA23"]=6
end

--function carregarDemo()
--    local biblia={}
--    criarVerso(biblia,"PSA",23,1,"O SENHOR é o meu pastor, nada me faltará.")
--    criarVerso(biblia,"PSA",23,2,"Deitar-me faz em verdes pastos, guia-me mansamente a águas tranqüilas.")
--    criarVerso(biblia,"PSA",23,3,"Refrigera a minha alma; guia-me pelas veredas da justiça, por amor do seu nome.")
--    criarVerso(biblia,"PSA",23,4,"Ainda que eu andasse pelo vale da sombra da morte, não temeria mal algum, porque tu estás comigo; a tua vara e o teu cajado me consolam.")
--    criarVerso(biblia,"PSA",23,5,"Preparas uma mesa perante mim na presença dos meus inimigos, unges a minha cabeça com óleo, o meu cálice transborda.")
--    criarVerso(biblia,"PSA",23,6,"Certamente que a bondade e a misericórdia me seguirão todos os dias da minha vida; e habitarei na casa do Senhor por longos dias.") 
--    return biblia
--end

function carregar()
    local file = "bliv.txt"
    local linhas=lines_from(file)
    local biblia=montarEstrutura(linhas)
    return biblia
end

function getLivro(pos)
    local t={"GEN","EXO","LEV","NUM","DEU","JOS","JDG","RUT","1SA","2SA","1KI","2KI","1CH","2CH","EZR","NEH","EST","JOB","PSA","PRO","ECC","SOL","ISA","JER","LAM","EZE","DAN","HOS","JOE","AMO","OBA","JON","MIC","NAH","HAB","ZEP","HAG","ZEC","MAL","MAT","MAR","LUK","JOH","ACT","ROM","1CO","2CO","GAL","EPH","PHI","COL","1TH","2TH","1TI","2TI","TIT","PHM","HEB","JAM","1PE","2PE","1JO","2JO","3JO","JUD","REV"}
    return t[pos]
end

function montarEstrutura(linhas)
    local biblia={}
    --print(#linhas)
    for i,linha in ipairs(linhas) do 
        local _livro, _cap, _ver = string.match(linha, '(%w+)%s(%d+):(%d+)')
        local m = _livro.." ".._cap..":".._ver.." "
        local _texto = linha:sub(m:len()+1,linha:len()-1)
        local tt = "criarVerso(biblia, \"".._livro.."\", ".._cap..", ".._ver..", \"".._texto.."\")"
        print(tt) 
        --criarVerso(biblia,_livro, tonumber(_cap), tonumber(_ver), _texto)
    end
    return biblia
end


--verifica se um arquivo existe
function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

--carrega todas as linhas do arquivo numa tabela, se o arquivo existir
function lines_from(file)
    if not file_exists(file) then return {} end
    lines = {}
    for line in io.lines(file) do 
      lines[#lines + 1] = line
    end
    return lines
end



function criarVerso(_colecao,_abrev, _cap, _verso, _texto, _corTexto)
    local t = {}
    t.abrev = _abrev
    t.capitulo = _cap
    t.versiculo = _verso
    t.texto = _texto
    _colecao[#_colecao+1] = t
end
