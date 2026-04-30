------------------------------------------------------------------------------------------
-- Commands file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
AnimalerieV2Command = Turbine.ShellCommand();
------------------------------------------------------------------------------------------
-- commands
------------------------------------------------------------------------------------------
function AnimalerieV2Command:Execute( command, arguments )

	if ( arguments == "help" ) then
		commandsHelp();
	elseif ( arguments == "show" ) then
		--notification("Show the Animalerie Window");
		AnimalerieWindows:SetVisible(true);
		settings["isWindowVisible"]["value"] = true;
		SaveSettings();
	elseif ( arguments == "hide" ) then
		--notification("Hide the Animalerie Window");
		AnimalerieWindows:SetVisible(false);
		settings["isWindowVisible"]["value"] = false;
		SaveSettings();
	elseif ( arguments == "esc" ) then
		if(settings["escEnable"]["value"] == true) then
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginEscDesable" ]);
			settings["escEnable"]["value"] = false;
		else
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginEscEnable" ]);
			settings["escEnable"]["value"] = true;
		end
		SaveSettings();
------------------------------------------------------------------------------------------
-- toggle command--
------------------------------------------------------------------------------------------
	elseif ( arguments == "toggle" ) then
		if(settings["isWindowVisible"]["value"] == true)then
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginWindowHide" ]);
			AnimalerieWindows:SetVisible(false);
			settings["isWindowVisible"]["value"] = false;
		else
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginWindowShow" ]);
			AnimalerieWindows:SetVisible(true);
			settings["isWindowVisible"]["value"] = true;
		end
		SaveSettings();
	elseif ( arguments == "lock" ) then
		--notification("Hide the PopoHelper Window");
		if(settings["isLocked"]["value"] == false)then
			settings["isLocked"]["value"] = true;
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " : " .. T[ "PluginLocked" ]);
		else
			settings["isLocked"]["value"] = false;
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " : " .. T[ "PluginUnlocked" ]);
		end
		SaveSettings();
	------------------------------------------------------------------------------------------
	-- alt command--
	------------------------------------------------------------------------------------------
	elseif ( arguments == "alt" ) then
		if(settings["altEnable"]["value"] == true) then
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginAltDesable" ]);
			settings["altEnable"]["value"] = false;
		else
			notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginAltEnable" ]);
			settings["altEnable"]["value"] = true;
		end
		SaveSettings();
	elseif ( arguments == "default" ) then
		--notification("default the Animalerie Window");
		notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginDefault" ]);
		DefineShortCuts();
		ReloadWindow();
		SaveSettings();
	elseif ( arguments == "clear" ) then
		--notification("clear the Animalerie Window");
		notification(rgb["start"] .. T[ "PluginName" ] .. rgb["clear"] .. " - " .. T[ "PluginClear" ]);
		for i=1, 14 do
			settings["shortcutData"]["value".. i] = "";
			settings["shortcutType"]["value".. i] = 6;
			centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut() );
		end
		for i=1, NbrPets do
			settings["petAvailable"]["value" .. i] = false;
		end
		settings["isWindowVisible"]["value"] = false;
		AnimalerieWindows:SetVisible(false);
		CreateTheWindow();
		settings["isWindowVisible"]["value"] = true;
		AnimalerieWindows:SetVisible(true);
		GenerateOptionsWindow();
		settings["useAleatoire"]["value"] = false ;
		settings["isOptionsWindowVisible"]["value"] = false;
		OptionsWindow:SetVisible(false);
		SaveSettings();
	------------------------------------------------------------------------------------------
	-- default if nothing is right command--
	------------------------------------------------------------------------------------------
	elseif ( arguments ~= "help" or 
			arguments ~= "show" or 
			arguments ~= "hide" or 
			arguments ~= "esc" or 
			arguments ~= "toggle" or 
			arguments ~= "lock" or 
			arguments ~= "alt" or 
			arguments ~= "default" or 
			arguments ~= "clear") then
			-- nothing found, so display the help
		commandsHelp();
	end

end

Turbine.Shell.AddCommand( "AnV2;AnimalerieV2", AnimalerieV2Command );