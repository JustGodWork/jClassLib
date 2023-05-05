--[[
----
----Created Date: 3:59 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [Vector2]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Vector2: BaseObject
---@field x number
---@field y number
---@overload fun(x: number, y: number): Vector2
---@overload fun(): Vector2
Vector2 = Class.new 'Vector2';

---@private
---@param x number
---@param y number
function Vector2:Constructor(x, y)
    
    self.x = type(x) == "number" and math.round(x, 2) or 0.0;
    self.y = type(y) == "number" and math.round(y, 2) or 0.0;

    local metatable = getmetatable(self);
    metatable.__tostring = function()
        return ('Vector2(%s, %s)'):format(self.x, self.y);
    end

end

---@param vector2 Vector2
---@return number
function Vector2:Distance(vector2)
    return math.sqrt(math.pow(self.x - vector2.x, 2) + math.pow(self.y - vector2.y, 2));
end

---@param vector2 Vector2
---@return boolean
function Vector2:Equal(vector2)
    return self.x == vector2.x and self.y == vector2.y;
end

---@param vector2 Vector2
---@return Vector2
function Vector2:Subtract(vector2)
    return Vector2(self.x - vector2.x, self.y - vector2.y);
end

return Vector2;