#define ST_CENTER         0x02
/*
    Author: Daniel Stuart

    File: hud_stats.hpp
*/

class playerHUD {
    idd = -1;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
        Life_RscBackground_HUD,
        Life_RscProgress_HUDNotorietyPrestige,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
        Life_RscProgress_HUDExperience,
        Life_RscText_HUDNotorietyPrestige,
        Life_RscText_HUDFood,
        Life_RscText_HUDHealth,
        Life_RscText_HUDWater,
        Life_RscText_HUDExperience
    };

    /* Background */
    class Life_RscBackground_HUD: Life_RscBackground {
        colorBackground[] = {0,0,0,0.35};
        x = 0.264815 * safezoneW + safezoneX;
        y = 0.966667 * safezoneH + safezoneY;
        w = 0.470371 * safezoneW;
        h = 0.0333333 * safezoneH;
    };

    /* Progress Bars */
    class LIFE_RscProgress_HUDCommon: Life_RscProgress {
        colorFrame[] = {0, 0, 0, 0.8};
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscProgress_HUDNotorietyPrestige: LIFE_RscProgress_HUDCommon {
        idc = IDC_HUDSTATS_PROGRESSNOTOPREST;
        colorBar[] = {"( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", 0.65};
        x = 0.27111 * safezoneW + safezoneX;
        w = 0.1355928 * safezoneW;
    };

    class Life_RscProgress_HUDFood: LIFE_RscProgress_HUDCommon {
        idc = IDC_HUDSTATS_PROGRESSFOOD;
        colorBar[] = {0,0.50,0,0.65};
        x = 0.418981 * safezoneW + safezoneX;
    };

    class Life_RscProgress_HUDHealth: LIFE_RscProgress_HUDCommon {
        idc = IDC_HUDSTATS_PROGRESSHEALTH;
        colorBar[] = {0.85,0.05,0,0.65};
        x = 0.476852 * safezoneW + safezoneX;
    };

    class Life_RscProgress_HUDWater: LIFE_RscProgress_HUDCommon {
        idc = IDC_HUDSTATS_PROGRESSWATER;
        colorBar[] = {0,0.25,0.65,0.65};
        x = 0.534723 * safezoneW + safezoneX;
    };

    class Life_RscProgress_HUDExperience: LIFE_RscProgress_HUDCommon {
        idc = IDC_HUDSTATS_PROGRESSEXPERIENCE;
        colorBar[] = {"( profilenamespace getVariable [ 'GUI_BCG_RGB_R', 0.77 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_G', 0.51 ] )", "( profilenamespace getVariable [ 'GUI_BCG_RGB_B', 0.08 ] )", 0.65};
        x = 0.592594 * safezoneW + safezoneX;
        w = 0.1355928 * safezoneW;
    };

    /* Texts */
    class Life_RscText_HUDCommon: Life_RscText {
        SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
        style = ST_CENTER;
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscText_HUDNotorietyPrestige: Life_RscText_HUDCommon {
        idc = IDC_HUDSTATS_TEXTNOTOPREST;
        x = 0.27111 * safezoneW + safezoneX;
        w = 0.1355928 * safezoneW;
    };

    class Life_RscText_HUDFood: Life_RscText_HUDCommon {
        idc = IDC_HUDSTATS_TEXTFOOD;
        text = "$STR_HUD_Food";
        x = 0.418981 * safezoneW + safezoneX;
    };

    class Life_RscText_HUDHealth: Life_RscText_HUDCommon {
        idc = IDC_HUDSTATS_TEXTHEALTH;
        text = "$STR_HUD_Health";
        x = 0.476852 * safezoneW + safezoneX;
    };

    class Life_RscText_HUDWater: Life_RscText_HUDCommon {
        idc = IDC_HUDSTATS_TEXTWATER;
        text = "$STR_HUD_Water";
        x = 0.534723 * safezoneW + safezoneX;
    };

    class Life_RscText_HUDExperience: Life_RscText_HUDCommon {
        idc = IDC_HUDSTATS_TEXTEXPERIENCE;
        x = 0.592594 * safezoneW + safezoneX;
        w = 0.1355928 * safezoneW;
    };
};
