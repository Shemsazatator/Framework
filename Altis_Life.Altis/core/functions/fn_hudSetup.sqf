#include "..\..\script_macros.hpp"
/*
    File: fn_hudSetup.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Setups the hud for the player?
*/
disableSerialization;

cutRsc ["playerHUD", "PLAIN", 2, false];
[] call life_fnc_hudUpdate;

[] spawn {
    for "_i" from 0 to 1 step 0 do {
        private _dam = damage player;
        private _experience = life_experience;
        private _notoriety = life_notoriety;
        private _prestige = life_prestige;
        waitUntil {(damage player) != _dam or life_experience != _experience or life_notoriety != _notoriety or life_prestige != _prestige};
        [] call life_fnc_hudUpdate;
    };
};
