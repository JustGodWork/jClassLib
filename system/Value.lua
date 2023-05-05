--[[
----
----Created Date: 12:40 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [Value]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class Value
Value = {};

Value.Types = {

    String = "string",
    Number = "number",
    Boolean = "boolean",
    Nil = "nil",
    Table = "table",
    Function = "function",
    Userdata = "userdata",
    Thread = "thread",
    LightUserdata = "lightuserdata"

};

---@param var any
---@return boolean
function Value.IsString(var)
    return type(var) == "string"
end

---@param var any
---@return boolean
function Value.IsNumber(var)
    return type(var) == "number";
end

---@param var any
---@return boolean
function Value.IsBoolean(var)
    return type(var) == "boolean";
end

---@param var any
---@return boolean
function Value.IsNil(var)
    return type(var) == nil;
end

---@param var table | string | function | boolean | number | nil
---@param varType? TypesEnum | string
function Value.IsValid(var, varType)

    if (varType) then
        return var ~= nil and type(var) == varType
    end
    return var ~= nil;

end

---@param int number
---@return boolean
function Value.IntegerToBoolean(int)
    return type(int) == "number" and int == 1 or false;
end

---@param bool boolean
---@return number
function Value.BooleanToInteger(bool)
    return type(bool) == "boolean" and bool == true and 1 or 0;
end

---@param var any
---@return boolean
function Value.HasMetatable(var)
    return Value.IsValid(var, Value.Types.Table) and Value.IsValid(getmetatable(var), Value.Types.Table);
end

---@param var any
---@return table | nil
function Value.GetMetatable(var)
    return Value.HasMetatable(var) and getmetatable(var) or nil;
end

---@param var any
---@return string | nil
function Value.GetClassName(var)
    local metatable = Value.GetMetatable(var);
    return metatable and metatable.__name or nil;
end

---@param var any
---@return boolean
function Value.IsClass(var)
    local metatable = Value.GetMetatable(var);
    return metatable and metatable.__type == "class" or false;
end

---@param var any
---@return boolean
function Value.IsInstance(var)
    local metatable = Value.GetMetatable(var);
    return metatable and metatable.__type == "instance" or false;
end

---@param var any
---@param class BaseObject | string
---@return boolean
function Value.IsInstanceOf(var, class)

    local _class = Value.IsString(class) and Class.require(class) or class;

    if (Value.IsInstance(var) and Value.IsClass(_class)) then
        return var:IsInstanceOf(Value.GetClassName(_class));
    end
    return false;

end

---@param var any
---@return boolean
function Value.IsSingleton(var)
    local metatable = Value.GetMetatable(var);
    return metatable and metatable.__type == "singleton" or false;
end

---@param callback fun(varargs: any): any
function Value.Overload(callback, methods)
    return setmetatable({}, {
        __call = function(_, ...)
            if (Value.IsValid(callback, Value.Types.Function)) then callback(...); end
        end,
        __index = function(_, key)
            assert(type(methods[key]) == "function", "Value.Overload(): Attempt to call an invalid method (" .. key .. ")");
            return methods[key];
        end

    });
end