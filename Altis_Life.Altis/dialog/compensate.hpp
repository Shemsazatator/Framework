class Life_Admin_Compensate {
    idd = IDD_COMPENSATE;
    name= "life_admin_compensate_give";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "[] spawn {waitUntil {!isNull (findDisplay IDD_COMPENSATE)}; ((findDisplay IDD_COMPENSATE) displayCtrl IDC_COMPENSATE_INFOMSG) ctrlSetText localize ""STR_Admin_Amount""};";

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
            idc = IDC_COMPENSATE_INFOMSG;
            sizeEx = 0.020;
            text = "";
            x = 0.1;
            y = 0.25;
            w = 0.5;
            h = 0.11;
        };

        class Title: Life_RscTitle {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "$STR_Admin_Compensate";
            x = 0.1;
            y = 0.2;
            w = 0.5;
            h = (1 / 25);
        };

        class AdminCloseComp: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Global_Close";
            onButtonClick = "closeDialog 0;";
            x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.5 - (1 / 25);
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class AdminCompensVer: Life_RscButtonMenu {
            idc = -1;
            text = "$STR_Admin_Compensate";
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
            onButtonClick = "[] spawn life_fnc_adminCompensate;";
            x = 0.27;
            y = 0.40;
            w = (6.25 / 40);
            h = (1 / 25);
        };

        class AdminCompensTex: Life_RscEdit {
            idc = IDC_COMPENSATE_ADMINCOMPENSTEX;
            text = "";
            x = 0.04 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
            y = 0.35;
            w = (13 / 40);
            h = (1 / 25);
        };
    };
};
