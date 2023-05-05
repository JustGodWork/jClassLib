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
ENV.DEBUG = false;
ENV.name = GetCurrentResourceName();
ENV.IS_SERVER = IsDuplicityVersion();
ENV.ESX_NAME = "es_extended";
ENV.ESX = GetResourceState(ENV.ESX_NAME) == "started";

local state = GetResourceState(ENV.lib_name);

if (state == "missing") then
    return error(('\n^1Error: %s is missing^0'):format(ENV.lib_name), 0);
end

if (state ~= "started") then
    return error(('\n^1Error: %s must be started before ^5%s^0'):format(ENV.lib_name, ENV.name), 0);
end

---@param file string
---@param name string
---@param resource string
---@return any
local function load_file(file, name, resource)
    local fn, err = load(file, ('@@%s/%s'):format(resource, name))

    if (fn == nil or type(err) == "string") then
        return error(('\n^1Error importing module (%s): %s^0'):format(name, err), 3);
    end

    return fn();
end

---@param modname string
---@param resource string
---@return any
function ENV.require(modname, resource)

    if (type(modname) == "table") then
        for i = 1, #modname do
            ENV.require(modname[i]);
        end
        return;
    end

    if (type(modname) ~= "string") then
        return error(('\n^1Error importing module (%s): Invalid type^0'):format(tostring(modname)), 3);
    end

    if (not modname:find(".lua")) then
        return error(('\n^1Error importing module (%s): Invalid format^0'):format(modname), 3);
    end

    local _resource = type(resource) == "string" and resource or ENV.lib_name;

    local file = LoadResourceFile(_resource, modname);

    if (file == nil) then return (function() end)(); end

    if (ENV.DEBUG) then
        print(("Importing %s from %s in %s"):format(modname, _resource, GetCurrentResourceName()));
    end

    return load_file(file, modname, _resource);

end

if (ENV.ESX) then

    ENV.require('imports.lua', ENV.ESX_NAME);

    if (not ENV.IS_SERVER) then

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