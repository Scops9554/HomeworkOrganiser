local Task = require "classes.task"
local Window = require "classes.window"

function love.load()
  window = Window:new()
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
end
