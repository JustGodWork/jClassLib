--[[
----
----Created Date: 4:56 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [index]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local IS_SERVER = IsDuplicityVersion();

if (not IS_SERVER) then

    local IsPauseMenuActive = IsPauseMenuActive;
    local pause_active = false;

    CreateThread(function()
        while true do

            local pause_menu_active = IsPauseMenuActive();

            if (pause_menu_active and not pause_active) then

                pause_active = true;
                TriggerEvent(eEvents.Game.PauseMenuToggle, true);

            elseif (not pause_menu_active and pause_active) then

                pause_active = false;
                TriggerEvent(eEvents.Game.PauseMenuToggle, false);

            end

            Wait(750);
        end
    end);

end