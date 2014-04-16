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

local rotate = {}

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


