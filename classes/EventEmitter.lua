--[[
----
----Created Date: 2:49 Friday May 5th 2023
----Author: JustGod
----Made with ❤
----
----File: [EventEmitter]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class EventEmitter: BaseObject
---@field public events table<string, table<number, fun(...: vararg)>>
EventEmitter = Class.new 'EventEmitter';

function EventEmitter:Constructor()
    self.events = {};
end

---@param eventName string
---@param callback fun(...: vararg)
---@return table
function EventEmitter:Register(eventName, callback)
    
    if (type(eventName) ~= "string") then
        return error("EventEmitter:Register(): Invalid event name", 3);
    end

    if (type(callback) ~= "function") then
        return error("EventEmitter:Register(): Invalid event callback", 3);
    end

    if (not self.events[eventName]) then
        self.events[eventName] = {};
    end

    local id = #self.events[eventName] + 1;
    self.events[eventName][id] = function(...) 

        local args = {...};

        CreateThread(function()

            if (type(callback) == "function") then 

                local success, result = pcall(callback, table.unpack(args));

                if not (success) then
                    error(("An error occured when executing event ^7(^4%s^7)^0, stack: ^7(^1%s^7)"):format(eventName, result), 3);
                end

            else
                error(("An error occured when executing event ^7(^4%s^7)^0, stack: ^7(^1%s^7)"):format(eventName, "Callback is not a function"), 3);
            end 
            
        end);

    end;

    return {
        name = eventName,
        id = id
    };

end

---@param eventName string
---@vararg any
function EventEmitter:Trigger(eventName, ...)
    
    if (type(eventName) ~= "string") then
        return error("EventEmitter:Trigger(): Invalid event name", 3);
    end

    if (self.events[eventName]) then
        for i = 1, #self.events[eventName] do
            self.events[eventName][i](...);
        end
    end

end

---@param eventData table
function EventEmitter:UnRegister(eventData)
        
    if (type(eventData) ~= "table") then
        return error("EventEmitter:UnRegister(): Invalid eventHandler", 3);
    end

    if (self.events[eventData.name]) then
        self.events[eventData.name][eventData.id] = nil;
    end

end

return EventEmitter;