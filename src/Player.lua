--[[
    GD50
    Space Invaders Distro

    Player Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The Player is a ship that remains at the very bottom of the screen, facing toward
    the top, the same direction they can fire bullets to hit Aliens. The Player starts
    with three lives; upon colliding with an enemy or their bullets, the Player will
    lose a life and restart the level. Game over is reached when all lives are depleted.
]]

Player = Class{}

function Player:init()
    -- x is placed in the middle
    self.x = VIRTUAL_WIDTH / 2 - 32

    -- y is placed a little above the bottom edge of the screen
    self.y = VIRTUAL_HEIGHT - 32

    -- start us off with no velocity
    self.dx = 0
    self.dy = 0

    -- starting dimensions
    self.width = 16
    self.height = 16

    -- the skin only has the effect of changing our color, used to offset us
    -- into the gPaddleSkins table later
    self.skin = gTextures['ship']
end

function Player:update(dt, projectiles)
    -- TODO: process player input
    -- pass in projectiles from PlayState so we can add to it
end

function Player:render()
    love.graphics.draw(gTextures['ship'],self.x, self.y)
end
