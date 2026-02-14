local Task = require "classes.task"
local Window = require "classes.window"

function love.load()
  window = Window:new()
  paper = love.graphics.newImage("sprites/FM.png")
  task = Task:new("FM", "12th", "feb", "test task")
end

function love.mousepressed(x, y, button)
  window:mousepressed(x, y, button)
end

function love.mousereleased()
  window:mousereleased()
end

function love.update()
  window:follow()
end

function love.draw()
  love.graphics.clear()
  window:draw()
  love.graphics.draw(paper, 6, 48, 0, 2, 2)
end
