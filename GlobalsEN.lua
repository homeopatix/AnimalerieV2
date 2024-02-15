------------------------------------------------------------------------------------------
-- GlobalsEN file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
_G.T = {};
------------------------------------------------------------------------------------------
-- Command text --
------------------------------------------------------------------------------------------
T[ "PluginName" ] = "AnimalerieV2";
T[ "Loaded" ] = "Loaded";
T[ "Unactivated" ] = "Unloaded";
T[ "PluginText" ] = "By Homeopatix";
T[ "PluginEscEnable" ] = "Escape Key Activated";
T[ "PluginEscDesable" ] = "Escape key deactivated";
T[ "PluginAltEnable" ] = "Alt Key Activated";
T[ "PluginAltDesable" ] = "Alt key deactivated";
T[ "PluginClear" ] = "Clear the Pet Shop";
T[ "PluginClearAll" ] = "Clear all entries";
T[ "PluginToggleOn" ] = "Window Toggle ON";
T[ "PluginToggleOff" ] = "Window Toggle OFF";
T[ "PluginEscIconOn" ] = "Show icon";
T[ "PluginEscIconOff" ] = "Hides icon";
T[ "PluginLocked" ] = "Icons locked";
T[ "PluginUnlocked" ] = "Icons unlocked";
T[ "Version" ] = Plugins[T[ "PluginName" ]]:GetVersion();
T[ "PluginDateUpdate" ] = "21.12.2023";
------------------------------------------------------------------------------------------
-- plugin name and title --
------------------------------------------------------------------------------------------
T[ "PluginTextFam" ] = "Your Pet Shop";
T[ "PluginTextFood" ] = "Their food";
T[ "PluginReleaseButton" ] = "Unleash Familiar";
T[ "PluginReleaseAlias" ] = "/Pet release";
------------------------------------------------------------------------------------------
-- default text --
------------------------------------------------------------------------------------------
T[ "PluginDefault" ] = "Default Pet Shop";
------------------------------------------------------------------------------------------
-- Help text --
------------------------------------------------------------------------------------------
T[ "PluginHelp1" ] = " *** AnimalerieV2 Help ***\n\n";
T[ "PluginHelp2" ] = "/show Display the pet shop\n";
T[ "PluginHelp3" ] = "/hide Hide the pet shop\n";
T[ "PluginHelp4" ] = "/default Fills with base pets\n";
T[ "PluginHelp5" ] = "/lock To lock or unlock the icons\n";
T[ "PluginHelp6" ] = "/alt - Enables or disables the alt key for icon movement.\n";
T[ "PluginHelp7" ] = "/toggle - Show or hide the window.\n";
T[ "PluginHelp8" ] = "/clear Clear all hotkeys\n\n";
T[ "PluginHelp9" ] = "You can drag and drop pets on the first line\nand food on the second\nand you can clear a hotkey with the scroll wheel. mouse\n\n";
------------------------------------------------------------------------------------------
-- Options Window text --
------------------------------------------------------------------------------------------
T[ "PluginOptionsText" ] = "AnimalerieV2 Options";
T[ "Option1" ] = "Raven";
T[ "Option2" ] = "Bears";
T[ "Option3" ] = "Lynx";
T[ "Option4" ] = "Eagle";
T[ "Option5" ] = "Tiger";
T[ "Option6" ] = "Guardian";
T[ "Option7" ] = "Spirit";
T[ "PluginAleatoireGen" ] = "Set random pets";
T[ "PluginOptionValidate" ] = "Commit changes";
T[ "PluginAleatoire" ] = " Use random pets";
T[ "PluginSelected" ] = " Use selected pets";
T[ "PluginAleatoireExplication" ] = " Select the pets you want to include in the random change, base pets are required or select only one pet per collon and check the checkbox use selected pets";
