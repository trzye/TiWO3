#dane1	dane2	dane3	dane4
#3 3	6 6		7 5		4 4
#000	000000	00000	0000
#111 	000000	11111	1000
#000	001100	01010	0101
#		001100	01010	0010
#		000000	11111
#		000000	10001
#				11111

using Base.Test

include("Board.jl")
include("Generator.jl")
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
	testNextGenBorder01()
	println("testNextGenBorder01 passed (Następna generacja z granicami, dane nr 1)")
	testNextGenBorder02()
	println("testNextGenBorder02 passed (Następna generacja z granicami, dane nr 2)")
	testNextGenBorder03()
	println("testNextGenBorder03 passed (Następna generacja z granicami, dane nr 3)")
	testNextGenBorder04()
	println("testNextGenBorder04 passed (Następna generacja z granicami, dane nr 4)")
	
	testNextGenBorderless01()
	println("testNextGenBorderless01 passed (Następna generacja bez granic, dane nr 1)")
	testNextGenBorderless02()
	println("testNextGenBorderless02 passed (Następna generacja bez granic, dane nr 2)")
	testNextGenBorderless03()
	println("testNextGenBorderless03 passed (Następna generacja bez granic, dane nr 3)")
	testNextGenBorderless04()
	println("testNextGenBorderless04 passed (Następna generacja bez granic, dane nr 4)")
	
	println("All tests passed")
end

function testNextGenBorder01()	
	expRes = testBorderExpData1()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData1.txt")
	#println("data")
	#printBoard(board)
	#println()
	
	#println("expected")
	#printBoard(expRes)
	#println()
	
	next = gen.generateNextOne(board, false)
	#println("got")
	#printBoard(next)
	#println()
	
	@test boardEqual(next, expRes)
end

function testNextGenBorder02()	
	expRes = testBorderExpData2()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData2.txt")	
	next = gen.generateNextOne(board, false)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorder03()
	expRes = testBorderExpData3()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData3.txt")
	next = gen.generateNextOne(board, false)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorder04()
	expRes = testBorderExpData4()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData4.txt")
	next = gen.generateNextOne(board, false)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorderless01()
	expRes = testBorderlessExpData1()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData1.txt")	
	next = gen.generateNextOne(board, true)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorderless02()
	expRes = testBorderlessExpData2()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData2.txt")
	next = gen.generateNextOne(board, true)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorderless03()
	expRes = testBorderlessExpData3()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData3.txt")	
	next = gen.generateNextOne(board, true)
	
	@test boardEqual(next, expRes)
end

function testNextGenBorderless04()
	expRes = testBorderlessExpData4()
	
	bIO = BoardIO()
	gen = Generator()
	
	board = bIO.loadFromFile("testData4.txt")
	next = gen.generateNextOne(board, true)
	
	@test boardEqual(next, expRes)
end

test()
