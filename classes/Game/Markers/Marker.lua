--[[
----
----Created Date: 10:55 Thursday May 4th 2023
----Author: JustGod
----Made with ❤
----
----File: [Marker]
----
----Copyright (c) 2023 JustGodWork, All Rights Reserved.
----This file is part of JustGodWork project.
----Unauthorized using, copying, modifying and/or distributing of this file
----via any medium is strictly prohibited. This code is confidential.
----
--]]

local _DrawMarker = DrawMarker;

---@class Marker: BaseObject
---@field public id number
---@field public type eMarkerType
---@field public position Vector3
---@field public direction Direction
---@field public rotation Rotation
---@field public scale Scale
---@field public color Color
---@field public bobUpAndDown boolean
---@field public faceCamera boolean
---@field private p19 number
---@field public rotate boolean
---@field public textureDict string
---@field public textureName string
---@field public drawOnEnts boolean
---@overload fun(eMarkerType: eMarkerType, position: Vector3, direction: Direction, rotation: Rotation, scale: Scale, color: Color, bobUpAndDown: boolean, faceCamera: boolean, rotate: boolean, textureDict: string, textureName: string, drawOnEnts: boolean): Marker
Marker = Class.new 'Marker';

---@private
---@param eMarkerType eMarkerType
---@param position Vector3
---@param direction Direction
---@param rotation Rotation
---@param scale Scale
---@param color Color
---@param bobUpAndDown boolean
---@param faceCamera boolean
---@param rotate boolean
---@param textureDict string
---@param textureName string
---@param drawOnEnts boolean
function Marker:Constructor(eMarkerType, position, direction, rotation, scale, color, bobUpAndDown, faceCamera, rotate, textureDict, textureName, drawOnEnts)

    self.id = -1;
    self.type = eMarkerType;
    self.position = position;
    self.direction = direction;
    self.rotation = rotation;
    self.scale = scale;
    self.color = color;
    self.bobUpAndDown = bobUpAndDown;
    self.faceCamera = faceCamera;
    self.p19 = 2;
    self.rotate = rotate;
    self.textureDict = textureDict;
    self.textureName = textureName;
    self.drawOnEnts = drawOnEnts;

end

---@param eMarkerType eMarkerType
function Marker:SetType(eMarkerType)
    self.type = eMarkerType;
    return self;
end

---@param position Vector3
function Marker:SetPosition(position)
    self.position = position;
    return self;
end

---@param direction Direction
function Marker:SetDirection(direction)
    self.direction = direction;
    return self;
end

---@param rotation Rotation
function Marker:SetRotation(rotation)
    self.rotation = rotation;
    return self;
end

---@param scale Scale
function Marker:SetScale(scale)
    self.scale = scale;
    return self;
end

---@param color Color
function Marker:SetColor(color)
    self.color = color;
    return self;
end

---@param bobUpAndDown boolean
function Marker:SetBobUpAndDown(bobUpAndDown)
    self.bobUpAndDown = bobUpAndDown;
    return self;
end

---@param faceCamera boolean
function Marker:SetFaceCamera(faceCamera)
    self.faceCamera = faceCamera;
    return self;
end

---@param rotate boolean
function Marker:SetRotate(rotate)
    self.rotate = rotate;
    return self;
end

---@param textureDict string
function Marker:SetTextureDict(textureDict)
    self.textureDict = textureDict;
    return self;
end

---@param textureName string
function Marker:SetTextureName(textureName)
    self.textureName = textureName;
    return self;
end

---@param drawOnEnts boolean
function Marker:SetDrawOnEnts(drawOnEnts)
    self.drawOnEnts = drawOnEnts;
    return self;
end

---Draw the marker with the current settings
function Marker:Draw()
    _DrawMarker(
        
        self.type, 
        self.position.x, 
        self.position.y, 
        self.position.z, 
        self.direction.x, 
        self.direction.y, 
        self.direction.z, 
        self.rotation.x, 
        self.rotation.y, 
        self.rotation.z, 
        self.scale.x, 
        self.scale.y, 
        self.scale.z, 
        self.color.r, 
        self.color.g, 
        self.color.b, 
        self.color.a, 
        self.bobUpAndDown, 
        self.faceCamera, 
        self.p19, 
        self.rotate, 
        self.textureDict, 
        self.textureName, 
        self.drawOnEnts

    );
end

return Marker;