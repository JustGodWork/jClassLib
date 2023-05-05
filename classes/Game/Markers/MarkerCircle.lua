--[[
----
----Created Date: 12:12 Saturday May 6th 2023
----Author: JustGod
----Made with ❤
----
----File: [MarkerCircle]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

---@class MarkerCircle: Marker
MarkerCircle = Class.extends('MarkerCircle', 'Marker');

---@private
function MarkerCircle:Constructor()
    
    self:super('Marker');
    self:SetType(eMarkerType.HorizontalCircleSkinny_Arrow);
    self:SetScale(Scale(0.5, 0.5, 0.5));
    self:SetColor(Color());
    self:SetDirection(Direction());
    self:SetRotation(Rotation());
    self:SetBobUpAndDown(false);
    self:SetFaceCamera(false);
    self:SetRotate(true);

end