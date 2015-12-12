include("Board.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")

#Zapisanie planszy do pliku
bIO.saveToFile(board, "zapisaneDaneTestowe.txt")

#Stworzenie wlasnej planszy
myBoard=Board(5,10)

#dostanie sie do danych o planszy
w = myBoard.width
h = myBoard.hight

#dostanie się do wszystkich komorek w planszy
cells = myBoard.cells

#wypelnienie planszy martwymi komorkami (bo inaczej jest undefined!)
for i=1:5
	for j=1:10
		cells[i ; j]=Cell(false)
	end
end

#dostanie sie do konretnej komorki
cell = cells[1 ; 1] # skracja gorna, lewa
cell = cells[5 ; 10] # skrajna dolna, prawa

#info o komorce
isAlife = cell.isAlife #zwraca true albo false

#zmiana stanu
cell.isAlife=true

#stworzenie wlasnej komorki
myCell = Cell(true) #zywa
myCell = Cell(false) #martwa
