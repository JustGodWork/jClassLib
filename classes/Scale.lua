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

    self.x = math.round(x, 2);
    self.y = math.round(y, 2);
    self.z = math.round(z, 2);
    
end

return Scale;