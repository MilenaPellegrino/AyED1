
--1) 
data Palo = Treboles | Corazones | Picas | Diamantes deriving Eq


mismo_palo :: Palo -> Palo -> Bool 
mismo_palo Treboles Treboles = True
mismo_palo Corazones Corazones = True
mismo_palo Picas Picas = True
mismo_palo Diamantes Diamantes = True
mismo_palo _ _ = False


-- 2) 
type Numero = Int
data Naipe = Numerada Numero Palo | Rey Palo | Reina Palo | Jota Palo | As Palo 

-- 3) 
valor_naipe :: Naipe -> Int
valor_naipe (Numerada num pal) = num 
valor_naipe (Jota pal) = 11
valor_naipe (Reina pal) = 12
valor_naipe (Rey pal) = 13
valor_naipe (As pal) = 14

-- 4) 
--instance Ord Naipe where
    --n1 <= n2 = valor_naipe n1 <= --valor_naipe n2

-- 5) 
solo_numeradas :: [Naipe] -> Palo -> [Numero]
solo_numeradas [] p = []
solo_numeradas (Numerada num p:xs) pal | p == pal = num : solo_numeradas xs pal
                                       | otherwise = solo_numeradas xs pal
solo_numeradas (x:xs) pal = solo_numeradas xs pal

-- 6) 
data EmpresaTelefono = Claro | Movistar | Personal | Tuenti 

fraseEmpresa :: EmpresaTelefono -> String
fraseEmpresa Claro = "CLaro la mejor"
fraseEmpresa Movistar = "MOvistar la mejor opcion"
fraseEmpresa Personal ="Persona tiene personal"
fraseEmpresa Tuenti = "COn tuenti es mas facilS"

-- 7) 

estaEnDNI :: Int -> Bool
-- Ya que mi dni es 46227114
estanEnDNI 4 = True
estanEnDNI 0 = True
estanEnDNI 1 = True
estanEnDNI 2 = True
estanEnDNI 3 = True
estaEnDNI _ = False

-- 8) 
sumaDNI :: [Int] -> Int 
sumaDNI [] = 0 
sumaDNI (x:xs) | estanEnDNI x = x + sumaDNI xs
               | otherwise = sumaDNI xs

-- 9) 
type Cantidad = Int
data Moneda = Uno | Dos | Cinco | Diez deriving Show

-- 10) 
titulo :: Moneda -> String
titulo Uno = "Un peso"
titulo Dos = "Dos Pesos"
titulo Cinco = "Cinco Pesos"
titulo Diez = "Diez pesos"

-- 11) 
data ContadoraMonedas = Agregar Moneda ContadoraMonedas | SinPlata

-- 12) 
entregar_monedas :: ContadoraMonedas -> Moneda -> [Moneda]
entregar_monedas SinPlata m = []
entregar_monedas (Agregar m cm) mon | igualMoneda m mon = m : entregar_monedas cm mon 
                                    | otherwise = entregar_monedas cm mon 

-- FUncion auxiliar 
igualMoneda :: Moneda -> Moneda -> Bool
igualMoneda Uno Uno = True
igualMoneda Dos Dos = True
igualMoneda Cinco Cinco = True
igualMoneda Diez Diez = True
igualMoneda _ _ = False

-- 13) 
data Dedicacion = Simple | Semi | Full | Investigador deriving Show

misma_dedicacion :: Dedicacion -> Dedicacion -> Bool 
misma_dedicacion Simple Simple = True
misma_dedicacion Semi Semi = True
misma_dedicacion Full Full = True
misma_dedicacion Investigador Investigador = True
misma_dedicacion _ _ = False

-- 14) 
type Cant = Int
horas_trabajo :: Dedicacion -> Cant
horas_trabajo Simple = 10 
horas_trabajo Semi = 20 
horas_trabajo Full = 50
horas_trabajo Investigador = 60

-- 15) 
data Persona = Decano Dedicacion | Docente Dedicacion | NoDocente Dedicacion  deriving Show

instance Eq Dedicacion where
    ded1 == ded2 = horas_trabajo ded1 == horas_trabajo ded2
instance Ord Dedicacion where
    de1 <= de2 = horas_trabajo de1 <= horas_trabajo de2

-- Funcion auxilair que dada una persona me devuelve su dedicacion 
dedi :: Persona -> Dedicacion
dedi (Decano d) = d 
dedi (Docente d) = d 
dedi (NoDocente d) = d
-- 16) 
solo_dedicacion :: [Persona] -> Dedicacion -> [Persona]
solo_dedicacion [] _ = []
solo_dedicacion (x:xs) r | (misma_dedicacion (dedi x) r) = x : solo_dedicacion xs r
                                | otherwise = solo_dedicacion xs r

--17) 
data Deporte = Futbol | Basquet | Tenis | Valorant | Dota2 deriving (Eq, Show)

type MinJugadores = Int 

minimaCantidad :: Deporte -> MinJugadores
minimaCantidad Futbol = 22 
minimaCantidad Basquet = 12
minimaCantidad Tenis = 2
minimaCantidad Valorant = 10
minimaCantidad Dota2 = 6 

-- 18) 
type NombrePersona = String
data PracticoDeporte = AgregarDeporte Deporte NombrePersona | Ninguna deriving (Eq, Show)

-- 19) 
{- deporte :: PracticoDeporte -> Deporte -> NombrePersona -> Bool 
deporte Ninguna _ = False
deporte (AgregarDeporte dep n) nombre| n === nombre = True
                                     | otherwise = False -}

-- 20) 
data Color = Rojo | Negro | Azul deriving Show
mismo_color :: Color -> Color -> Bool 
mismo_color Rojo Rojo = True
mismo_color Negro Negro = True
mismo_color Azul Azul = True
mismo_color _ _ = False

instance Eq Color where
    c1 == c2 = mismo_color c1 c2

-- 21)
data Tipo = Auto | Moto | Camion deriving (Eq, Show)
data Vehiculo = Cons Tipo Color  deriving (Eq, Show)

-- 22) 
pintar_auto :: Vehiculo -> Color -> Maybe Vehiculo 
pintar_auto (Cons t c) col | (t == Auto) && mismo_color c col = Just (Cons t c) 
                           | otherwise = Nothing
-- 22) 
--solo_de_color :: Color -> [Vehiculo] -> Tipo 

-- 23) 
data Forma = Piedra | Papel | Tijera deriving (Eq, Show)

-- 24) 
le_gana :: Forma -> Forma -> Bool
le_gana Tijera Papel = True 
le_gana Papel Piedra = True
le_gana Piedra Tijera = True
le_gana _ _ = False

-- 25) le_gana Piedra Papel = True 
type Nombre = String 

data Jugador = Mano Nombre Forma deriving (Eq, Show)

-- 26)
ganador:: Jugador -> Jugador -> Maybe Nombre
ganador (Mano n f) (Mano n2 f2) | (le_gana f f2) = Just n 
                                | (le_gana f2 f) = Just n2
                                | otherwise = Nothing

-- 27) 
-- Funcion auxiliar para verificar que es la misma forma 
-- Dada una forma y un jugador me devuelve True si tienen la misma forma
misma_forma :: Forma -> Jugador -> Bool
misma_forma f (Mano nom for) = f == for

quien_jugo :: Forma -> [Jugador] -> [Nombre]
quien_jugo _ [] = []
quien_jugo f ((Mano nom for):xs) | misma_forma f (Mano nom for) = nom : quien_jugo f xs 
                                 | otherwise = quien_jugo f xs

data NotaMusical = Do | Re | Mi | Fa | Sol | La | Si  deriving (Eq, Show)

data Figura = Negra | Corchea deriving (Eq, Show)

data Melodia = Entonar NotaMusical Figura Melodia | Vacia deriving (Eq, Show)

contar_tiempos :: Melodia -> Int 
contar_tiempos Vacia = 0 
contar_tiempos (Entonar nm f m) | f == Negra = 2 + contar_tiempos m 
                                | f == Corchea = 1 + contar_tiempos m 


data ArtistaMusica = Cantante Registro TipoCanto Trayecto | Instrumentista Instrumento Trayecto 
 
data Registro = Soprano | Contralto | Tenor | Baritono | Bajo 

data Canto = Solista | Coral 
data Instrumento = Violin | Clarinete | Trompeta | Timbales 

type Trayecto = Int

trayectoria_musical :: ArtistaMusica -> Trayecto 


-- Ejercicio cuatro millones
data ListaAsoc a b = Vacia | Nodo a b (ListaAsoc a b)

la_algun_multiplo :: ListaAsoc a b  -> b -> Bool 
 la_algun_multiplo Vacia = False
{-la_algun_multiplo (Nodo x y (Lista)) | x % y == 0 = True 
                                     | otherwise = la_algun_multiplo Nodo  -}
