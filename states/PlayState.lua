PlayState = Class{__includes = BaseState}

function PlayState:init()

end


function PlayState:update(dt)
	sounds['playMusic']:setLooping(true)
	sounds['playMusic']:play()
end


function PlayState:render()
	love.graphics.clear(150/255, 150/255, 150/255, 255/255)
	love.graphics.printf('Hello PlayState', 0, 200, VIRTUAL_HEIGHT / 2, 'center')
end 

