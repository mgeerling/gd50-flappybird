--[[
    PauseState Class
    Author: Matt Geerling

    TODO update
    The TitleScreenState is the starting screen of the game, shown on startup. It should
    display "Press Enter" and also our highest score.
]]

PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
    self.score = params.score 
    self.bird = params.bird 
    self.pipePairs = params.pipePairs
    self.timer = params.timer
end

function PauseState:update(dt)
    -- transition to countdown when enter/return are pressed
    if love.keyboard.wasPressed('p') then
        gStateMachine:change('play', {
            score = self.score, 
            bird = self.bird,
            pipePairs = self.pipePairs, 
            timer = self.timer
        })
    end
end

function PauseState:render()
    -- simple UI code
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Pause', 0, 64, VIRTUAL_WIDTH, 'center')
end