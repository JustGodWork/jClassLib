--[[
----
----Created Date: 4:54 Sunday May 7th 2023
----Author: JustGod
----Made with ❤
----
----File: [init]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

ENV.require('imports/console.lua', ENV.lib_name);

if (ENV.ESX) then
    ENV.require('imports.lua', ENV.ESX_NAME);
end

ENV.require({ 

    'imports/index.lua',
    
    'imports/utils/kvp.lua',
    'imports/utils/math.lua',
    'imports/utils/string.lua',
    'imports/utils/table.lua',

    'imports/uuid.lua',
    'imports/Value.lua',
    'imports/class.lua',
    'imports/ESX.lua',

}, ENV.lib_name);

ENV.require({

    'enums/eEvents.lua',
    'enums/eError.lua',
    'enums/eMarkerType.lua',
    'enums/eBlipSprite.lua',
    'enums/eBlipColor.lua',
    'enums/eControlKey.lua',
    'enums/eMenuAlignment.lua',

}, ENV.lib_name);

ENV.require({

    'classes/Game/Vectors/Vector2.lua',
    'classes/Game/Vectors/Vector3.lua',
    'classes/Game/Vectors/Vector4.lua',
    'classes/Game/Vectors/Rotation.lua',
    'classes/Game/Vectors/Direction.lua',
    'classes/Game/Markers/Marker.lua',
    'classes/Game/Markers/MarkerCircle.lua',

    'classes/EventEmitter.lua',
    'classes/Color.lua',
    'classes/Scale.lua',

}, ENV.lib_name);

jCLib.events = EventEmitter();