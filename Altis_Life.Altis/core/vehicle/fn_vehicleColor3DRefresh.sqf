#include "..\..\script_macros.hpp"
/*
    File: fn_vehicleColor3DRefresh.sqf
    Author:
    Modified: NiiRoZz

    Description:
    Called when a new selection is made in the rsc box and paint the vehicle with the color selected.
*/
disableSerialization;
_colorIndex = CONTROL_VALUE(IDC_VEHICLESHOP3D_COLORLIST);
if (isNull life_3dPreview_object) exitWith {};

[life_3dPreview_object, _colorIndex] call life_fnc_colorVehicle;
