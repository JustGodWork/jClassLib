--[[
----
----Created Date: 11:25 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [Scale]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Scale: BaseObject
---@field public x number
---@field public y number
---@field public z number
---@overload fun(x: number, y: number, z: number): Scale
Scale = Class.new 'Scale';

---@private
---@param x number
---@param y number
---@param z number
function Scale:Constructor(x, y, z)

    self.x = type(x) == "number" and math.round(x, 2) or 1.0;
    self.y = type(y) == "number" and math.round(y, 2) or 1.0;
    self.z = type(z) == "number" and math.round(z, 2) or 1.0;

    local metatable = getmetatable(self);
    metatable.__tostring = function()
        return string.format("Scale(%s, %s, %s)", self.x, self.y, self.z);
    end
    
end

return Scale;