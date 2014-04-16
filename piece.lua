--piece.lua

require("ipiece");
require("jpiece");
require("lpiece");
require("tpiece");
require("boxpiece");
require("spiece");
require("zpiece");
local i_piece = i_piece;
local j_piece
local l_piece
local t_piece
local box_piece
local s_piece
local z_piece
local sub1x
local sub1y
local sub2x
local sub2y
local sub3x
local sub3y
local sub4x
local sub4y
local piece_type
local boardx
local boardy
local num_rotations

function construct(theType)
 new_piece = {} 
 new_piece["sub1x"] = 0
 new_piece["sub2x"] = 0
 new_piece["sub3x"] = 0
 new_piece["sub4x"] = 0
 new_piece["sub1y"] = 0
 new_piece["sub2y"] = 0
 new_piece["sub3y"] = 0
 new_piece["sub4y"] = 0
 new_piece["piece_type"] = theType
 new_piece["boardx"] = 10
 new_piece["boardy"] = 2
 new_piece["num_rotations"] = 5
 new_piece = rotate(new_piece)
 return new_piece


end

function rotate(piece) 
	if (piece.piece_type == "i") then
		piece = rotation_i(piece)
	elseif (piece.piece_type == "j") then
		piece = rotation_j(piece)
	elseif (piece.piece_type == "l") then
		piece = rotation_l(piece)
	elseif (piece.piece_type == "s") then
		piece = rotation_s(piece)
	elseif (piece.piece_type == "z") then
		piece = rotation_z(piece)
	elseif (piece.piece_type == "t") then
		piece = rotation_t(piece)
	elseif (piece.piece_type == "o") then
		piece = rotation_o(piece)
	end
	return piece
	end


