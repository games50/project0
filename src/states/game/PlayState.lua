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
    self.player = Player()
    self.aliens = {}
    self.projectiles = {}
    self.lives = 3
    self.playerScore = 0

end

function PlayState:enter(params)
    --if params
    self.level = params.level
    self.highScore = params.high_score

    -- initial left or right movement is random
    if math.random(0,1) == 1 then
        self.alienDx = -ALIEN_BASE_SPEED * self.level
    else
        self.alienDx = ALIEN_BASE_SPEED * self.level
    end

    -- level building for aliens
    self:addAliens(self.aliens)
end

function PlayState:update(dt)
    self.player:update(dt,self.projectiles)

    -- update aliens
    for k, alien in pairs(self.aliens) do
        if alien.inPlay then
            alien:update(dt,self.projectiles)
        end
    end

    -- update projectiles
    for k, projectile in pairs(self.projectiles) do
        projectile:update(dt)
    end

    -- TODO: check collisions between projectiles, player, and aliens

    --check for alien projectile collisions
    self:projectilesAliensCollide(self.projectiles,self.aliens)

    --check for projectile player collisions
    self:projectilesPlayerCollide(self.projectiles,self.player)

    -- TODO check for player alien collisions

    --  update alien positions

    self.alienDx = self:updateAliensPositions(dt, self.aliens, self.alienDx)
end

function PlayState:render()
    -- testing to make sure that we are transitioning into the play state
    --love.graphics.setFont(smallFont)
    --love.graphics.printf('Play State', 0, 100, VIRTUAL_WIDTH, 'center')

    self.player:render()

    for k, alien in pairs(self.aliens) do
        alien:render()
    end

    for k, projectile in pairs(self.projectiles) do
        projectile:render()
    end

    -- TODO: render UI text
    local playerScoreString = 'PLAYER SCORE: ' .. self.playerScore
    local highScoreString = 'HIGH SCORE: ' .. self.highScore

    love.graphics.setFont(smallFont)
    love.graphics.printf(playerScoreString, 0, 0, VIRTUAL_WIDTH, 'left')
    love.graphics.printf(highScoreString, 0, 0, VIRTUAL_WIDTH, 'right')
end

-- generates the aliens
function PlayState:addAliens(aliens)

    --local row length, number of aliens that can go on a row with space
    --to move side to side
    local maxRowLength = (VIRTUAL_WIDTH / ALIEN_WIDTH) - 3

    -- number of rows
    local maxRows = (VIRTUAL_HEIGHT - PLAYER_HEIGHT) / ALIEN_WIDTH - 4
    local rows = self.level
    if rows > maxRows then rows = maxRows end

    -- distance between aliens
    local skipWidth = math.random(1,3)

    for r = 1, rows do
        for x = 0, maxRowLength do
            if x % skipWidth == 0 then
                aliens[#aliens+1] = Alien(math.random(1,256),(x+1) * ALIEN_WIDTH,r*ALIEN_HEIGHT)
            end
        end
    end
end

function PlayState:projectilesAliensCollide(projectiles,aliens)
    -- loop through all projectiles
    for k, projectile in pairs(projectiles) do
        --loop through all aliens
        for j, alien in pairs(aliens) do
            --check for collisions if both in play
            if projectile.inPlay and alien.inPlay then
                if projectile:collides(alien.x,alien.y,ALIEN_WIDTH,ALIEN_HEIGHT) then
                    love.audio.play(sounds['explosion'])
                    alien.inPlay = false
                    projectile.inPlay = false
                    self.playerScore = self.playerScore + 1
                end
            end
        end
    end
end

function PlayState:projectilesPlayerCollide(projectiles,player)
    -- loop through all projectiles
    for k, projectile in pairs(projectiles) do
        --check for collisions if both in play
        if projectile.inPlay then
            if projectile:collides(player.x,player.y,PLAYER_WIDTH,PLAYER_HEIGHT) then

                projectile.inPlay = false
                self:loseLife()
            end
        end
    end
end

-- implement the logic to shift aliens left or right, possibly down
-- I am allowing aliens to possibly go past the wall
function PlayState:updateAliensPositions(dt,aliens,dx)

    -- flag that will flip if we find an alien past the wall
    local needToShiftDown = false

    --loop through aliens
    for k, alien in pairs(aliens) do
        -- shift alien left or right
        alien.x = alien.x + dx
        -- check for left wall collision
        if alien.x <= 0 then
            needToShiftDown = true
        -- check for right wall collision
        elseif alien.x + ALIEN_WIDTH >= VIRTUAL_WIDTH then
            needToShiftDown = true
        end
    end

    if needToShiftDown then
        for k, alien in pairs(aliens) do
            -- shift alien down
            alien.y = alien.y + ALIEN_DOWN_SPEED
        end
        -- reverse the alien direction
        print("reversing alien direction")
        return -dx
    else return dx
    end
end

function PlayState:loseLife()
    love.audio.play(sounds['death'])
    self.lives = self.lives - 1
    if self.lives == 0 then
        gStateMachine:change('score',{player_score = self.playerScore,
            high_score = self.highScore})
    end
end
