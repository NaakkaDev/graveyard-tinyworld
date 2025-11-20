local M = {}

---Return a random float number between two integer values.
---@param lower integer
---@param greater integer
---@return float
function M.random_float(lower, greater)
    return lower + math.random() * (greater - lower)
end

return M
