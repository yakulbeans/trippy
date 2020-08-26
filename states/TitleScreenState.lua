TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:init()

end

function TitleScreenState:update(dt)
	--sounds['titleMusic']:setLooping(true)
	--sounds['titleMusic']:play()
	redScroll = (redScroll + RED_SCROLL_SPEED * dt)
		% LOOPING_POINT

	greenScroll = (greenScroll + GREEN_SCROLL_SPEED * dt)
		% LOOPING_POINT

	blueScroll = (blueScroll + BLUE_SCROLL_SPEED * dt)
		% LOOPING_POINT
end


function TitleScreenState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.draw(redScreen, -redScroll, 0)
	love.graphics.draw(greenScreen, -greenScroll, 0)
	love.graphics.draw(blueScreen, -blueScroll, 0)
	love.graphics.setFont(normalFont)
	love.graphics.printf('Trippy Happy', 0, 60, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(smallFont)
	love.graphics.printf('say no drugs', 0, 230, VIRTUAL_WIDTH, 'center')
	love.graphics.setFont(tinyFont)
	love.graphics.printf('press enter to start', 0 , VIRTUAL_HEIGHT/ 2, VIRTUAL_WIDTH, 'center')

end