------------------------------------------------------------------------------------------
-- Init file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Plugin's name --
------------------------------------------------------------------------------------------
pluginName = "AnimalerieV2";
------------------------------------------------------------------------------------------
-- datascope for account save --
------------------------------------------------------------------------------------------
dataScope = Turbine.DataScope.Character;
------------------------------------------------------------------------------------------
-- File names --
------------------------------------------------------------------------------------------
settingsFileName = "AnimalerieV2_Settings";
------------------------------------------------------------------------------------------
-- Default settings --
------------------------------------------------------------------------------------------
settings = {
    PosWindow = {
        x = 500,
        y = 500
    },
    PosIcon = { 
        x = 500,
        y = 500
    },
    isMinimizeEnabled = {
        value = false
    },
    isWindowVisible = {
        value = true
    },
    isOptionsWindowVisible = {
        value = false
    },
    isHelpWindowVisible = {
        value = false
    },
    isInfoWindowVisible = {
        value = false
    },
    isToBeSurWindowVisible = {
        value = false
    },
    escEnable = {
        value = true
    },
    isLocked = {
        value = true
    },
    altEnable = {
        value = true
    },
    verbose = {
        value = false
    },
    useAleatoire = {
        value = false
    },
    useSelected = {
        value = false
    },
    -- initialize from here the shortcut datas
    shortcutData = {
        value1 = "",
        value2 = "",
        value3 = "",
        value4 = "",
        value5 = "",
        value6 = "",
        value7 = "",
        value8 = "",
        value9 = "",
        value10 = "",
        value11 = "",
        value12 = "",
        value13 = "",
        value14 = ""
    },
    shortcutType = {
        value1 = 6,
        value2 = 6,
        value3 = 6,
        value4 = 6,
        value5 = 6,
        value6 = 6,
        value7 = 6,
        value8 = 6,
        value9 = 6,
        value10 = 6,
        value11 = 6,
        value12 = 6,
        value13 = 6,
        value14 = 6
    },
    petAvailable  = {
        value1 = false,
        value2 = false,
        value3 = false,
        value4 = false,
        value5 = false,
        value6 = false,
        value7 = false,
        value8 = false,
        value9 = false,
        value10 = false,
        value11 = false,
        value12 = false,
        value13 = false,
        value14 = false,
        value15 = false,
        value16 = false,
        value17 = false,
        value18 = false,
        value19 = false,
        value20 = false,
        value21 = false,
        value22 = false,
        value23 = false,
        value24 = false,
        value25 = false,
        value26 = false,
        value27 = false,
        value28 = false,
        value29 = false,
        value30 = false,
        value31 = false,
        value32 = false,
        value33 = false,
        value34 = false,
        value35 = false,
        value36 = false,
        value37 = false,
        value38 = false,
        value39 = false,
        value40 = false,
        value41 = false,
        value42 = false,
        value43 = false
    }
};
------------------------------------------------------------------------------------------
-- Resources settings --
------------------------------------------------------------------------------------------
ResourcePath = "Homeopatix/AnimalerieV2/Resources/";

Images = {
	MinimizedIcon = ResourcePath .. "AnimalerieV2.tga"
};
------------------------------------------------------------------------------------------
-- RGB color codes --
------------------------------------------------------------------------------------------
rgb = {
    start = "<rgb=#DAA520>",
    gold = "<rgb=#FFD700>",
    orange = "<rgb=#EE8F12>",
    white = "<rgb=#FFFFFF>",
    green = "<rgb=#1FE126>",
    blue = "<rgb=#1FCDE1>",
    purple = "<rgb=#9B41CE>",
    yellow = "<rgb=#FFFF00>",
    grey = "<rgb=#C7C7BE>",
    red = "<rgb=#FF0000>",
    error = "<rgb=#FF0000>",
    clear = "</rgb>"
};
------------------------------------------------------------------------------------------
-- Load settings --
------------------------------------------------------------------------------------------
LoadSettings();