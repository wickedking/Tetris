-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- 
local physics = require( "physics" ) 
piece = require("piece")
	

--global variables
total_height = display.pixelHeight
total_width = display.pixelWidth
height = 22
width = 10
total_pieces = 0
pieces = {}
board = {}
nextPiece = {"i", "o", "l", "j", "s", "t", "z"} 
pieceType = 0
nowPiece = {}

--move pieces on inputs
--display correctly
--fix can move method for dx = 0
--game loop
--fail method

--board[1] = {{0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
-- 			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
-- 			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--			  {0, 0, 0, 0, 0, 0 ,0 ,0 ,0 ,0},
--
--
--start of functions
function constructBoard()
  for i = 1, height do
    board[i] = {}
    for j = 1, width do 
      board[i][j] = 0
    end
  end 

end		

function rotatePiece()


end

function createPiece()
  pieceType = pieceType + 1
  if pieceType > 6 then
	pieceType = 0
  end
  piece1 = construct(nextPiece[pieceType])
  nowPiece = piece1
  piece1 = rotate(piece1)
  piece1 = rotate(piece1)  
return piece1
end

function canMove(canPiece, dx, dy)
	local pieceCanMove = false
	unassignPiece(canPiece)
	print(canPiece.sub1x)
	print(dx)
	boundsCheck = false
	returnable = false
	hitPiece = true
	if canPiece.sub1x + dx > 0 and canPiece.sub1x + dx < 11 then
		if canPiece.sub2x + dx > 0 and canPiece.sub1x + dx < 11 then
			if canPiece.sub3x + dx > 0 and canPiece.sub1x + dx < 11 then
				if canPiece.sub4x + dx > 0 and canPiece.sub1x + dx < 11 then
					if canPiece.sub1y + dy > 0 and canPiece.sub1x + dy < 22 then
						if canPiece.sub2y + dy > 0 and canPiece.sub1x + dy < 22 then
							if canPiece.sub3y + dy > 0 and canPiece.sub1x + dy < 22 then
								if canPiece.sub4y + dy > 0 and canPiece.sub1x + dy < 22 then
									boundsCheck = true
								end
							end
						end
					end
				end
			end
		end
	end
			
	if boundscheck == true then
		if board[canPiece.sub1x + dx][canPiece.sub1y + dy] == 0 then
			if board[canPiece.sub2x + dx][canPiece.sub2y + dy] == 0 then
				if board[canPiece.sub3x + dx][canPiece.sub3y + dy] == 0 then
					if board[canPiece.sub4x + dx][canPiece.sub4y + dy] == 0 then
						movePieces(canPiece, dx, dy)
						assignPiece(canPiece)
						displayPieces()
						pieceCanMove = true
						hitPiece = false
					end
				end
			end
		end
	end
	if pieceCanMove == false then
	assignPiece(canPiece)
	displayPieces()
	returnable = false
	else
		if hitPiece then
		checkRow()
		createPiece()
		end
	end
end

function checkRow(endPiece)
--will check row to see if deletion is necassary
	rowDelete = false
	for i = 1, height do
		pass = true
		for j = 1, width do
			if board[i][j] == 0 then
				pass = false
				break
			end
		end
		if pass then
			deleteRows(i)
			rowDelete = true
		end
	end
	if rowDelete then
		moveDown()
	end
end

function moveDown()
--will loop through board and move any remaining piece down
--if called piece is not current anymore can move it down
	for i = height, 1 do
		for j = width, 1 do
			if board[i][j] == 1 then
				if j+1 < 23 then
					if board[i][j+1] == 0 then
						board[i][j] = 0
						board[i][j+1] = 1
					end
				end
			end
		end
	end
end

function fail()
--called when the game is over
end

function deleteRows(rowNumber)
	for j = 1, width do
		board[rowNumber][j] = 0
	end
end

function movePieces(thePiece, dx, dy)
	thePiece.boardx = thePiece.boardx + dx
	thePiece.boardy = thePiece.boardy + dy
end

function unassignPiece(unPiece)
	board[unPiece.sub1x + unPiece.boardx][unPiece.sub1y + unPiece.boardy] = 0
	board[unPiece.sub2x + unPiece.boardx][unPiece.sub2y + unPiece.boardy] = 0
	board[unPiece.sub3x + unPiece.boardx][unPiece.sub3y + unPiece.boardy] = 0
	board[unPiece.sub4x + unPiece.boardx][unPiece.sub4y + unPiece.boardy] = 0

end

function assignPiece(asPiece)
	board[asPiece.sub1x + asPiece.boardx][asPiece.sub1y + asPiece.boardy] = 1
	board[asPiece.sub2x + asPiece.boardx][asPiece.sub2y + asPiece.boardy] = 1
	board[asPiece.sub3x + asPiece.boardx][asPiece.sub3y + asPiece.boardy] = 1
	board[asPiece.sub4x + asPiece.boardx][asPiece.sub4y + asPiece.boardy] = 1

end
--185 to the right on width
--320 to low on the height

function displayPieces()
--takes the table of pieces and displays them all. usually called every so often or
--when an action takes place
--needs to be changed to account for major piece and sub piece
  local shapes = {}
  for i = 1, height do
    for j = 1, width do
	 -- print(board[i][j].." board"..i.." "..j)
	  shapes[i ..j.."test"] = display.newRect((i-1)*28 + 20 , (j-1) * 22, total_width /10, total_height / 22)
      if(board[i][j] ~= 0) then
		shapes[i..j.."test"]:setFillColor(1,1,1)
      else
		shapes[i..j.."test"]:setFillColor(0.5,0.5,0.5)
		end
    end
  end
end


--start of code
physics.setDrawMode("hybrid")
physics.start()
--local myText = display.newText( "Tetris", 100, 0, native.systemFont, 16 )
local squares = display.newGroup()

constructBoard()
currentPiece = createPiece("i")
assignPiece(currentPiece)
displayPieces()

local function listener(event) 
   --local test = display.newRect(squares, 100, 100, 100, 100)
   --test:setFillColor(1,1,0)
   --local myText = display.newText(currentPiece["boardx"], 100, 0, native.systemFont, 16 )
   canMove(currentPiece, 20,5)
   rotate(nowPiece) 
end

timer.performWithDelay(2000, listener, 1)
--setcolor
--need a game loop even just basic while loop accept inputs maybe
--and then redisplay

--Used to display main screen
--commented out for future use

--local Main = {}

--local background = ('tetris_background.png')
--local menuScreen
--local startButton
--local mScreen

--local addMenuScreen = {}
--local tweenMS = {}

--function Main()
--	addMenuScreen()
--end

--function addMenuScreen() 
--	menuScreen = display.newGroup()
--	mScreen = display.newImage('menuScreen2.png')
--	startButton = display.newImage('play_button.png')
--	startButton.name = 'startButton'
--	menuScreen:insert(mScreen)
--	startButton.x = 160
--	startButton.y = 260
--	menuScreen:insert(startButton)
--	startButton:addEventListener('tap', tweenMS)
--end



--function tweenMS:tap(e)
--	if(e.target.name == 'startButton') then
--		transition.to(menuScreen, {time = 300, y = -menuScreen.height, transition = easing.outExpo, onComplete = addGameScreen})
--	end
--end


--Main()