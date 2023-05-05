--[[
----
----Created Date: 3:18 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [math]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@param number number
---@param decimals number
---@return number
function math.round(number, decimals)
    local power = 10 ^ decimals;
    return math.floor(number * power + 0.5) / power;
end

return math;