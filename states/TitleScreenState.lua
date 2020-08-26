TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

local highlighted = 1

function TitleScreenState:update(dt)

	sounds['titleMusic']:setLooping(true)
	sounds['titleMusic']:play()

	if love.keyboard.wasPressed('left') or love.keyboard.wasPressed('right') then
		highlighted = highlighted == 1 and 2 or 1
		sounds['beep']:play()
	end
---[[]
	if highlighted == 1 and love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
			sounds['titleMusic']:stop()
			gStateMachine:change('playState')
	end
	if highlighted == 2 and love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
			sounds['titleMusic']:stop()
			gStateMachine:change('tripState')
	end
--]]
end


function TitleScreenState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.setFont(normalFont)
	love.graphics.printf('Trippy Happy', 0, 60, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(smallFont)
	love.graphics.printf('say no drugs', 0, 230, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(tinyFont)
	love.graphics.printf('press enter to start', 0 , VIRTUAL_HEIGHT/ 2, VIRTUAL_WIDTH, 'center')

end