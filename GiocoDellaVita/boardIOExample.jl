include("Board.jl")

#Utworzenie instancji do zapisywania/wczytywania planszy z pliku.
bIO = BoardIO()

#Wczytanie planszy z pliku
board = bIO.loadFromFile("daneTestowe.txt")

#Wypisanie planszy na konsolę
printBoard(board)

#Zapisanie planszy do pliku
bIO.saveToFile(board, "zapisaneDaneTestowe.txt")

#Stworzenie wlasnej planszy
myBoard=Board(5,10)

#Dostanie sie do danych o planszy
w = myBoard.width
h = myBoard.hight

#Dostanie się do wszystkich komórek w planszy
cells = myBoard.cells

#Wypełnienie planszy martwymi komórkami
for i=1:5
	for j=1:10
		cells[i , j]=Cell(false)
	end
end

#Dostanie się do konkretnej komórki
cell = cells[1 , 1] # skracja gorna, lewa
cell = cells[5 , 10] # skrajna dolna, prawa

#Informacje o komórce
isAlife = cell.isAlife #zwraca true albo false

#Zmiana stanu
cell.isAlife=true

#Stworzenie własnej komórki
myCell = Cell(true) #żywa
myCell = Cell(false) #martwa
