--[[
    GD50
    Space Invaders Distro

    ScoreState Class

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The ScoreState is designed to do two things:

        1) Display the score from the last round played and update the high score if it's
        now such.

        2) Save the new high score if so to disk for persistence.
]]

ScoreState = Class{__includes = BaseState}

function ScoreState:enter(params)
    self.playerScore = params.player_score
    self.highScore = params.high_score
    if self.playerScore > self.highScore then
        self.highScore = self.playerScore
    end
    self:writeHighScore()

end

function ScoreState:update(dt)
    -- TODO
end

function ScoreState:render()
    local highScoreString = 'HIGH SCORE: ' .. self.highScore
    local yourScoreString = 'YOUR SCORE: ' .. self.playerScore

    love.graphics.setFont(smallFont)
    love.graphics.printf(highScoreString, 0, 80, VIRTUAL_WIDTH, 'center')
    love.graphics.printf(yourScoreString, 0, 100, VIRTUAL_WIDTH, 'center')
end

--[[
    Writes high score to disk
]]
function ScoreState:writeHighScore()
    love.filesystem.setIdentity('space_invaders')

    love.filesystem.write('space_invaders.score', tostring(self.highScore))
end
