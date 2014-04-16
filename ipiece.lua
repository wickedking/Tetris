--ipiece.lua


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
local piece_type = "i"


function rotation_i(piece) 
	if (piece.current_rotation == 1) then
		piece.current_rotation = 2
		piece.sub1x = 1
		piece.sub1y = 1
		piece.sub2x = 2
		piece.sub2y = 1
		piece.sub3x = 3
		piece.sub3y = 1
		piece.sub4x = 4
		piece.sub4y = 1
	else 
		piece.current_rotation = 1
		piece.sub1x = 1
		piece.sub1y = 1
		piece.sub2x = 1
		piece.sub2y = 2
		piece.sub3x = 1
		piece.sub3y = 3
		piece.sub4x = 1
		piece.sub4y = 4
	end
	return piece
end


--local rotation[1] = {{1, 0, 0, 0, 0},
--					{1, 0, 0, 0, 0},
--					{1, 0, 0, 0, 0},
--					{1, 0, 0, 0, 0},
--					{0, 0, 0, 0, 0}};
					
					
--local rotation[2] = {{1, 1, 1, 1, 0},
--					{0, 0, 0, 0, 0},
--					{0, 0, 0, 0, 0},
--					{0, 0, 0, 0, 0},
--					{0, 0, 0, 0, 0}};					
