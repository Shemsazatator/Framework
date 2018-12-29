#include "..\..\script_macros.hpp"
/*
    File: fn_chopShopSelection.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Displays the pricing for the currently selected vehicle.
*/
disableSerialization;
private _control = param [0,controlNull,[controlNull]];
private _selection = param [1,-1,[0]];

//Error checks
if (isNull _control or _selection isEqualTo -1) exitWith {};

private _price = CONTROL_VALUEI(_control,_selection);

private _priceTag = CONTROL(IDD_CHOPSHOPMENU,IDC_CHOPSHOPMENU_PRICEINFO);
_priceTag ctrlSetStructuredText parseText format ["<t size='0.8'>" +(localize "STR_GNOTF_Price")+ "<t color='#8cff9b'>$%1</t></t>",[(_price)] call life_fnc_numberText];
