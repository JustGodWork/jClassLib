--[[
----
----Created Date: 5:23 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [Rotation]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Rotation: Vector3
---@field public x number
---@field public y number
---@field public z number
---@overload fun(x: number, y: number, z: number): Rotation
---@overload fun(): Rotation: Vector3
Rotation = Class.extends('Rotation', 'Vector3');

---@private
---@param x number
---@param y number
---@param z number
function Rotation:Constructor(x, y, z)
    self:super('Vector3', x, y, z);

    local metatable = getmetatable(self);
    metatable.__tostring = function()
        return ('Rotation(%s, %s, %s)'):format(self.x, self.y, self.z);
    end

end

return Rotation;