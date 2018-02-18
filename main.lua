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

-- physical screen dimensions
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 600

-- virtual resolution dimensions
VIRTUAL_WIDTH = 512
VIRTUAL_HEIGHT = 288

function love.load()
    -- initialize our nearest-neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- seed the RNG
    math.randomseed(os.time())

    -- app window title
    love.window.setTitle('Space Invaders')

    -- initialize the included font
    smallFont = love.graphics.newFont('fonts/font.ttf', 8)
    love.graphics.setFont(smallFont)

    -- initialize our table of sounds
    sounds = {
        ['alien_shot'] = love.audio.newSource('sounds/alien_shot.wav', 'static'),
        ['death'] = love.audio.newSource('sounds/death.wav', 'static'),
        ['explosion'] = love.audio.newSource('sounds/explosion.wav', 'static'),
        ['fire'] = love.audio.newSource('sounds/fire.wav', 'static')
    }

    -- load up the graphics we'll be using throughout our states
    gTextures = {
        ['main'] = love.graphics.newImage('graphics/sprites.png')
    }

    -- Quads we will generate for all of our textures; Quads allow us
    -- to show only part of a texture and not the entire thing
    gFrames = {
        ['aliens'] = GenerateQuads(gTextures['main'], 16, 16)
    }

    -- initialize our virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = true
    })


    -- initialize state machine with all state-returning functions
    gStateMachine = StateMachine {
        ['title'] = function() return TitleScreenState() end,
        ['play'] = function() return PlayState() end,
        ['score'] = function() return ScoreState() end
    }
    gStateMachine:change('title')

    -- initialize input table
    love.keyboard.keysPressed = {}

end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.update(dt)
    --gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
end

function love.draw()
    push:start()

    gStateMachine:render()

    push:finish()
end

--[[
    Loads high score from a file on disk.
]]
function getHighScore()
    -- TODO
end
