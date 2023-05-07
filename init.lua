--[[
----
----Created Date: 11:39 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [import]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

ENV = {};
ENV.lib_name = 'jClassLib';
ENV.DEBUG = GetConvar('jClassLib_DEBUG', 'false') == 'true';
ENV.name = GetCurrentResourceName();
ENV.IS_SERVER = IsDuplicityVersion();
ENV.ESX_NAME = "es_extended";
ENV.ESX = GetResourceState(ENV.ESX_NAME) == "started";

local Errors = {

    resource_missing = "^1Error: %s is missing^0",
    resource_not_started = "^1Error: %s must be started before ^5%s^0",
    resource_bad_type = "^1Error importing module (%s): Invalid type^0",
    resource_bad_format = "^1Error importing module (%s): Invalid format^0",
    resource_bad_module = "^1Error importing module (%s): %s^0",

};

local state = GetResourceState(ENV.lib_name);

if (state == "missing") then
    return error((Errors.resource_missing):format(ENV.lib_name), 3);
end

if (state ~= "started") then
    return error((Errors.resource_not_started):format(ENV.lib_name, ENV.name), 3);
end

---@param file string
---@param name string
---@param resource string
---@return any
local function load_file(file, name, resource)
    local fn, err = load(file, ('@@%s/%s'):format(resource, name))

    if (fn == nil or type(err) == "string") then
        return error((Errors.resource_bad_module):format(name, err), 3);
    end

    return fn();
end

---@param modname string
---@param resourceName string
---@return boolean
local function HandleModTable(modname, resourceName)
    if (type(modname) == "table") then
        for i = 1, #modname do
            ENV.require(modname[i], resourceName);
        end
        return true;
    end
    return false;
end

---@param modname string
---@return boolean
local function IsModLua(modname)

    if (type(modname) ~= "string") then
        error((Errors.resource_bad_type):format(tostring(modname)), 3);
        return false;
    end

    if (not modname:find(".lua")) then
        error((Errors.resource_bad_format):format(modname), 3)
        return false;
    end
    return true;
end

---@param modname string | table
---@param resource string
---@return any
function ENV.require(modname, resource)

    local _resource = type(resource) == "string" and resource or ENV.lib_name;

    if (HandleModTable(modname, _resource)) then return; end
    if (not IsModLua(modname)) then return; end

    local file = LoadResourceFile(_resource, modname);

    if (file == nil) then return (function() end)(); end

    if (ENV.DEBUG) then

        if (type(console) == "table") then
            console.debug("^7(^3" .. ENV.lib_name .. "^7) ^0=> importing: ^1" .. modname .. "^0 in resource: ^7(^1" .. ENV.name .. "^7)^0");
        end

    end

    return load_file(file, modname, _resource);

end

ENV.require("imports/init.lua", ENV.lib_name);