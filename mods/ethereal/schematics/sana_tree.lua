
local _ = {name = "air", prob = 0}
local L = {name = "wood:sana_leaves", prob = 255}
local T = {name = "wood:sana_trunk", prob = 255}
local t = {name = "wood:sana_trunk", prob = 127}

ethereal.sana_tree = {

	size = {x = 9, y = 8, z = 9},

	yslice_prob = {
		{ypos = 0, prob = 127},
		{ypos = 1, prob = 127},
	},

	data = {

	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,_,t,t,_,t,t,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,t,t,t,t,t,t,t,_,
	_,_,_,t,_,t,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,L,L,L,L,L,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,t,t,t,T,t,t,t,_,
	_,_,t,t,T,t,t,_,_,
	_,_,_,_,T,_,_,_,_,
	_,_,_,_,T,_,_,_,_,
	_,L,L,L,T,L,L,L,_,
	_,_,L,L,L,L,L,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,_,t,T,T,T,t,_,_,
	_,_,_,T,T,T,_,_,_,
	_,_,_,T,T,T,_,_,_,
	_,_,_,T,T,T,_,_,_,
	L,L,L,L,T,L,L,L,L,
	_,L,L,L,T,L,L,L,_,
	_,_,L,L,L,L,L,_,_,
	_,_,_,_,_,_,_,_,_,

	_,t,t,t,T,t,t,t,_,
	_,_,t,t,T,t,t,_,_,
	_,_,_,_,T,_,_,_,_,
	_,_,_,_,T,_,_,_,_,
	_,L,L,L,T,L,L,L,_,
	_,_,L,L,L,L,L,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,t,t,t,t,t,t,t,_,
	_,_,_,t,_,t,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,L,L,L,L,L,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,_,t,t,_,t,t,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,L,L,L,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,L,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,
	_,_,_,_,_,_,_,_,_,

	}
}
