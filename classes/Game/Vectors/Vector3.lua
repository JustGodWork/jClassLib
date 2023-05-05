--[[
----
----Created Date: 3:59 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [Vector3]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Vector3: BaseObject
---@field x number
---@field y number
---@field z number
---@overload fun(x: number, y: number, z: number): Vector3
---@overload fun(): Vector3
Vector3 = Class.new 'Vector3';

---@private
---@param x number
---@param y number
---@param z number
function Vector3:Constructor(x, y, z)

    self.x = type(x) == "number" and math.round(x, 2) or 0.0;
    self.y = type(y) == "number" and math.round(y, 2) or 0.0;
    self.z = type(z) == "number" and math.round(z, 2) or 0.0;

    local metatable = getmetatable(self);
    metatable.__tostring = function()
        return ('Vector3(%s, %s, %s)'):format(self.x, self.y, self.z);
    end

end

---@param vector3 Vector3
---@return number
function Vector3:Distance(vector3)
    return math.sqrt(math.pow(self.x - vector3.x, 2) + math.pow(self.y - vector3.y, 2) + math.pow(self.z - vector3.z, 2));
end

---@param vector3 Vector3
---@return boolean
function Vector3:Equal(vector3)
    return self.x == vector3.x and self.y == vector3.y and self.z == vector3.z;
end

---@param vector3 Vector3
---@return Vector3
function Vector3:Subtract(vector3)
    return Vector3(self.x - vector3.x, self.y - vector3.y, self.z - vector3.z);
end

return Vector3;