Object = require "classic"

Gerador = Object:extend()

function Gerador:new(_N, _K)
    self.N = _N;
    self.K = _K;
    local SRND = math.sqrt(_N)
    self.SRN = math.floor(SRND)
    self.mat = {}
end

function Gerador:preencherSudoku()
    self:preencherDiagonal()
    self:preencherFaltantes(0, self.SRN)
    self:removerKDigitos()
end

function Gerador:preencherDiagonal()
    for i=1,self.N,i+self.SRN do
        self:preencherCaixa(i,i)
    end
end

function Gerador:naoUsadoNaCaixa(rowStart, colStart, num)
    for i = 1,self.SRN do 
        for j = 1,self.SRN do
            if mat[rowStart+i][colStart+j]==num then
                return false;
            end   
        end    
    end    
    return true;
end

function Gerador:preencherCaixa(row, col)
    num = 0;
    for i=1,self.SRN do 
        for j=1,self.SRN do 
            num = randomGenerator(self.N);
            while(not self:naoUsadoNaCaixa(row, col, num)) {
                num = self:randomGenerator(self.N);
            }
            mat[row+i][col+j]=num
        end
    end
end

function Gerador:randomGenerator(num)
    return math.random(num)
end

function Gerador:ehSeguroColocarNaCelula(i,j,num)
    return self:naoUsadoEmLinha(i,num) and self:naoUsadoEmColuna(j,num) and self:naoUsadoNaCaixa(i - i % self.SRN, j - j % self.SRN, num);
end

function Gerador:naoUsadoEmLinha(i,num)
    for j=1,self.N do 
        if mat[i][j] == num then 
            return false
        end
    end
    return true
end

function Gerador:naoUsadoEmColuna(j,num)
    for i=1,self.N do 
        if mat[i][j] == num then 
            return false
        end
    end
    return true
end

function Gerador:preencherFaltantes(i,j)
    if j>=self.N and i<self.N-1 then 
        i = i + 1
        j = 0
    end
    if i>=self.N and j>=self.N then
        return true
    end
    if i < self.SRN then
        if j < self.SRN then
            j = self.SRN
        end    
    elseif i < (self.N - self.SRN) then
        if j ==  (i / self.SRN) * self.SRN then 
            j =  j + self.SRN
        end    
    else
        if j == self.N-self.SRN then
            i = i + 1
            j = 0
            if i>=self.N then
                return true
            end    
        end
    end

    for num = 1, self.N do
        if self:ehSeguroColocarNaCelula(i, j, num) then
            
            mat[i][j] = num

            if self:preencherFaltantes(i, j+1) then 
                return true
            end    

            mat[i][j] = 0;
        end
    end
    return false;
end

function Gerador:removerKDigitos()
    local count = self.K;
    while count ~= 0
        local cellId = self:randomGenerator(self.N * self.N)

        local i = cellId / self.N
        local j = cellId % self.N
        if j ~= 0 then 
            j = j - 1
        end
        if mat[i][j] ~= 0 then 
            count = count - 1
            mat[i][j] = 0
        end    
    end
end

function Gerador:getMatriz()
    return mat;
end

function Gerador:imprimirSudoku()
    for i=1,self.N do
        for j=1,self.N do
            print(mat[i][j].." ")
        end
        print(" ")   
    end
    print(" ")   
end
