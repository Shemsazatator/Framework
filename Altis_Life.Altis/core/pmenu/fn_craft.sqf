#include "..\..\script_macros.hpp"
/*
	File: fn_craft.sqf
	Description: Crafting System
	Created by EdgeKiller
    Coder: EdgeKiller
*/
private["_inv","_itemInfo","_filter"]; //Declare all private variables
if (!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "Life_craft";
disableSerialization;

if (life_is_processing) exitWith {
	closeDialog IDD_PLAYERMENU;
	closeDialog 0;
};

_inv = CONTROL(IDD_CRAFTMENU,IDC_CRAFTMENU_CRAFTLIST); //find the listbox of items can be created
lbClear _inv; //clear the listbox

_filter = CONTROL(IDD_CRAFTMENU,IDC_CRAFTMENU_FILTERLIST);
_filter lbAdd localize "STR_CRAFT_FILTER_Weapon";
_filter lbSetData[(lbSize _filter)-1,"weapon"];
_filter lbAdd localize "STR_CRAFT_FILTER_Uniform";
_filter lbSetData[(lbSize _filter)-1,"uniform"];
_filter lbAdd localize "STR_CRAFT_FILTER_Backpack";
_filter lbSetData[(lbSize _filter)-1,"backpack"];
_filter lbAdd localize "STR_CRAFT_FILTER_Item";
_filter lbSetData[(lbSize _filter)-1,"item"];

_filter lbSetCurSel 0;
