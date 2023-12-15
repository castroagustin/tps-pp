-- 1
producto x y
    | (y==0 || x==0) = 0
    | x<0 && y<0 = producto (-x) (-y)
    | y<0 = producto y x
    | otherwise = x + producto x (y - 1)

-- 2
-- a
productoPorSumasSucesivas x y
    | (y == 0 || x == 0) = 0
    | x<0 && y<0 = productoPorSumasSucesivas (-x) (-y)
    | y<0 = productoPorSumasSucesivas y x
    | otherwise = x + productoPorSumasSucesivas x (y - 1)

-- b
sumarDigitos x
    | (x < 10) = x
    | otherwise = (x `mod` 10) + sumarDigitos(x `div` 10)

sumarDigitosPM x = if x < 10 then x else x `mod` 10 + sumarDigitosPM (x `div` 10)

-- c
contarIguales [] y = 0
contarIguales (x:xs) y = if x == y then 1 + contarIguales xs y else contarIguales xs y

contarIgualesG l y
    | length l == 0 = 0
    | (y == head l) = 1 + contarIgualesG (tail l) y
    | otherwise = contarIgualesG (tail l) y

-- d
eliminarIguales [] y = []
eliminarIguales (x:xs) y = if (x == y) then eliminarIguales xs y else [x] ++ eliminarIguales xs y

eliminarIgualesG l y
    | length l == 0 = []
    | (y == head l) = eliminarIgualesG (tail l) y
    | otherwise = [head l] ++ eliminarIgualesG (tail l) y

-- e
listaNaturalesG n
    | n <= 0 = []
    | otherwise = [n] ++ listaNaturalesG (n - 1)

listaNaturalesPM n = if (n > 0) then [n] ++ listaNaturalesPM (n - 1) else []

listaNaturalesLC n = [x | x <- [1..n]]

-- f
subLista l n
    | (length l == 0) = []
    | n <= 0 = l
    | otherwise = subLista (tail l) (n - 1)

sublistaPM [] n = []
sublistaPM (x:xs) n = if (n > 0) then sublistaPM xs (n - 1) else (x:xs)

-- g
diferencia l1 l2
    | (length l1 == 0) = []
    | (length l2 == 0) = l1
    | otherwise = if ((head l1) `elem` l2) then diferencia (tail l1) l2 else [head l1] ++ diferencia (tail l1) l2

-- h
f x = x * 3
transformar f [] = []
transformar f (x:xs) = [f x] ++ transformar f xs

-- i
tablaDeParesLC n = [x * 2 | x <- [0..n]]

-- j
p x = (x `mod` 2 == 0)
verificar p x
    | (length x == 0) = True
    | (p (head x) == True) = verificar p (tail x)
    | otherwise = False

-- k
g x y = (x + y) * 2
combinarCon :: (a -> b -> c) -> [a] -> [b] -> [c]
combinarCon f l1 l2
    | (length l1 == 0 || length l2 == 0) = []
    | otherwise = [f (head l1) (head l2)] ++ combinarCon f (tail l1) (tail l2)

-- l
filtrarListaG :: (a -> Bool) -> [a] -> [a]
filtrarListaG p l
    | (length l == 0) = []
    | otherwise = if (p (head l) == True) then [head l] ++ filtrarListaG p (tail l) else filtrarListaG p (tail l)

filtrarListaLC p l = [x | x <- l, p x]

-- Lambdas: map (\(a,b) -> a + b) [(1,2),(3,4),(5,6)]

-- 3
h x y = x * y
foldlG f x l
    | (length l == 0) = x
    | otherwise = foldlG f (f x (head l)) (tail l)

foldlPM f x [] = x
foldlPM f x (l:ls) = foldlPM f (f x l) ls