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
    -- TODO: initialize player dimensions
end

function Player:update(dt, projectiles)
    -- TODO: process player input
    -- pass in projectiles from PlayState so we can add to it
end

function Player:render()
    -- TODO: render Player
end