--[[
    GD50
    Space Invaders Distro

    Dependencies File

    A compilation of all dependencies needed in our app, both in libraries and
    our own code, to extract it from main.
]]

Class = require 'lib/class'
push = require 'lib/push'

require 'src/constants'

require 'src/Alien'
require 'src/Player'
require 'src/Projectile'
require 'src/StateMachine'
require 'src/Util'

require 'src/states/game/BaseState'
require 'src/states/game/ScoreState'
require 'src/states/game/TitleScreenState'
require 'src/states/game/PlayState'