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

--  direction should be a string 'up' or 'down'
function Projectile:init(x, y, direction)
    self.x = x
    self.y = y

    -- for future use
    self.dx = 0
    if direction == 'down' then
        self.dy = PROJECTILE_SPEED
    elseif direction == 'up' then
        self.dy = -PROJECTILE_SPEED
    end

    self.skin = gTextures['projectile']

    self.inPlay = true

end

function Projectile:update(dt)
    self.x = self.x + self.dx
    self.y = self.y + self.dy
end

function Projectile:render()
    -- TODO: render logic
    -- maybe a rectangle is enough?
    if self.inPlay then
        love.graphics.draw(self.skin,self.x, self.y)
    end
end


-- checks if the projectile collides with an unknown object
function Projectile:collides(x,y,width,height)
    if self.x <= (x + width) and
      (self.x + PROJECTILE_WIDTH) >= x and
      (self.y + PROJECTILE_HEIGHT) >= y and
      self.y <= (y + height) then
        return true
    else return false
    end
end
