push = require 'push'

Class = require 'class'

require 'StateMachine'

require '/states/BaseState'
require '/states/TitleScreenState'

--1280 800
WINDOW_WIDTH = 1200
WINDOW_HEIGHT = 800


--600 375
VIRTUAL_WIDTH = 1200
VIRTUAL_HEIGHT = 800

RED_SCROLL_SPEED = 0
GREEN_SCROLL_SPEED = 0
BLUE_SCROLL_SPEED = 0

LOOPING_POINT = 1800

function love.load()
	love.graphics.setDefaultFilter('nearest', 'nearest')

	love.window.setTitle('Trippy Happy')

	normalFont = love.graphics.newFont('fonts/Village.ttf', 200)
	smallFont = love.graphics.newFont('fonts/Village.ttf', 100)
	tinyFont = love.graphics.newFont('fonts/Village.ttf', 80)
	love.graphics.setFont(normalFont)

	sounds = {
		--['titleMusic'] = love.audio.newSource('music/MartysLetter.mp3', 'static'),
		--['playMusic'] = love.audio.newSource('music/Gigawatts.mp3', 'static')
	}

	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		vsync = true,
		fullscreen = true,
		resizable = true
	})

	gStateMachine = StateMachine {
		['title'] = function() return TitleScreenState() end,
		['play'] = function() return PlayState() end
	}
	gStateMachine:change('title')

	love.keyboard.keysPressed = {}

end

function love.resize(w, h)
	push:resize(w,h)
end

function love.keypressed(key)
	love.keyboard.keysPressed[key] = true

	if key == 'escape' then
		love.event.quit()
	end
end

function love.keyboard.wasPressed(key)
	if love.keyboard.keysPressed[key] then
		return true
	else
		return false
	end
end





function love.update(dt)

	gStateMachine:update(dt)

	love.keyboard.keysPressed = {} 
end






function love.draw()
	push:start()

	gStateMachine:render()

	displayFPS()

	push:finish()
end

function displayFPS()
	love.graphics.setFont(smallFont)
	love.graphics.setColor(0/255, 255/255, 0/255, 255/255)
	love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end