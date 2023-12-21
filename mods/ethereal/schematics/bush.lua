local _ = {name = "air", param = 0}
local L = {name = "ethereal:bush_leaves", param = 255}
local S = {name = "ethereal:bush_stem", param = 255}

ethereal.bush = {

	size = {x = 3, y = 2, z = 3},

	yslice_prob = {
		{ypos = 3, prob = 127},
	},

	data = {

	L,L,L,
	_,L,_,

	L,S,L,
	L,L,L,

	L,L,L,
	_,L,_,

	}
}