--[[
----
----Created Date: 10:47 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [class]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local cache = {};

---@class BaseObject
---@field private Constructor fun(): BaseObject
---@field private super fun(class: string, ...: any): BaseObject

BaseObject = setmetatable({}, {
    __name = "BaseObject";
    __type = "class";
    __call = function(self, ...)
        return self:new(...);
    end
});

cache["BaseObject"] = BaseObject;

---@param name string
---@return BaseObject
local function require_class(name)
    return cache[name];
end

---@param class BaseObject
---@return BaseObject | nil
local function class_super(class)
	local metatable = getmetatable(class);
	local metaSuper = metatable.__super;
	if (metaSuper) then
		return metaSuper;
	end
	return nil;
end

---@param class BaseObject
---@return table
local function class_build(class)
	
    assert(class, "Attempt to build from an invalid class");

    local metatable = getmetatable(class);
    assert(metatable, "Attempt to build from an invalid class");

    local super = class_super(class);

    return setmetatable({}, {
        __index = class;
        __super = super;
        __newindex = metatable.__newindex;
        --__call = metatable.__call; -- Remove because we don't want to create a new instance from an instance
        __len = metatable.__len;
        __unm = metatable.__unm;
        __add = metatable.__add;
        __sub = metatable.__sub;
        __mul = metatable.__mul;
        __div = metatable.__div;
        __pow = metatable.__pow;
        __concat = metatable.__concat;
        __type = metatable.__new_type;
        __name = metatable.__name;
    });

end

---@param class BaseObject
---@vararg
---@return BaseObject
local function class_instance(class, ...)

	if (class) then

		local instance = class_build(class);

		if (type(class["Constructor"]) == "function") then

			local constructor = class["Constructor"](instance, ...);

			if (type(constructor) == "table") then
				return constructor;
			end

		end

		return instance;

	end

end

---@param name string
---@param fromClass string
---@return BaseObject
local function class_prepare(name, fromClass)

    local _class = type(fromClass) == "string" and cache[fromClass] or fromClass;

    assert(_class, "Attempt to extends from an invalid class");

    local metatable = getmetatable(_class);

    cache[name] = setmetatable({}, {
        __index = _class;
        __super = _class;
        __newindex = metatable.__newindex;
        __call = metatable.__call;
        __len = metatable.__len;
        __unm = metatable.__unm;
        __add = metatable.__add;
        __sub = metatable.__sub;
        __mul = metatable.__mul;
        __div = metatable.__div;
        __pow = metatable.__pow;
        __concat = metatable.__concat;
        __type = "class";
        __new_type = "instance";
        __name = name;
    });

    return cache[name];

end

---@param name string
---@return BaseObject
local function class_singleton(name)

    local metatable = getmetatable(BaseObject);

    cache[name] = setmetatable({}, {
        __index = BaseObject;
        __super = BaseObject;
        __newindex = metatable.__newindex;
        __call = metatable.__call;
        __len = metatable.__len;
        __unm = metatable.__unm;
        __add = metatable.__add;
        __sub = metatable.__sub;
        __mul = metatable.__mul;
        __div = metatable.__div;
        __pow = metatable.__pow;
        __concat = metatable.__concat;
        __type = "class";
        __new_type = "singleton";
        __name = name;
    })();

    return cache[name];

end

---@param name string
---@return BaseObject
local function class_new(name)
	return class_prepare(name, BaseObject);
end

---@param name string
---@param fromClass string | BaseObject
---@return BaseObject
local function class_extends(name, fromClass)
    return class_prepare(name, fromClass);
end

---@class Class
Class = {};

Class.extends = class_extends;
Class.singleton = class_singleton;
Class.new = class_new;
Class.require = require_class;

--BASE OBJECT

---@private
---@return BaseObject
function BaseObject:new(...)
    return class_instance(self, ...);
end

---@param class? BaseObject
---@vararg any
function BaseObject:super(class, ...)

    local metatable = getmetatable(self);
    local _class = metatable.__super;

    if (type(class) == "table") then _class = class; end

    assert(_class, "BaseObject:super(): Class not found");

    if (type(_class["Constructor"]) == "function") then
        return _class["Constructor"](self, ...);
    end

    return nil;

end

---@private
---@param parentClass? BaseObject
---@param methodName string
---@vararg any
---@return any
function BaseObject:CallParentMethod(parentClass, methodName, ...)

    local metatable = getmetatable(self);
    local _class = metatable.__super;

    if (type(parentClass) == "table") then _class = parentClass; end
    assert(_class, "BaseObject:CallParentMethod(): Class not found");

    if (type(_class[methodName]) == "function") then
        return _class[methodName](self, ...);
    end

    return nil;

end

---@private
---@param key string
---@param value any
function BaseObject:SetValue(key, value)
    if (string.sub(key, 1, 2) ~= "__") then
        self[key] = value;
    end
end

---@private
---@param key string
---@return any
function BaseObject:GetValue(key)
    if (string.sub(key, 1, 2) ~= "__") then
        return self[key];
    end
end

---@param class_name string
---@return boolean
function BaseObject:IsInstanceOf(class_name)

    if(type(cache[class_name]) ~= "table") then return false; end
    local class_metatable = cache[class_name]:GetMetatable();

    local class_name = class_metatable and class_metatable.__name or nil;
    if (not class_name) then return false; end

    local metatable = getmetatable(self);
    local name = metatable and metatable.__name or nil;

    return name ~= nil and class_name == name or false;

end

---@private
---@return table
function BaseObject:GetMetatable()
    return getmetatable(self);
end