include("Board.jl")
include("Generator.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")
gen = Generator()
printBoard(board)
print('\n')

#generacja jednego na planszy z granicami
next = gen.generateNextOne(board,false)
printBoard(next)

#generacja jednego na planszy bez granic
n = gen.generateNextOne(board,true)
printBoard(n)

#generacja wielu 3 iteracje zapisane co 1 z granicami
nn = gen.generateNOnes(board,false, 3, 1)

#generacja wielu 3 iteracje zapisane co 1 z granicami
gen.generateNOnes(board,true, 3, 1)
