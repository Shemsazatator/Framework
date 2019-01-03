#include "..\..\script_macros.hpp"
/*
    File: fn_addPerkRank.sqf
    Author: Shems "Shemsazatator" Shahid

    Description:
    What happens when we clic on the upgrade button in the perk menu ?
*/
private _perk = _this select 0;

private _action = [
    format ["Are you sure to upgrade a rank of the perk : %1 ? You will be withdrawn of 1 point.",_perk],
    "Upgrade a rank",
    localize "STR_Global_Yes",
    localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if (_action) then {
  life_skillPoints = life_skillPoints - 1;
} else {
  hint localize "STR_NOTF_ActionCancel";
  closeDialog 0;
};
