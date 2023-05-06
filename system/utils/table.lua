--[[
----
----Created Date: 8:55 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [table]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@param tbl table
---@param callback fun(key: string | number, value: any)
function table.foreach(tbl, callback)
    for key, value in pairs(tbl) do
        callback(key, value);
    end
end

---@param tbl table
---@return number
function table.sizeOf(tbl)
    local size = 0;
    for _ in pairs(tbl) do
        size = size + 1;
    end
    return size;
end

---@param tbl table
---@param callback fun(key: string | number, value: any): boolean
---@param single boolean
function table.filter(tbl, callback, single)
    local new = {};
    for key, value in pairs(tbl) do
        if (callback(key, value)) then
            if (single) then
                return value;
            else
                new[key] = value;
            end
        end
    end
    return single and nil or not single and new;
end

---@param tbl table
---@param key string | number
---@param value any
function table.set(tbl, key, value)
    tbl[key] = value;
end

---@param tbl table
---@param key string | number
---@return any
function table.get(tbl, key)
    return tbl[key];
end