PlayState = Class{__includes = BaseState}

function PlayState:init()

end


function PlayState:update(dt)
	sounds['playMusic']:setLooping(true)
	sounds['playMusic']:play()

	if love.keyboard.wasPressed('r') then
		sounds['playMusic']:stop()
		gStateMachine:change('titleState')
	end
end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end 

