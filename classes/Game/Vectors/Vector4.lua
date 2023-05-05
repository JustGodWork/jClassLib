--[[
----
----Created Date: 3:59 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [Vector4]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Vector4: BaseObject
---@field x number
---@field y number
---@field z number
---@field w number
---@overload fun(x: number, y: number, z: number, w: number): Vector4
---@overload fun(): Vector4
Vector4 = Class.new 'Vector4';

---@private
---@param x number
---@param y number
---@param z number
---@param w number
function Vector4:Constructor(x, y, z, w)
    
    self.x = type(x) == "number" and math.round(x, 2) or 0.0;
    self.y = type(y) == "number" and math.round(y, 2) or 0.0;
    self.z = type(z) == "number" and math.round(z, 2) or 0.0;
    self.w = type(w) == "number" and math.round(w, 2) or 0.0;

    local metatable = getmetatable(self);
    metatable.__tostring = function()
        return ('Vector4(%s, %s, %s, %s)'):format(self.x, self.y, self.z, self.w);
    end

end

---@param vector4 Vector4
---@return number
function Vector4:Distance(vector4)
    return math.sqrt(math.pow(self.x - vector4.x, 2) + math.pow(self.y - vector4.y, 2) + math.pow(self.z - vector4.z, 2) + math.pow(self.w - vector4.w, 2));
end

---@param vector4 Vector4
---@return boolean
function Vector4:Equal(vector4)
    return self.x == vector4.x and self.y == vector4.y and self.z == vector4.z and self.w == vector4.w;
end

---@param vector4 Vector4
---@return Vector4
function Vector4:Subtract(vector4)
    return Vector4(self.x - vector4.x, self.y - vector4.y, self.z - vector4.z, self.w - vector4.w);
end

return Vector4;