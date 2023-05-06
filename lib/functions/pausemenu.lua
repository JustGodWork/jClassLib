--[[
----
----Created Date: 4:59 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [pausemenu]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

jLib.PauseMenu = {};

---@param callback fun(is_active: boolean)
function jLib.PauseMenu.StateChange(callback)
    return AddEventHandler(eEvents.Game.PauseMenuToggle, callback);
end