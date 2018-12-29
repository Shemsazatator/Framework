#include "..\..\script_macros.hpp"
/*
    File: fn_s_onSliderChange.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called when the slider is changed for any field and updates the view distance for it.
*/
private ["_mode","_value"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
_value = [_this,1,-1,[0]] call BIS_fnc_param;
if (_mode isEqualTo -1 or _value isEqualTo -1) exitWith {};
disableSerialization;

switch (_mode) do {
    case 0:
    {
        life_settings_viewDistanceFoot = round(_value);
        ctrlSetText[IDC_SETTINGMENU_VDONFOOTVALUE,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceFoot",round(_value)];
    };

    case 1:
    {
        life_settings_viewDistanceCar = round(_value);
        ctrlSetText[IDC_SETTINGMENU_VDCARSVALUE,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceCar",round(_value)];
    };

    case 2:
    {
        life_settings_viewDistanceAir = round(_value);
        ctrlSetText[IDC_SETTINGMENU_VDAIRVALUE,format ["%1",round(_value)]];
        [] call life_fnc_updateViewDistance;
        profileNamespace setVariable ["life_viewDistanceAir",round(_value)];
    };

    case 3: {
        _classname = CONTROL_DATA(IDC_FUELSTAT_VEHICLELIST);
        _index =  CONTROL_VALUE(IDC_FUELSTAT_VEHICLELIST);
        if ((lbCurSel IDC_FUELSTAT_VEHICLELIST) isEqualTo -1) exitWith {hint localize "STR_Select_Vehicle_Pump";};
        if (!isNil "_classname" or _classname == "") then {
            _car = (vehiclefuelList select _index) select 0;
            _vehicleInfo = [_className] call life_fnc_fetchVehInfo;
            _fuel = fuel _car;
            _fueltank = (_vehicleInfo select 12);
            if (_car isKindOf "B_Truck_01_box_F" || _car isKindOf "B_Truck_01_transport_F") then {
                _fueltank = 450;
            };
            ctrlSetText[IDC_FUELSTAT_LITERFUEL,format ["Fuel : %1 liters",round(_value) - (floor(_fuel * _fueltank))]];
            ctrlSetText [IDC_FUELSTAT_TOTALFUEL,format ["Total : $%1",round (life_fuelPrices * (round(_value) -(floor(_fuel * _fueltank)))) ]];
        } else {
            hint localize "STR_Select_Vehicle_Pump";
        };
    };

    case 4: {
        player setDir (360 - _value);
    };
};
