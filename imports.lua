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

    ["missing"] = "\n^1Error: %s is missing^0",
    ["started"] = "\n^1Error: %s must be started before ^5%s^0",
    ["bad_module"] = "\n^1Error importing module (%s): %s^0",
    ["bad_type"] = "\n^1Error importing module (%s): Invalid type^0",
    ["bad_format"] = "\n^1Error importing module (%s): Invalid format^0",

};

local state = GetResourceState(ENV.lib_name);

if (state == "missing") then
    return error((Errors["missing"]):format(ENV.lib_name), 0);
end

if (state ~= "started") then
    return error((Errors["started"]):format(ENV.lib_name, ENV.name), 0);
end

---@param file string
---@param name string
---@param resource string
---@return any
local function load_file(file, name, resource)
    local fn, err = load(file, ('@@%s/%s'):format(resource, name))

    if (fn == nil or type(err) == "string") then
        return error((Errors["bad_module"]):format(name, err), 3);
    end

    return fn();
end

---@param modname string
---@return boolean
local function HandleModTable(modname)
    if (type(modname) == "table") then
        for i = 1, #modname do
            ENV.require(modname[i]);
        end
        return true;
    end
    return false;
end

---@param modname string
---@return boolean
local function IsModLua(modname)

    if (type(modname) ~= "string") then
        error((Errors["bad_type"]):format(tostring(modname)), 3);
        return false;
    end

    if (not modname:find(".lua")) then
        error((Errors["bad_format"]):format(modname), 3)
        return false;
    end
    return true;
end

---@param modname string
---@param resource string
---@return any
function ENV.require(modname, resource)

    if (HandleModTable(modname)) then return; end
    if (not IsModLua(modname)) then return; end

    local _resource = type(resource) == "string" and resource or ENV.lib_name;

    local file = LoadResourceFile(_resource, modname);

    if (file == nil) then return (function() end)(); end

    if (ENV.DEBUG) then

        if (console) then
            console.debug("^7(^3" .. ENV.lib_name .. "^7) ^0=> importing: ^1" .. modname .. "^0 in resource: ^1" .. ENV.name .. "^0");
        end

    end

    return load_file(file, modname, _resource);

end

ENV.require 'system/console.lua';

if (ENV.ESX) then

    ENV.require('imports.lua', ENV.ESX_NAME);

    if (not ENV.IS_SERVER) then

        if (ENV.DEBUG) then
            if (console) then
                console.debug("^7(^3" .. ENV.lib_name .. "^7) ^0=> creating ESX ^7(^2CLIENT^7)^0 event handlers^0 in resource: ^1" .. ENV.name .. "^0");
            end
        end

        AddEventHandler("onResourceStart", function(resourceName) -- HOT RELOAD SUPPORT
            if (resourceName == GetCurrentResourceName()) then

                if (type(ESX.GetPlayerData()) == "table") then
                    ESX.PlayerData = ESX.GetPlayerData();
                end

            end

        end);

        RegisterNetEvent("esx:playerLoaded", function(xPlayer)

            local resource = GetInvokingResource();
            if (resource ~= nil) then return; end; -- PREVENT CHEATER CALLING THIS EVENT

            ESX.PlayerData = xPlayer;

        end);
        
        RegisterNetEvent("esx:setJob", function(job)

            local resource = GetInvokingResource();
            if (resource ~= nil) then return; end; -- PREVENT CHEATER CALLING THIS EVENT

            ESX.PlayerData.job = job;

        end);

        RegisterNetEvent("esx:setJob2", function(job2)

            local resource = GetInvokingResource();
            if (resource ~= nil) then return; end; -- PREVENT CHEATER CALLING THIS EVENT

            ESX.PlayerData.job2 = job2;

        end);

    end

end

ENV.require({ 

    'system/uuid.lua',
    'system/class.lua' 

});

ENV.require({

    'enums/eEvents.lua',
    'enums/eMarkerType.lua'

});

ENV.require({

    'classes/math.lua',

    'classes/Game/Vectors/Vector2.lua',
    'classes/Game/Vectors/Vector3.lua',
    'classes/Game/Vectors/Vector4.lua',
    'classes/Game/Vectors/Rotation.lua',
    'classes/Game/Vectors/Direction.lua',
    'classes/Game/Marker.lua',

    'classes/EventEmitter.lua',
    'classes/Color.lua',
    'classes/Scale.lua',

});