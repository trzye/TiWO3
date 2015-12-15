include("Board.jl")
include("Generator.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")
gen = Generator()
gen.generateNextOne(board,false) #jak true, to granice zamknięte (nieskończone)
