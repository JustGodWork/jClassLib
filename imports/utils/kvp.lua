--[[
----
----Created Date: 3:55 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [kvp]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

jCLib.KVP = {};
local prefix = "jCLib_";

---@param valueType string
---@param key string
---@return string
local function FormatKey(valueType, key)
    return ("%s%s:%s"):format(prefix, valueType, key);
end

---@param key string
---@return boolean
function jCLib.KVP.ExistString(key)
    local _kvp = GetResourceKvpString(FormatKey("string", key));
    return _kvp ~= nil and _kvp ~= "";
end

---@param key string
---@return boolean
function jCLib.KVP.ExistInt(key)
    local _kvp = GetResourceKvpInt(FormatKey("int", key));
    return _kvp ~= nil;
end

---@param key string
---@return boolean
function jCLib.KVP.ExistBool(key)
    local _kvp = GetResourceKvpString(FormatKey("bool", key));
    return _kvp ~= nil and _kvp ~= "";
end

---@param key string
---@return boolean
function jCLib.KVP.ExistTable(key)
    local _kvp = GetResourceKvpString(FormatKey("table", key));
    return _kvp ~= nil;
end

---@param key string
---@param value any
---@return any
function jCLib.KVP.Set(key, value)

    if (type(value) == "string") then
        SetResourceKvp(FormatKey("string", key), value);
    elseif (type(value) == "number") then
        SetResourceKvpInt(FormatKey("int", key), value);
    elseif (type(value) == "boolean") then
        SetResourceKvp(FormatKey("bool", key), tostring(value));
    elseif (type(value) == "table") then
        SetResourceKvp(FormatKey("table", key), json.encode(value));
    end

end

---@param key string
---@return string
function jCLib.KVP.GetString(key)
    local _exist = jCLib.KVP.ExistString(key);
    return _exist and GetResourceKvpString(FormatKey("string", key)) or "";
end

---@param key string
---@return number
function jCLib.KVP.GetInt(key)
    return GetResourceKvpInt(FormatKey("int", key));
end

---@param key string
---@return boolean
function jCLib.KVP.GetBool(key)
    return GetResourceKvpString(FormatKey("bool", key)) == "true";
end

---@param key string
---@return table
function jCLib.KVP.GetTable(key)
    local _exist = jCLib.KVP.ExistTable(key);
    return _exist and json.decode(GetResourceKvpString(FormatKey("table", key))) or {};
end

---@param key string
function jCLib.KVP.DeleteString(key)
    local _exist = jCLib.KVP.ExistString(key);
    if (_exist) then
        DeleteResourceKvp(FormatKey("string", key));
    end
end

---@param key string
function jCLib.KVP.DeleteInt(key)
    local _exist = jCLib.KVP.ExistInt(key);
    if (_exist) then
        DeleteResourceKvp(FormatKey("int", key));
    end
end

---@param key string
function jCLib.KVP.DeleteBool(key)
    local _exist = jCLib.KVP.ExistBool(key);
    if (_exist) then
        DeleteResourceKvp(FormatKey("bool", key));
    end
end

---@param key string
function jCLib.KVP.DeleteTable(key)
    local _exist = jCLib.KVP.ExistTable(key);
    if (_exist) then
        DeleteResourceKvp(FormatKey("table", key));
    end
end

---@param key string
function jCLib.KVP.DeleteMatching(key)
    jCLib.KVP.DeleteString(key);
    jCLib.KVP.DeleteInt(key);
    jCLib.KVP.DeleteBool(key);
    jCLib.KVP.DeleteTable(key);
end