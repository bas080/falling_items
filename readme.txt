 _______  _______  ___      ___      ___   __    _  _______ 
|       ||   _   ||   |    |   |    |   | |  |  | ||       |
|    ___||  |_|  ||   |    |   |    |   | |   |_| ||    ___|
|   |___ |       ||   |    |   |    |   | |       ||   | __ 
|    ___||       ||   |___ |   |___ |   | |  _    ||   ||  |
|   |    |   _   ||       ||       ||   | | | |   ||   |_| |
|___|    |__| |__||_______||_______||___| |_|  |__||_______|

BY:             bas080
DESCRIPTION:    Make defined nodes fall when "connected" node is dug
VERSION:        1.5
LICENCE:        WTFPL
FORUM:          http://http://forum.minetest.net/viewtopic.php?id=2476

Instructions

Add to groups groups = { snappy = 3,flammable=2, floored=1 },

* Add "floored=1" to make node fall when bottom node is dug
* Add "hanging=1" to make node drop when top node is removed
* Add "attached=1" to make node fall when no node is "touching" the node.

Changelog

1.5
* added group hanging for nodes that require top node to hang on

1.0
* uses groups attached to drop "attached" nodes. Does not require facedir
* floored group is used to drop node when bottom node is removed

0.1
* only defined nodes fall when "attached" node is removed
