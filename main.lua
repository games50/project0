--[[
    GD50
    Space Invaders Distro

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    Space Invaders was an Atari classic released in 1978 by Taito. The game pits
    the player, a lone starship, against hordes of alien creatures that slowly descend
    upon him/her, shooting bullets along the way. The player has a limited number of lives,
    where each life is the ability to take one point of damage (by either taking a bullet
    or by colliding with an alien). The original version of the game included shields the
    player could hide behind, but this version of the game doesn't require them.
]]

require 'src/Dependencies'

function love.load()
    -- TODO: sound, graphics, and font tables
    -- TODO: set up StateMachine
end

function love.resize(w, h)
    -- TODO
end

function love.keypressed(key)
    -- TODO

    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    -- TODO
end

function love.draw()
    -- TODO
end

--[[
    Loads high score from a file on disk.
]]
function getHighScore()
    -- TODO
end