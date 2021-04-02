--
--
-- A' = not A
--
--  MAPAS KARNAUGHT
--
--
--  2 variaveis 
--
--     |  B' |  B  |
--- ---+-----+-----+----      
--   A'|  00 |  01 |
--- ---+-----+-----+----
--   A |  10 |  11 |
--
--
--  3 variaveis
--
--     |     B'    |     B     |
--     +-----|-----+-----|-----+ 
--   A'|     +     |     |     |
--     +-----|-----+-----|-----+ 
--   A |     |     |     |     |
--     +-----+-----+-----+-----+ 
--     |  C' |     C     |  C' |
--
--
--  4 variaveis
--
--     |     C'    |     C     |
--   --+-----|-----+-----|-----+----- 
--     |     |     |     |     |  B'
--  A' +-----+-----+-----+-----+----  
--     |     |     |     |     |
--   --+-----|-----+-----|-----+  B
--     |     |     |     |     |
--  A  +-----+-----+-----+-----+----  
--     |     |     |     |     |  B'
--   --+-----+-----+-----+-----+-----
--     |  D' |     D     |  D' |
--
--
--
function iand(a,b)
    return a and b
end

function ior(a,b)
    return a or b
end

function inot(a)
    return not a
end

function inor(a,b)
    return inot(ior(a,b))
end

function inand(a,b)
    return inot(iand(a,b))
end

function ixor(a,b)
    local x1 = iand(inot(a),b)	
    local x2 = iand(inot(b),a)
    return ior(x1,x2)
end


