--[[
----
----Created Date: 11:24 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [Color]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Color: BaseObject
---@field public r number
---@field public g number
---@field public b number
---@field public a number
---@overload fun(r: number, g: number, b: number, a: number): Color
Color = Class.new 'Color';

---@private
---@param r number
---@param g number
---@param b number
---@param a number
function Color:Constructor(r, g, b, a)

    self.r = r;
    self.g = g;
    self.b = b;
    self.a = a;

end

return Color;