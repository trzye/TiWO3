include("Board.jl")
include("Generator.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")
gen = Generator()

#generacja jednego na planszy z granicami
gen.generateNextOne(board,false)

#generacja jednego na planszy bez granic
gen.generateNextOne(board,true)
