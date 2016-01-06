#3 3
#000
#111
#000

using Base.Test

include("Board.jl")
include("testData.jl")

function boardEqual(b1::Board, b2::Board)
	if(b1.hight == b2.hight)
		if(b1.width == b2.width)
			for i = 1 : b1.hight
				for j = 1 : b1.width
					if(b1.cells[i, j].isAlife != b2.cells[i, j].isAlife)
						return false
					end
				end
			end
			return true
		else
			return false
		end
	else
		return false
	end
end

function test()
	testLoad0()
	println("testLoad0 passed (Poprawne dane)")
	testLoad1()
	println("testLoad1 passed (Niepoprawne wymiary)")
	testLoad2()
	println("testLoad2 passed (Zły format wymiarów)")
	testLoad3()
	println("testLoad3 passed (Zły format danych)")
	testLoad4()
	println("testLoad4 passed (Niepełne dane)")
	testLoad5()
	println("testLoad5 passed (Brak pliku)")
	testSave1()
	println("testSave1 passed (Poprawne zapisanie do pliku)")
	println("All tests passed")
end

#wszystko dobrze
function testLoad0()
	expRes = Board(3, 3)
	expRes.cells[1, 1] = Cell(false)
	expRes.cells[1, 2] = Cell(false)
	expRes.cells[1, 3] = Cell(false)
	
	expRes.cells[2, 1] = Cell(true)
	expRes.cells[2, 2] = Cell(true)
	expRes.cells[2, 3] = Cell(true)
	
	expRes.cells[3, 1] = Cell(false)
	expRes.cells[3, 2] = Cell(false)
	expRes.cells[3, 3] = Cell(false)
	
	bIO = BoardIO()
	board = bIO.loadFromFile("testData1.txt")

	@test boardEqual(board, expRes)
end

#niepoprawne wymiary
function testLoad1()
	bIO = BoardIO()
	@test_throws ErrorException board = bIO.loadFromFile("badData1.txt")
end

#zły format wymiarów
function testLoad2()
	bIO = BoardIO()
	@test_throws ErrorException board = bIO.loadFromFile("badData2.txt")
end

#zły format danych
function testLoad3()
	bIO = BoardIO()
	@test_throws ErrorException board = bIO.loadFromFile("badData3.txt")
end

#niepełne dane
function testLoad4()
	bIO = BoardIO()
	@test_throws ErrorException board = bIO.loadFromFile("badData4.txt")
end

#brak pliku
function testLoad5()
	bIO = BoardIO()
	@test_throws SystemError board = bIO.loadFromFile("nieistniejaceDaneTestowe.txt")
end

#poprawne zapisanie do pliku
function testSave1()
	board = Board(3, 3)
	board.cells[1, 1] = Cell(false)
	board.cells[1, 2] = Cell(false)
	board.cells[1, 3] = Cell(false)
	
	board.cells[2, 1] = Cell(true)
	board.cells[2, 2] = Cell(true)
	board.cells[2, 3] = Cell(true)
	
	board.cells[3, 1] = Cell(false)
	board.cells[3, 2] = Cell(false)
	board.cells[3, 3] = Cell(false)
	expRes = "3 3\n000\n111\n000\n"
	
	if(isfile("savedData.txt"))
		rm("savedData.txt")
	end
	
	bIO = BoardIO()
	bIO.saveToFile(board, "savedData.txt")
	
	savedContent = readall("savedData.txt")
	
	@test savedContent == expRes
end

test()