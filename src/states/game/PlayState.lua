--[[
    GD50
    Space Invaders Distro

    PlayState Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    During the PlayState, the Player gets to move their ship around and shoot at the aliens
    descending upon them. When the Player takes damage by colliding with a bullet or an
    alien, they lose a life and restart the level.
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    -- TODO: set up Player, projectiles, and other needed variables
end

function PlayState:enter(params)
    -- TODO
end

function PlayState:update(dt)
    -- TODO: update player

    -- TODO: update aliens

    -- TODO: update all projectiles

    -- TODO: check collisions between projectiles, player, and aliens
end

function PlayState:render()
    -- TODO: render player
    
    -- TODO: render aliens

    -- TODO: render projectiles

    -- TODO: render UI text
end