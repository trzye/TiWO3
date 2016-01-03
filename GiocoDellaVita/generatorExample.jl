include("Board.jl")
include("Generator.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")
gen = Generator()
printBoard(board)
print('\n')

#wywołanie funkcji tworzącej i kopiującej podany board do nowej 
boo = copy(board)
printBoard(boo)
print('\n')


#generacja jednego na planszy z granicami
next = gen.generateNextOne(board,false)
printBoard(next)
print('\n')

#generacja jednego na planszy bez granic
n = gen.generateNextOne(board,true)
printBoard(n)
print('\n')

#generacja wielu 3 iteracje zapisane co 1 z granicami
nn = gen.generateNOnes(board,false, 3, 1)
	for i = 1 : 4
		printBoard(nn[i,1])
		print('\n')
	end
print('\n')

#generacja wielu 3 iteracje zapisane co 1 bez granic
nnn = gen.generateNOnes(board,true, 3, 1)
	for i = 1 : 4
		printBoard(nnn[i,1])
		print('\n')
	end
print('\n')
