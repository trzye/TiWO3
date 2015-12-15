include("Board.jl")

#funkcja realizujaca zasady gry w życie
function rules( b :: Board, i:: Int, j:: Int, n :: Int)
	if ( b.cells[i,j].isAlife == true)
		if (( n == 2) || ( n == 3))
			b.cells[i,j].isAlife = true
		else
			b.cells[i,j].isAlife = false
		end
	else
		if ( n == 3)
			b.cells[i,j].isAlife = true
		else
			b.cells[i,j].isAlife = false
		end
	end
end


#funkcja spradzająca sasiadów zadanej komorki[i,j], parametry mnop -(-1,0,1) z granicami
function check( b :: Board, i :: Int, j :: Int, m :: Int, n :: Int, o :: Int, p :: Int )
	tmp = 0
	for( k  = i + m : i + o)
		for( l = j + n : j + p)
			if (( k != i ) && (l != j ) && ( b.cells[k,l].isAlife == true) )
				tmp = tmp +1
			end
		end
	end
	rules( b, i, j, tmp)
end

#funkcja spradzajaca sasiadów dla komorki [i][j] dla bez granic dla 11 hw h1 i 1w (nie chciało mi sie juz kombinowac)
function check2(bo :: Board, a :: Int, b :: Int, c :: Int, d :: Int, e :: Int, f :: Int, g :: Int, h :: Int, i :: Int, j :: Int, k :: Int, l :: Int, m :: Int, n :: Int, o :: Int, p :: Int, r :: Int, s :: Int)
	tmp = 0
	if( bo.cells[a,b].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[c,d].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[e,f].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[g,h].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[r,s].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[k,l].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[m,n].isAlife == true )
		tmp = tmp +1
	end
	if( bo.cells[o,p].isAlife == true )
		tmp = tmp +1
	end
	rules( bo, i, j, tmp)
end

#funkcja przejsc po tablicy z granicami
function checkingWithBorders( b :: Board )
	h = b.hight
	w = b.width
	for i =1 : h
		for j = 1 : w
			if( i == 1)
				if( j == 1)
					check(b, i, j, 0, 0, 1, 1)
				elseif ( j == w)
					check(b, i, j, 0, -1, 1, 0)
				else
					check(b, i, j, 0, -1, 1, 1)
				end
			elseif ( i == h)
				if( j == 1)
					check(b, i, j, -1, 0, 0, 1)
				elseif ( j == w)
					check(b, i, j, -1, -1, 0, 0)
				else
					check(b, i, j, -1, -1, 0, 1)
				end
			else
				if( j == 1)
					check(b, i, j, -1, 0, 1, 1)
				elseif ( j == w)
					check(b, i ,j, -1, -1, 1, 0)
				else
					check(b, i, j, -1, -1, 1, 1)
				end
			end
		end
	end
end

#funkcja przejsc po tablicy bez granic
function checkingInfinity(b :: Board)
	h = b.hight
	w = b.width
	tmp = 0
	for i = 1 :h
		for j = 1 : w
			if ((i == 1) && (j != 1)&& (j != w) )
				for( l = j + n : j + p)
					if( b.cells[h,l].isAlife == true )
						tmp = tmp +1
					end
					if ( (l != j ) && ( b.cells[i,l].isAlife == true ) )
						tmp = tmp +1
					end
					if (b.cells[i+1,l].isAlife == true )
						tmp = tmp +1
					end
				end
			elseif ((i == h) && (j != 1)&& (j != w) )
				for( l = j + n : j + p)
					if( b.cells[1,l].isAlife == true )
						tmp = tmp +1
					end
					if ( (l != j ) && ( b.cells[i,l].isAlife == true ))
						tmp = tmp +1
					end
					if (b.cells[i-1,l].isAlife == true)
						tmp = tmp +1
					end
				end
			elseif((i == 1) && (j ==1))
				check2(b, h, w, h, j, h, j+1, i, w, i, j, i, j+1, i+1, w, i+1, j, i+1, j+1)	
			esleif( (i ==1) && ( j == w))
				check2(b, h, j-1, h, j, h, 1, i, j-1, i, j, i, 1, i+1, j-1, i+1, j, i+1, 1)
			elseif((i == h) && (j == 1))
				check2(b, i-1, w, i-1, j, i-1, j+1, i, w, i, j, i, j+1, 1, w, 1, j, 1, j+1)
			elseif(( i ==h) && (j == w))
				check2(b, i-1, j-1, i-1, j, i-1, 1, i, j-1, i, j, i, 1, 1, j-1, 1, j, 1, 1)
			else
				check( b, i, j, m, n, o , p)
			end
		end
	end
end


type Generator
	generateNextOne
	generateNOnes
	Generator() =
		new(   #funkcja generujaca jeden następny board
		function generateNextOne( board :: Board, infinity :: Bool) 
			if( infinity == false)
				checkingWithBorders( board )
			else
				checkingInfinity( board )
			end
			bIO = BoardIO()
			bIO.saveToFile(board, "board_only_one.txt")
		end,

			#funkcja generujaca n następnych boardów zapis co liczbę saving
		function generateNOnes( board :: Board, infinity :: Bool, n :: Int, saving :: Int) 
			bIO = BoardIO()
			z = saving
			if( infinity == false)
				for ( i = 1 : n)
					checkingWithBorders( board )
					if( i == z)
						bIO.saveToFile(board, "board_nr_$z.txt")	
						z = z + s
					end
				end
			else
				for ( i = 1 : n)
					checkingInfinity( board )
					if( i == z)
						bIO.saveToFile(board, "board_nr_$z.txt")	
						z = z + s
					end
				end 
			end 
		end
		)
end
