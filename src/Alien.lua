--[[
    GD50
    Space Invaders Distro

    Alien Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    An Alien is an enemy in Space Invaders that can shoot lasers toward the player and
    also gradually descend toward them. They can have various different skins, but they
    all are functionally the same.
]]

Alien = Class{}

function Alien:init(skin, x, y)
    -- TODO
    -- skin should be an int that indexes into a Quad table
end

function Alien:update(dt, projectiles)
    -- TODO: firing logic
    -- pass in projectiles from PlayState so we can add to it
end

function Alien:render()
    -- TODO
end