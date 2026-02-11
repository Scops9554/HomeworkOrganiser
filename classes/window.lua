local Window = {}
Window.__index = Window

function Window.new()
  local self = setmetatable({}, Window)

  local title = "Homework Organiser"
  self.title = title

  love.graphics.setDefaultFilter("nearest", "nearest")
  self.sprite = love.graphics.newImage("sprites/window.png")

  self.height = 270
  self.width = 420
  self.banner_height = 24
  self.x = 20
  self.y = 45
  self.borderless = true

  self.follow_cursor = false
  self.follow_target = { x = nil, y = nil }

  love.window.setTitle(title)
  love.window.setMode(self.width, self.height, { ["borderless"] = self.borderless })
  love.window.setPosition(self.x, self.y)

  return self
end

function Window:draw()
  love.graphics.draw(self.sprite, 0, 0, 0, 2, 2)
end

function Window:mousepressed(x, y, button)
  if x > 8 and x <= 16 and y > 8 and y <= 16 then
    love.event.quit()
  end

  local above_banner = x >= 0 and x <= self.width and y >= 0 and y <= self.banner_height
  if button == 1 and above_banner then
    self.follow_cursor = true
    self.follow_target = { x = x, y = y }
  end
end

function Window:mousereleased()
  self.follow_cursor = false
end

function Window:follow()
  if self.follow_cursor then
    local x, y = love.mouse.getPosition()
    self.x = self.x + x - self.follow_target.x
    self.y = self.y + y - self.follow_target.y
    love.window.setPosition(self.x, self.y)
  end
end

return Window
