include("Board.jl")

function testBorderExpData1()
	b = Board(3, 3)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(true)
	b.cells[1, 3] = Cell(false)
	
	b.cells[2, 1] = Cell(false)
	b.cells[2, 2] = Cell(true)
	b.cells[2, 3] = Cell(false)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(true)
	b.cells[3, 3] = Cell(false)
	
	return b
end

function testBorderExpData2()
	b = Board(6, 6)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(false)
	b.cells[1, 3] = Cell(false)
	b.cells[1, 4] = Cell(false)
	b.cells[1, 5] = Cell(false)
	b.cells[1, 6] = Cell(false)
	
	b.cells[2, 1] = Cell(false)
	b.cells[2, 2] = Cell(false)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(false)
	b.cells[2, 5] = Cell(false)
	b.cells[2, 6] = Cell(false)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(false)
	b.cells[3, 3] = Cell(true)
	b.cells[3, 4] = Cell(true)
	b.cells[3, 5] = Cell(false)
	b.cells[3, 6] = Cell(false)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(true)
	b.cells[4, 4] = Cell(true)
	b.cells[4, 5] = Cell(false)
	b.cells[4, 6] = Cell(false)
	
	b.cells[5, 1] = Cell(false)
	b.cells[5, 2] = Cell(false)
	b.cells[5, 3] = Cell(false)
	b.cells[5, 4] = Cell(false)
	b.cells[5, 5] = Cell(false)
	b.cells[5, 6] = Cell(false)
	
	b.cells[6, 1] = Cell(false)
	b.cells[6, 2] = Cell(false)
	b.cells[6, 3] = Cell(false)
	b.cells[6, 4] = Cell(false)
	b.cells[6, 5] = Cell(false)
	b.cells[6, 6] = Cell(false)
	
	return b
end

function testBorderExpData3()
	b = Board(7, 5)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(true)
	b.cells[1, 3] = Cell(true)
	b.cells[1, 4] = Cell(true)
	b.cells[1, 5] = Cell(false)
	
	b.cells[2, 1] = Cell(true)
	b.cells[2, 2] = Cell(true)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(true)
	b.cells[2, 5] = Cell(true)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(false)
	b.cells[3, 3] = Cell(false)
	b.cells[3, 4] = Cell(false)
	b.cells[3, 5] = Cell(false)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(false)
	b.cells[4, 4] = Cell(false)
	b.cells[4, 5] = Cell(false)
	
	b.cells[5, 1] = Cell(true)
	b.cells[5, 2] = Cell(false)
	b.cells[5, 3] = Cell(false)
	b.cells[5, 4] = Cell(false)
	b.cells[5, 5] = Cell(true)
	
	b.cells[6, 1] = Cell(false)
	b.cells[6, 2] = Cell(false)
	b.cells[6, 3] = Cell(false)
	b.cells[6, 4] = Cell(false)
	b.cells[6, 5] = Cell(false)
	
	b.cells[7, 1] = Cell(true)
	b.cells[7, 2] = Cell(true)
	b.cells[7, 3] = Cell(true)
	b.cells[7, 4] = Cell(true)
	b.cells[7, 5] = Cell(true)
	
	return b
end

function testBorderExpData4()
	b = Board(4, 4)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(false)
	b.cells[1, 3] = Cell(false)
	b.cells[1, 4] = Cell(false)
	
	b.cells[2, 1] = Cell(false)
	b.cells[2, 2] = Cell(false)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(false)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(true)
	b.cells[3, 3] = Cell(true)
	b.cells[3, 4] = Cell(false)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(true)
	b.cells[4, 4] = Cell(false)
	
	return b
end

function testBorderlessExpData1()
	b = Board(3, 3)
	b.cells[1, 1] = Cell(true)
	b.cells[1, 2] = Cell(true)
	b.cells[1, 3] = Cell(true)
	
	b.cells[2, 1] = Cell(true)
	b.cells[2, 2] = Cell(true)
	b.cells[2, 3] = Cell(true)
	
	b.cells[3, 1] = Cell(true)
	b.cells[3, 2] = Cell(true)
	b.cells[3, 3] = Cell(true)
	
	return b
end

function testBorderlessExpData2()
	b = Board(6, 6)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(false)
	b.cells[1, 3] = Cell(false)
	b.cells[1, 4] = Cell(false)
	b.cells[1, 5] = Cell(false)
	b.cells[1, 6] = Cell(false)
	
	b.cells[2, 1] = Cell(false)
	b.cells[2, 2] = Cell(false)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(false)
	b.cells[2, 5] = Cell(false)
	b.cells[2, 6] = Cell(false)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(false)
	b.cells[3, 3] = Cell(true)
	b.cells[3, 4] = Cell(true)
	b.cells[3, 5] = Cell(false)
	b.cells[3, 6] = Cell(false)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(true)
	b.cells[4, 4] = Cell(true)
	b.cells[4, 5] = Cell(false)
	b.cells[4, 6] = Cell(false)
	
	b.cells[5, 1] = Cell(false)
	b.cells[5, 2] = Cell(false)
	b.cells[5, 3] = Cell(false)
	b.cells[5, 4] = Cell(false)
	b.cells[5, 5] = Cell(false)
	b.cells[5, 6] = Cell(false)
	
	b.cells[6, 1] = Cell(false)
	b.cells[6, 2] = Cell(false)
	b.cells[6, 3] = Cell(false)
	b.cells[6, 4] = Cell(false)
	b.cells[6, 5] = Cell(false)
	b.cells[6, 6] = Cell(false)
	
	return b
end

function testBorderlessExpData3()
	b = Board(7, 5)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(false)
	b.cells[1, 3] = Cell(false)
	b.cells[1, 4] = Cell(false)
	b.cells[1, 5] = Cell(false)
	
	b.cells[2, 1] = Cell(true)
	b.cells[2, 2] = Cell(true)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(true)
	b.cells[2, 5] = Cell(true)
	
	b.cells[3, 1] = Cell(false)
	b.cells[3, 2] = Cell(false)
	b.cells[3, 3] = Cell(false)
	b.cells[3, 4] = Cell(false)
	b.cells[3, 5] = Cell(false)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(false)
	b.cells[4, 4] = Cell(false)
	b.cells[4, 5] = Cell(false)
	
	b.cells[5, 1] = Cell(false)
	b.cells[5, 2] = Cell(false)
	b.cells[5, 3] = Cell(false)
	b.cells[5, 4] = Cell(false)
	b.cells[5, 5] = Cell(false)
	
	b.cells[6, 1] = Cell(false)
	b.cells[6, 2] = Cell(false)
	b.cells[6, 3] = Cell(false)
	b.cells[6, 4] = Cell(false)
	b.cells[6, 5] = Cell(false)
	
	b.cells[7, 1] = Cell(false)
	b.cells[7, 2] = Cell(true)
	b.cells[7, 3] = Cell(true)
	b.cells[7, 4] = Cell(true)
	b.cells[7, 5] = Cell(false)
	
	return b
end

function testBorderlessExpData4()
	b = Board(4, 4)
	b.cells[1, 1] = Cell(false)
	b.cells[1, 2] = Cell(false)
	b.cells[1, 3] = Cell(false)
	b.cells[1, 4] = Cell(false)
	
	b.cells[2, 1] = Cell(true)
	b.cells[2, 2] = Cell(false)
	b.cells[2, 3] = Cell(false)
	b.cells[2, 4] = Cell(false)
	
	b.cells[3, 1] = Cell(true)
	b.cells[3, 2] = Cell(true)
	b.cells[3, 3] = Cell(true)
	b.cells[3, 4] = Cell(true)
	
	b.cells[4, 1] = Cell(false)
	b.cells[4, 2] = Cell(false)
	b.cells[4, 3] = Cell(true)
	b.cells[4, 4] = Cell(false)
	
	return b
end