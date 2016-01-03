include("Board.jl")
include("Generator.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")
gen = Generator()
printBoard(board)
print('\n')

#Jedna generacja na planszy z granicami.
next = gen.generateNextOne(board,false)
printBoard(next)

#Jedna generacja na planszy bez granic.
n = gen.generateNextOne(board,true)
printBoard(n)

#Generacja wielu (trzech) iteracji. Zapisanie co jedną.  Plansza z granicami.
nn = gen.generateNOnes(board,false, 3, 1)

#Generacja wielu (trzech) iteracji. Zapisanie co jedną. Plansza bez granic.
gen.generateNOnes(board,true, 3, 1)
