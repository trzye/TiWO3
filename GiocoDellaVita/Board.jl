include("Cell.jl")

function setDimension(hight::Int)
	if(0 < hight < typemax(Int))
		return hight
	else
		throw(error("Niedozwolona wartość wymiaru siatki (mniejsza od zera?)"))
	end
end

type Board
	hight::Int
	width::Int
	cells::Array 

	Board(hight::Int, width::Int) = new(setDimension(hight), setDimension(width), Array(Cell, hight, width))
end

type BoardIO
	loadFromFile
	saveToFile
	BoardIO() = 
		new(
		function loadFromFile(path::String)
			file = open(path)
			lines = readlines(file)
			close(file)
			if(length(lines) < 2)
				throw((error("Błędne dane wejściowe")))
			else
				dimensions = split(lines[1])
				if((isa(parse(string(dimensions[1])), Number)) && isa(parse(string(dimensions[2])), Number)) 
					board = Board(int(dimensions[1]), int(dimensions[2]))
					if(length(lines) < board.hight+1)
						throw((error("Błędne dane wejściowe")))
					else
						for i=2:(board.hight+1)
							if(length(lines[i]) < board.width)
								throw((error("Błędne dane wejściowe")))
							else
								for j=1:(board.width)
									if(lines[i][j] == '1')
										board.cells[i-1; j] = Cell(true)
									elseif(lines[i][j] == '0')
										board.cells[i-1; j] = Cell(false)
									else
										throw((error("Błędne dane wejściowe")))
									end
								end
							end
						end
						return board
					end
				else
					throw((error("Błędne dane wejściowe")))
				end
			end
		end,

		function saveToFile(board::Board, path::String)
			file = open(path, "w")
			write(file, string(board.hight))
			write(file, " ")
			write(file, string(board.width))
			write(file, "\n")
			for i=1:board.hight
				for j=1:board.width
					if board.cells[i ; j].isAlife
						write(file, "1")
					else
						write(file, "0")
					end
				end
				write(file, "\n")
			end
			close(file)
		end
		)
end
