local Task = {}

function Task:new(subject, day_due, month_due, description)
  local new_task = setmetatable({}, self)
  self.__index = self

  new_task.subject = subject
  new_task.day_due = day_due
  new_task.month_due = month_due
  new_task.description = description

  new_task.sprite = love.graphics.newImage("sprites/"..subject..".png")

  new_task.completed = false

  return new_task
end

function Task:set_completed(completion)
  self.completed = completion
end

function Task:set_day(new_day, new_month)
  self.day_due = new_day
  self.month_due = new_month
end

return Task
