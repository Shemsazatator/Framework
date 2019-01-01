class Life_My_Gang_Diag {
    idd = IDD_GANGMENU;
    name= "life_my_gang_menu";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.6;
            h = 0.6 - (22 / 250);
        };
    };

    class controls {
        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = IDC_GANGMENU_TITLE;
            text = "";
            x = 0.1;
            y = 0.2;
            w = 0.6;
            h = (1 / 25);
        };

        class GangMemberList: Life_RscListBox
        {
            idc = IDC_GANGMENU_GANGMEMBERLIST;
            text = "";
            sizeEx = 0.035;
            x = 0.11;
            y = 0.26;
            w = 0.350;
            h = 0.370;
        };

        class CloseLoadMenu: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.8 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class GangLeave: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Gang_Leave";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_gangLeave";
            x = 0.47;
            y = 0.26;
            w = (9 / 40);
            h = (1 / 25);
        };

        class GangLock: Life_RscButtonMenu {
            idc = IDC_GANGMENU_GANGLOCK;
            text = "$STR_Gang_UpgradeSlots";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_gangUpgrade";
            x = 0.47;
            y = 0.31;
            w = (9 / 40);
            h = (1 / 25);
        };

        class GangKick: Life_RscButtonMenu {
            idc = IDC_GANGMENU_GANGKICK;
            text = "$STR_Gang_Kick";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_gangKick";
            x = 0.47;
            y = 0.36;
            w = (9 / 40);
            h = (1 / 25);
        };

        class GangLeader: Life_RscButtonMenu {
            idc = IDC_GANGMENU_GANGLEADER;
            text = "$STR_Gang_SetLeader";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_gangNewLeader";
            x = 0.47;
            y = 0.41;
            w = (9 / 40);
            h = (1 / 25);
        };

        class InviteMember: GangLeader {
            idc = IDC_GANGMENU_INVITEMEMBER;
            text = "$STR_Gang_Invite_Player";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_gangInvitePlayer";
            y = .51;
        };

        class DisbandGang: InviteMember {
            idc = IDC_GANGMENU_DISABLEGANG;
            text = "$STR_Gang_Disband_Gang";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_gangDisband";
            y = .46;
        };

        class ColorList: Life_RscCombo {
            idc = IDC_GANGMENU_COLORLIST;
            x = 0.47;
            y = 0.56;
            w = (9 / 40);
            h = 0.03;
        };

        class GangBank: Title {
            idc = IDC_GANGMENU_GANGBANK;
            style = 1;
            text = "";
        };
    };
};

class Life_Create_Gang_Diag {
    idd = IDD_CREATEGANGMENU;
    name= "life_my_gang_menu_create";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn {waitUntil {!isNull (findDisplay IDD_CREATEGANGMENU)}; ((findDisplay IDD_CREATEGANGMENU) displayCtrl IDC_CREATEGANGMENU_INFOMSG) ctrlSetText format [localize ""STR_Gang_PriceTxt"",[(getNumber(missionConfigFile >> 'Life_Settings' >> 'gang_price'))] call life_fnc_numberText]};";

    class controlsBackground {
        class Life_RscTitleBackground: Life_RscText {
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
            idc = -1;
            x = 0.1;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class MainBackground: Life_RscText {
            colorBackground[] = {0, 0, 0, 0.7};
            idc = -1;
            x = 0.1;
            y = 0.2 + (11 / 250);
            w = 0.5;
            h = 0.3 - (22 / 250);
        };
    };

    class controls {
        class InfoMsg: Life_RscStructuredText {
            idc = IDC_CREATEGANGMENU_INFOMSG;
            sizeEx = 0.020;
            text = "";
            x = 0.1;
            y = 0.25;
            w = 0.5;
            h = .11;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_Gang_Title";
            x = 0.1;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class CloseLoadMenu: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;[] call life_fnc_p_updateMenu;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.5 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class GangCreateField: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Gang_Create";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] call life_fnc_createGang";
            x = 0.27;
            y = 0.40;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class CreateGangText: Life_RscEdit {
            idc = IDC_CREATEGANGMENU_CREATEGANGTEXT;
            text = "$STR_Gang_YGN";
            x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.35;
            w = (13 / 40);
            h = (1 / 25);
        };
    };
};
