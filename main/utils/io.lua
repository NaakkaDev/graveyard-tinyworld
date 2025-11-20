local M = {}

---Load json data from file.
---@param filepath string
---@return table|nil
function M.load_json(filepath)
    logger:debug("Loading JSON from path: " .. filepath)

    local resource, is_error = sys.load_resource(filepath)
    if is_error then
        return nil
    end

    if resource then
        return json.decode(resource)
    else
        logger:debug("Loaded JSON but result was nil")
        return {}
    end
end

return M
