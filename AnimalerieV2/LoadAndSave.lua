------------------------------------------------------------------------------------------
-- LoadAndSave file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create or load the settings
------------------------------------------------------------------------------------------
function LoadSettings()
	local _settings = PatchDataLoad(dataScope, settingsFileName, settings);
    if (_settings ~= nil) then
		settings = _settings;
	end
	------------------------------------------------------------------------------------------
	--- adding new vars in the settings file ---
------------------------------------------------------------------------------------------
	if( not settings.useSelected)then
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
    end
end
------------------------------------------------------------------------------------------
-- create the save settings
------------------------------------------------------------------------------------------
function SaveSettings()
	settings["PosWindow"]["x"] = tostring(AnimalerieWindows:GetLeft());
    settings["PosWindow"]["y"] = tostring(AnimalerieWindows:GetTop());
    settings["PosIcon"]["x"] = settings["PosIcon"]["x"];
   	settings["PosIcon"]["y"] = settings["PosIcon"]["y"];
	settings["isMinimizeEnabled"]["value"] = settings["isMinimizeEnabled"]["value"];
	settings["isWindowVisible"]["value"] = settings["isWindowVisible"]["value"];
	settings["isOptionsWindowVisible"]["value"] = settings["isOptionsWindowVisible"]["value"];
	settings["isHelpWindowVisible"]["value"] = settings["isHelpWindowVisible"]["value"];
	settings["isInfoWindowVisible"]["value"] = settings["isInfoWindowVisible"]["value"];
	settings["isToBeSurWindowVisible"]["value"] = settings["isToBeSurWindowVisible"]["value"];
	settings["escEnable"]["value"] = settings["escEnable"]["value"];
	settings["isLocked"]["value"] = settings["isLocked"]["value"];
	settings["altEnable"]["value"] = settings["altEnable"]["value"];
	settings["verbose"]["value"] = settings["verbose"]["value"];

	for i=1, 14 do
		settings["shortcutData"]["value" .. i] = settings["shortcutData"]["value" .. i];
		settings["shortcutType"]["value" .. i] = tonumber(settings["shortcutType"]["value" .. i]);
	end

	for i=1, NbrPets do
		settings["petAvailable"]["value" .. i] = settings["petAvailable"]["value" .. i];
	end

	settings["useAleatoire"]["value"] = settings["useAleatoire"]["value"];
	settings["useSelected"]["value"] = settings["useSelected"]["value"];

	PatchDataSave( dataScope, settingsFileName, settings);
end