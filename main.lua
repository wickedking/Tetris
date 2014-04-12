-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- 
local physics = require( "physics" )
	

--global variables
total_height = display.pixelHeight
total_width = display.pixelWidth
height=22
width = 10
total_pieces = 0
pieces = {}
board = {}

--start of functions
function constructBoard()
  for i = 1, height do
    board[i] = {}
    for j = 1, width do 
      board[i][j] = 0
    end
  end 

end		

function createPiece(theType)
  local piece1 = {}
  total_pieces = total_pieces + 1 --call to global
  pieces[total_pieces] = piece1 --call to global
  piece1["boardx"] = 10 
  piece1["boardy"] = 2
  piece1["rotation"] = 0
  piece1["type"] = theType
  --subPieces = getSubPieceLocation(theType, 0)
  piece1["sub1x"] = 0
  piece1["sub1y"] = 0
  piece1["sub2x"] = 0
  piece1["sub2y"] = 1
  piece1["sub3x"] = 0
  piece1["sub3y"] = 2
  piece1["sub4x"] = 0
  piece1["sub4y"] = 3

return piece1

end

function getSubPieceLocation(theType, theRotation)
--by passing in type and rotation, can get the sub piece locations. Will return in a 
--table with certain names and be accessed by caller 

end


function canMove(piece, dx, dy)
--will test the piece that is passed and check wether it can move on the board using
--delta x and delta y.

end

function movePieces(thePiece, dx, dy)
--unassign values in board
--assign new values in board
--using getSubPieceLocation and then modifing from there

end


function displayPieces()
--takes the table of pieces and displays them all. usually called every so often or
--when an action takes place
--needs to be changed to account for major piece and sub piece
for i = 1, height do
  for j = 1, width do
    if(board[i][j] ~= 0) then
      local test = display.newRect(squares, 40*i, 40 * j, 40,40)
    end
  end
end
end

physics.setDrawMode("hybrid")
physics.start()
--local myText = display.newText( "Tetris", 100, 0, native.systemFont, 16 )
local squares = display.newGroup()

board = constructBoard()
thePiece = createPiece("i")

local something = display.newRect(squares, (thePiece["boardx"] + thePiece["sub1x"]) * 21, (thePiece["boardy"] + thePiece["sub1y"]) * 40, 39, 38)
local something1 = display.newRect(squares, (thePiece["boardx"] + thePiece["sub2x"]) * 21, (thePiece["boardy"] + thePiece["sub2y"]) * 40, 39, 38)
local something2 = display.newRect(squares, (thePiece["boardx"] + thePiece["sub3x"]) * 21, (thePiece["boardy"] + thePiece["sub3y"]) * 40, 39, 38)
local something3 = display.newRect(squares, (thePiece["boardx"] + thePiece["sub4x"]) * 21, (thePiece["boardy"] + thePiece["sub4y"]) * 40, 39, 38)
something:setFillColor(1,1,1)
something1:setFillColor(1,1,1)
something2:setFillColor(1,1,1)
something3:setFillColor(1,1,1)
local myText = display.newText( total_height, 100, 0, native.systemFont, 16 )


--setcolor
--need a game loop even just basic while loop accept inputs maybe
--and then redisplay









--extra code not needed. Leftover from testing. could be good reference.



local bottomSquare = display.newRect(squares, 40, 400, 40, 40)
--local leftSquare = display.newRect(squares, -10, 5, 40, 1000)
--local rightSquare = display.newRect(squares, 330, 10, 40, 1000)
--rightSquare:setFillColor(0, 1, 0)
--leftSquare:setFillColor(0, 1, 0)
--bottomSquare:setFillColor(0, 1, 0)


--physics.addBody(bottomSquare, "static", {})
--physics.addBody(leftSquare, "static", {})
--physics.addBody(rightSquare, "static", {})