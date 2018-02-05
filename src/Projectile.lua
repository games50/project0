--[[
    GD50
    Space Invaders Distro

    Projectile Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    This class represents the shots fired from either the Player or an Alien. They cause
    damage to whomever they collide with, be it a Player or an Alien, regardless of who
    fired (because the mechanics of the game make it impossible for either side to damage
    their own side). The only difference is the direction specified in the constructor,
    which sets the velocity to positive or negative depending on which.
]]

Projectile = Class{}

function Projectile:init(x, y, direction)
    -- TODO
    -- direction should be whether the bullet is traveling up or down
end

function Projectile:update(dt)
    -- TODO
end

function Projectile:render()
    -- TODO: render logic
    -- maybe a rectangle is enough?
end