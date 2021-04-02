local function privado()
    print('Lorem ipsum')
end

local function foo()
    print('Puella parva est')
end

local function bar()
    privado()
    foo() --nao precisa do prefixo aqui
end

return {
    foo = foo,
    bar = bar
}