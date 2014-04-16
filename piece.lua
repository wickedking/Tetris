--piece.lua

local i_piece = require("ipiece");
local j_piece = require("jpiece");
local l_piece = require("lpiece");
local t_piece = require("tpiece");
local box_piece = require("boxpiece");
local s_piece = require("spiece");
local z_piece = require("zpiece");

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
		piece = i_piece.rotation(piece)
	elseif (piece.piece_type == "j") then
		piece = j_piece.rotation(piece)
	elseif (piece.piece_type == "l") then
		piece = l_piece.rotation(piece)
	elseif (piece.piece_type == "s") then
		piece = s_piece.rotation(piece)
	elseif (piece.piece_type == "z") then
		piece = z_piece.rotation(piece)
	elseif (piece.piece_type == "t") then
		piece = t_piece.rotation(piece)
	elseif (piece.piece_type == "o") then
		piece = o_piece.rotation(piece)
	end
	return piece
	end


