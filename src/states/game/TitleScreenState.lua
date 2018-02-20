--[[
    GD50
    Space Invaders Distro

    TitleScreenState Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The TitleScreenState simply displays the title of the game and waits for the player
    to press Enter in order to commence with the PlayState.
]]

TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()
     -- TODO ?
end

function TitleScreenState:enter(params)
    self.highScore = params.score
end

function TitleScreenState:update(dt)
    -- transition to play when enter/return are pressed
    --print("checking keys")
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        print("enter pressed")
        gStateMachine:change('play',{level = 1, high_score = self.highScore})
    end
end

function TitleScreenState:render()
    love.graphics.setFont(smallFont)
    love.graphics.printf('Space Invaders', 0, 64, VIRTUAL_WIDTH, 'center')

    local highScoreString = 'HIGH SCORE: ' .. self.highScore

    love.graphics.setFont(smallFont)
    love.graphics.printf(highScoreString, 0, 80, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(smallFont)
    love.graphics.printf('Press Enter', 0, 100, VIRTUAL_WIDTH, 'center')
end
