include("Board.jl")

#funkcja kopiująca tworzaca i kopujaca tablice
function copy(board :: Board)
	w = board.width
	h = board.hight
	board2 = Board(h,w)
	cells1 = board.cells
	cells2 = board2.cells

	for i=1:h
		for j=1:w
			cells2[i , j]= cells1[i , j]
		end
	end
	return board2
end

#funkcja realizujaca zasady gry w ĹĽycie
function rules(bo :: Board, b :: Board, i:: Int, j:: Int, n :: Int)
	if ( bo.cells[i,j].isAlife == true)
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
	return b
end


#funkcja spradzajÄ…ca sasiadĂłw zadanej komorki[i,j], parametry mnop -(-1,0,1) z granicami
function check( bo :: Board, b :: Board, i :: Int, j :: Int, m :: Int, n :: Int, o :: Int, p :: Int )
	tmp = 1
	for( k  = i + m : i + n)
		for( l = j + o : j + p)
			if (( k != i ) && (l != j ) && ( bo.cells[k,l].isAlife == true) )
				tmp = tmp +1
			end
		end
	end
	board = rules( bo, b, i, j, tmp)
	return board
end

#funkcja spradzajaca sasiadĂłw dla komorki [i][j] dla bez granic dla 11 hw h1 i 1w (nie chciaĹ‚o mi sie juz kombinowac)
function check2(bo :: Board, tmp :: Int, a :: Int, b :: Int, c :: Int, d :: Int, e :: Int, f :: Int, g :: Int, h :: Int, i :: Int, j :: Int, k :: Int, l :: Int, m :: Int, n :: Int, o :: Int, p :: Int, r :: Int, s :: Int)
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
	return tmp
end

#funkcja przejsc po tablicy z granicami
function checkingWithBorders( bo :: Board )
	h = bo.hight
	w = bo.width
	b = copy(bo)
	for i =1 : h
		for j = 1 : w
			if( i == 1)
				if( j == 1)
					b = check(bo, b, i, j, 0, 1, 0, 1)
				elseif ( j == w)
					b = check(bo, b, i, j, 0, 1, -1, 0)
				else
					b = check(bo, b, i, j, 0, 1, -1, 1)
				end
			elseif ( i == h)
				if( j == 1)
					b = check(bo, b, i, j, -1, 0, 0, 1)
				elseif ( j == w)
					b = check(bo, b, i, j, -1, 0, -1, 0)
				else
					b = check(bo, b, i, j, -1, 0, -1, 1)
				end
			else
				if( j == 1)
					b = check(bo, b, i, j, -1, 1, 0, 1)
				elseif ( j == w)
					b = check(bo, b, i ,j, -1, 1, -1, 0)
				else
					b = check(bo, b, i, j, -1, 1, -1, 1)
				end
			end
		end
	end
	return b
end

#funkcja przejsc po tablicy bez granic
function checkingInfinity(bo :: Board)
	h = bo.hight
	w = bo.width
	b = copy(bo)
	for i = 1 :h
		for j = 1 : w
			tmp = 1
			if ((i == 1) && (j != 1)&& (j != w) )
				for( l = j - 1 : j + 1 )
					if( bo.cells[h,l].isAlife == true )
						tmp = tmp +1
					end
					if ( (l != j ) && ( bo.cells[i,l].isAlife == true ) )
						tmp = tmp +1
					end
					if (bo.cells[i+1,l].isAlife == true )
						tmp = tmp +1
					end
				end
			elseif( (i == h)&&(j != 1)&&(j != w) )
				for( l = j -1 : j + 1)
					if( bo.cells[1,l].isAlife == true )
						tmp = tmp +1
					end
					if ( (l != j ) && ( bo.cells[i,l].isAlife == true ))
						tmp = tmp +1
					end
					if (bo.cells[i-1,l].isAlife == true)
						tmp = tmp +1
					end
				end
			elseif( (j == 1) && ( i != 1) && (i != h) )
				for(k = i -1 : i + 1)
					if( bo.cells[k,w].isAlife == true)
						tmp = tmp + 1
					end
					for(l = j : j+1)
						if( bo.cells[k,l].isAlife == true)
							tmp = tmp +1
						end
					end
				end
			elseif( (j == w) && ( i != 1) && (i != h))
				for(k = i -1 : i + 1)
					if( bo.cells[k,1].isAlife == true)
						tmp = tmp + 1
					end
					for(l = j -1 : j)
						if( bo.cells[k,l].isAlife == true)
							tmp = tmp +1
						end
					end
				end
			elseif((i == 1) && (j == 1))
				tmp = check2(bo, tmp, h, w, h, j, h, j+1, i, w, i, j, i, j+1, i+1, w, i+1, j, i+1, j+1)	
			elseif((i == 1) && (j == w))
				tmp = check2(bo, tmp, h, j-1, h, j, h, 1, i, j-1, i, j, i, 1, i+1, j-1, i+1, j, i+1, 1)
			elseif((i == h) && (j == 1))
				tmp = check2(bo, tmp, i-1, w, i-1, j, i-1, j+1, i, w, i, j, i, j+1, 1, w, 1, j, 1, j+1)
			elseif((i == h) && (j == w))
				tmp = check2(bo, tmp, i-1, j-1, i-1, j, i-1, 1, i, j-1, i, j, i, 1, 1, j-1, 1, j, 1, 1)
			elseif((i != 1) && (i != h) &&( j != 1) && (j != w) )
				for( k  = i -1 : i + 1)
					for( l = j -1 : j + 1)
						if (( k != i ) && (l != j ) && ( bo.cells[k,l].isAlife == true) )
							tmp = tmp +1
						end
					end
				end
			end
			b = rules(bo, b,i,j,tmp)
		end
	end
	return b
end


type Generator
	generateNextOne
	generateNOnes
	Generator() =
		new(   #funkcja generujaca jeden nastÄ™pny board
		function generateNextOne( board :: Board, infinity :: Bool) 
			#bIO = BoardIO()
			if( infinity == false)
				nb = checkingWithBorders( board )
				return nb

			else
				ni = checkingInfinity( board )
				return ni
			end
		end,

			#funkcja generujaca n nastÄ™pnych boardĂłw zapis co liczbÄ™ saving
		function generateNOnes( board :: Board, infinity :: Bool, n :: Int, saving :: Int) 
			bIO = BoardIO()
			empty = Board(1,1)
			c = div((n+1),saving)
			if ( (n+1)/saving == div((n+1),saving)) 
				nOnes = Array{Board}(c,1)
			else
				nOnes = Array{Board}(c+1,1)
			end
			fill!(nOnes, empty)
			z = 1
			nOnes[1,1] = board

			if( infinity == false)
				for ( i = 1 : n)
					board = checkingWithBorders( board )
					if( i == z)
						ff = findfirst(nOnes, empty)
						nOnes[ff,1] = board	
						z = z + saving
					end
				end
			else
				for ( i = 1 : n)
					board = checkingInfinity( board )
					if( i == z)
						ff = findfirst(nOnes, empty)
						nOnes[ff,1] = board
						z = z + saving
					end
				end 
			end 

			return nOnes
		end
		)
end
