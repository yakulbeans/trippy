TripState = Class{__includes = BaseState}

function TripState:init() 

end


function TripState:update(dt)
	sounds['tripMusic']:setLooping(true)
	sounds['tripMusic']:play()

	if love.keyboard.wasPressed('r') then
		sounds['tripMusic']:stop()
		gStateMachine:change('titleState')
	end

	redScroll = (redScroll + RED_SCROLL_SPEED * dt)
		% LOOPING_POINT

	greenScroll = (greenScroll + GREEN_SCROLL_SPEED * dt)
		% LOOPING_POINT

	blueScroll = (blueScroll + BLUE_SCROLL_SPEED * dt)
		% LOOPING_POINT
end


function TripState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.draw(redScreen, -redScroll, 0)
	love.graphics.draw(greenScreen, -greenScroll, 0)
	love.graphics.draw(blueScreen, -blueScroll, 0)
	love.graphics.printf('Hello TripState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end
