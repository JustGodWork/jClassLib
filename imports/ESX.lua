--[[
----
----Created Date: 4:52 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [ESX]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

if (ENV.ESX) then

    if (not ENV.IS_SERVER) then

        if (ENV.DEBUG) then
            if (console) then
                console.debug("^7(^3" .. ENV.lib_name .. "^7) ^0=> Creating ESX ^7(^2CLIENT^7)^0 event handlers^0 in resource: ^7(^1" .. ENV.name .. "^7)^0");
            end
        end

        if (type(ESX.GetPlayerData()) == "table") then
            ESX.PlayerData = ESX.GetPlayerData();
        end

    end

end