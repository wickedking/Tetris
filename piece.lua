--piece.lua

local i_piece = require("ipiece.lua");
local j_piece = require("jpiece.lua");
local l_piece = require("lpiece.lua");
local t_piece = require("tpiece.lua");
local box_piece = require("boxpiece.lua");
local s_piece = require("spiece.lua");
local z_piece = require("zpiece.lua");

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

local rotate = {}

function rotate(piece) 
	if (piece.piece_type == "i") then
		piece = i_piece.rotation(piece)
	else if (piece.piece_type == "j") then
		piece = j_piece.rotation(piece)
	else if (piece.piece_type == "l") then
		piece = l_piece.rotation(piece)
	else if (piece.piece_type == "s") then
		piece = s_piece.rotation(piece)
	else if (piece.piece_type == "z") then
		piece = z_piece.rotation(piece)
	else if (piece.piece_type == "t")
		piece = t_piece.rotation(piece)
	else if (piece.piece_type == "o") then
		piece = o_piece.rotation(piece)
	end
	return piece
end