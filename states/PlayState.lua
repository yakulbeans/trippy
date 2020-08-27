PlayState = Class{__includes = BaseState}

function PlayState:init()

end

playerX = 0
PLAYER_SPEED = 250

function PlayState:update(dt)
	sounds['playMusic']:setLooping(true)
	sounds['playMusic']:play()

	if love.keyboard.isDown('right') then
		playerX = math.min(VIRTUAL_WIDTH - 110, playerX + PLAYER_SPEED * dt)
	end

	if love.keyboard.isDown('left') then
		playerX = math.max(0, playerX - PLAYER_SPEED * dt)
	end

	if love.keyboard.wasPressed('r') then
		sounds['playMusic']:stop()
		gStateMachine:change('titleState')
	end


end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')

	love.graphics.setColor(255/255, 70/255, 70/255, 255/255)
	love.graphics.rectangle('fill', playerX, VIRTUAL_HEIGHT - 110, 110, 110)
end 

