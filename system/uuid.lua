--[[
----
----Created Date: 12:32 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [uuid]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@return string
function uuid()

    ---@type string
    local template ='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx';
    return string.gsub(template, '[xy]', function (c)
        ---@type number
        local v = (c == 'x') and math.random(0, 0xf) or math.random(8, 0xb);
        return string.format('%x', v);
    end);

end