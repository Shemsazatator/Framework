#include "..\..\script_macros.hpp"
/*
    File: fn_settingsMenu
    Author: Bryan "Tonic" Boardwine

    Description:
    Setup the settings menu.
*/
if (isNull (findDisplay IDD_SETTINGMENU)) then {
    if (!createDialog "SettingsMenu") exitWith {hint localize "STR_NOTF_menuWillNotOpen";};
};

disableSerialization;

ctrlSetText[IDC_SETTINGMENU_VDONFOOTVALUE, format ["%1", life_settings_viewDistanceFoot]];
ctrlSetText[IDC_SETTINGMENU_VDCARSVALUE, format ["%1", life_settings_viewDistanceCar]];
ctrlSetText[IDC_SETTINGMENU_VDAIRVALUE, format ["%1", life_settings_viewDistanceAir]];

/* Set up the sliders */
{
    slidersetRange [(_x select 0),100,8000];
    CONTROL(IDD_SETTINGMENU,(_x select 0)) sliderSetSpeed [100,100,100];
    sliderSetPosition [(_x select 0),(_x select 1)];
} forEach [[IDC_SETTINGMENU_VDONFOOTSLIDER,life_settings_viewDistanceFoot],[IDC_SETTINGMENU_VDCARSLIDER,life_settings_viewDistanceCar],[IDC_SETTINGMENU_VDAIRSLIDER,life_settings_viewDistanceAir]];


if (isNil "life_settings_revealObjects") then {
    life_settings_enableNewsBroadcast = profileNamespace setVariable ["life_enableNewsBroadcast",true];
    life_settings_enableSidechannel = profileNamespace setVariable ["life_enableSidechannel",true];
    life_settings_tagson = profileNamespace setVariable ["life_settings_tagson",true];
    life_settings_revealObjects = profileNamespace setVariable ["life_settings_revealObjects",true];
};

CONTROL(IDD_SETTINGMENU,IDC_SETTINGMENU_SIDECHATONOFF) cbSetChecked life_settings_enableSidechannel;
CONTROL(IDD_SETTINGMENU,IDC_SETTINGMENU_BROADCASTONOFF) cbSetChecked life_settings_enableNewsBroadcast;
CONTROL(IDD_SETTINGMENU,IDC_SETTINGMENU_PLAYERTAGSONOFF) cbSetChecked life_settings_tagson;
CONTROL(IDD_SETTINGMENU,IDC_SETTINGMENU_REVEALONOFF) cbSetChecked life_settings_revealObjects;
