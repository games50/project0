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

-- skin is an int that corresponds to a quad table
function Alien:init(skin, x, y)
    -- TODO
    self.skin = skin
    self.x = x
    self.y = y
    self.inPlay = true

    -- tracks the total dt since last shot.
    self.timeSinceShot = math.random(1,9)
    self.timeSinceMove = 0

end

function Alien:update(dt, projectiles)
    self.timeSinceShot = self.timeSinceShot + dt
    if self.timeSinceShot >= 3 then
        --fire
        projectiles[#projectiles+1] = Projectile(self.x + ALIEN_WIDTH/2, self.y + ALIEN_HEIGHT,
          'down')
        self.timeSinceShot = 0
    end

    -- Alien movement

end

function Alien:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['aliens'][self.skin],self.x, self.y)
    end
end
