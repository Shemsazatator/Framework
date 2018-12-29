#include "..\..\script_macros.hpp"
/*
    File: fn_ticketPrompt
    Author: Bryan "Tonic" Boardwine

    Description:
    Prompts the player that he is being ticketed.
*/
if (!isNull (findDisplay IDD_TICKETPAYMENU)) exitWith {}; //Already at the ticket menu, block for abuse?
private _cop = _this select 0;
if (isNull _cop) exitWith {};
private _val = _this select 1;

createDialog "life_ticket_pay";
disableSerialization;
waitUntil {!isNull (findDisplay IDD_TICKETPAYMENU)};

life_ticket_paid = false;
life_ticket_val = _val;
life_ticket_cop = _cop;
CONTROL(IDD_TICKETPAYMENU,IDC_TICKETPAYMENU_INFOMSG) ctrlSetStructuredText parseText format ["<t align='center'><t size='.8px'>" +(localize "STR_Cop_Ticket_GUI_Given"),_cop getVariable ["realname",name _cop],_val];

[] spawn {
    disableSerialization;
    waitUntil {life_ticket_paid or (isNull (findDisplay IDD_TICKETPAYMENU))};
    if (isNull (findDisplay IDD_TICKETPAYMENU) and !life_ticket_paid) then {
        [0,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",west];
        [1,"STR_Cop_Ticket_Refuse",true,[profileName]] remoteExecCall ["life_fnc_broadcast",life_ticket_cop];
    };
};
