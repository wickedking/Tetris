--spiece.lua


local current_rotation = 1;
local num_rotations = 2;


local sub1x
local sub1y
local sub2x
local sub2y
local sub3x
local sub3y
local sub4x
local sub4y
local piece_type = "s"

local rotation = {}

function rotation(piece) 
	if (piece.current_rotation == 1) then
		piece.current_rotation = 2
		piece.sub1x = 1
		piece.sub1y = 2
		piece.sub2x = 2
		piece.sub2y = 2
		piece.sub3x = 2
		piece.sub3y = 1
		piece.sub4x = 3
		piece.sub4y = 1
	else 
		piece.current_rotation = 1
		piece.sub1x = 1
		piece.sub1y = 1
		piece.sub2x = 1
		piece.sub2y = 2
		piece.sub3x = 2
		piece.sub3y = 2
		piece.sub4x = 2
		piece.sub4y = 3
	end
	return piece
end