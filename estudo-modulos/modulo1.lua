local modulo1 = {}

local function privado()
    --esse metodo eh privado, ou seja, só roda aqui nesse modulo
    print('Esse é um metodo privado, nao pode ser chamado diretamente')
end

function modulo1.foo()
    print('Puella parva est')
end

function modulo1.bar()
    privado()
    modulo1.foo() --precisa do prefixo aqui
end

return modulo1