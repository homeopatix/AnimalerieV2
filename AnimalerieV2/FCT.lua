------------------------------------------------------------------------------------------
-- FCT file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingWindow()
	function AnimalerieWindows:Closing(sender, args)
		settings["isWindowVisible"]["value"] = false;
		SaveSettings();
	end
end
------------------------------------------------------------------------------------------
-- setting the shortcuts
------------------------------------------------------------------------------------------
function SetTheShortCuts()
	for i=1, 14 do
		if(settings["shortcutData"]["value" .. i] ~= "") then
			centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( settings["shortcutType"]["value" .. i], settings["shortcutData"]["value" .. i] ) );
		end
	end
end

------------------------------------------------------------------------------------------
-- setting the shortcuts for drag and drop
------------------------------------------------------------------------------------------
function SetTheDragAndDrop()
	for i=1, 14 do
		centerQS[i].DragDrop = function(sender, args)
			local tmp = Turbine.UI.Lotro.Quickslot();
			local tmp2 = Turbine.UI.Lotro.Quickslot();
			
			tmp = centerQS[i]:GetShortcut();
			tmp = tmp:GetData();
			--Write(tmp); -- display the ID of the schortcut
			settings["shortcutData"]["value" .. i] = tmp;

			tmp2 = centerQS[i]:GetShortcut();
			tmp2 = tmp2:GetType();
			--Write(tmp); -- display the ID of the schortcut
			settings["shortcutType"]["value" .. i] = tmp2;

			SaveSettings();
		end
	end
end

------------------------------------------------------------------------------------------
-- generate a random number
------------------------------------------------------------------------------------------
local u = 0 -- don't delete
function Random(x, y)
    u = u + 1
    if x ~= nil and y ~= nil then
        return math.floor(x +(math.random(math.randomseed(Turbine.Engine.GetLocalTime()+u))*999999 %y))
    else
        return math.floor((math.random(math.randomseed(Turbine.Engine.GetLocalTime()+u))*100))
    end
end

------------------------------------------------------------------------------------------
-- return table lenght
------------------------------------------------------------------------------------------
function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end


------------------------------------------------------------------------------------------
-- close the window with the mouse click on the food
------------------------------------------------------------------------------------------
function SetTheMouseClick()
	for i=8, 14 do
		centerQS[i].MouseClick = function(sender, args)
			AnimalerieWindows:SetVisible(false);
			settings["isWindowVisible"]["value"] = false;
			SaveSettings();
		end
	end
end

------------------------------------------------------------------------------------------
-- delete the shortcut with mouse wheel
------------------------------------------------------------------------------------------
function DeleteTheSHortCuts()
	for i=1, 14 do
		centerQS[i].MouseWheel = function(sender, args)
			if(settings["isLocked"]["value"] == false)then
				settings["shortcutData"]["value" .. i] = "";
				settings["shortcutType"]["value" .. i] = "";
				centerQS[i]:SetShortcut(Turbine.UI.Lotro.Shortcut());
				SaveSettings();
			end
		end
	end
end
------------------------------------------------------------------------------------------
-- define the shortcuts
------------------------------------------------------------------------------------------
function DefineSelectedShortCuts()
	for i=1, 7 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value1"] = Pet[i] ; -- Raven
		end
	end
	for i=8, 15 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value2"] = Pet[i] ; -- Bear
		end
	end
	for i=16, 22 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value3"] = Pet[i] ; -- Lynx
		end
	end
	for i=23, 27 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value4"] = Pet[i] ; -- Eagle
		end
	end
	for i=28, 35 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value5"] = Pet[i] ; -- Saber
		end
	end
	for i=36, 39 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value6"] = Pet[i] ; -- Guardian
		end
	end
	for i=40, 43 do
		if(settings["petAvailable"]["value" .. i] == true)then
			settings["shortcutData"]["value7"] = Pet[i] ; -- Other
		end
	end

	for i=1, 7 do
		settings["shortcutType"]["value" .. i] = 6;
	end
	for i=1, 7 do
		centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( settings["shortcutType"]["value".. i], settings["shortcutData"]["value".. i] ) );
	end
	SaveSettings();
end
------------------------------------------------------------------------------------------
-- define the shortcuts
------------------------------------------------------------------------------------------
function DefineShortCuts()
	settings["shortcutData"]["value1"] = "0x70003EB5"; -- Raven
	settings["shortcutData"]["value2"] = "0x70003EB8"; -- Bear
	settings["shortcutData"]["value3"] = "0x7000B8D3"; -- Lynx
	settings["shortcutData"]["value4"] = "0x70000FB2"; -- Eagle
	settings["shortcutData"]["value5"] = "0x7000F530"; -- Saber Tooth
	settings["shortcutData"]["value6"] = "0x7000F54D"; -- Bog Guardian
	settings["shortcutData"]["value7"] = "0x7002A706"; -- Spirit of Nature
	for i=1, 7 do
		settings["shortcutType"]["value" .. i] = 6;
	end
	for i=1, 7 do
		centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( settings["shortcutType"]["value".. i], settings["shortcutData"]["value".. i] ) );
	end
	SaveSettings();
end

------------------------------------------------------------------------------------------
-- return the chosen pets from the option windows
------------------------------------------------------------------------------------------
function ReturnAvailablePets(val)
	local NbrPetInListStart = {1, 8, 16, 23, 28, 36, 40};
	local NbrPetInListEnd = {7, 15, 22, 27, 35, 39, 43};

	local valTmp = {};

	for i=NbrPetInListStart[val], NbrPetInListEnd[val] do
		if(settings["petAvailable"]["value" .. i] == true)then
			table.insert(valTmp, i);
		end
	end

	valHex = Random(1, tablelength(valTmp)) ;
	hexValue = Pet[valTmp[valHex]];

	return hexValue;
end

------------------------------------------------------------------------------------------
-- define the shortcuts for the aleatoire chosen pets
------------------------------------------------------------------------------------------
function DefineAleatoireShortCuts()
	settings["shortcutData"]["value1"] = ReturnAvailablePets(1); -- Raven
	settings["shortcutData"]["value2"] = ReturnAvailablePets(2); -- Bear
	settings["shortcutData"]["value3"] = ReturnAvailablePets(3); -- Lynx
	settings["shortcutData"]["value4"] = ReturnAvailablePets(4); -- Eagle
	settings["shortcutData"]["value5"] = ReturnAvailablePets(5); -- Saber Tooth
	settings["shortcutData"]["value6"] = ReturnAvailablePets(6); -- Bog Guardian
	settings["shortcutData"]["value7"] = ReturnAvailablePets(7); -- Spirit of Nature

	for i=1, 7 do
		settings["shortcutType"]["value" .. i] = 6;
	end
	for i=1, 7 do
		centerQS[i]:SetShortcut( Turbine.UI.Lotro.Shortcut( settings["shortcutType"]["value".. i], settings["shortcutData"]["value".. i] ) );
	end
	SaveSettings();
end

------------------------------------------------------------------------------------------
-- display the list of command
------------------------------------------------------------------------------------------
function commandsHelp()
	notification(
		rgb["start"] .. 
		T[ "PluginHelp1" ] ..
		rgb["clear"] ..
		T[ "PluginHelp2" ] ..
		T[ "PluginHelp3" ] ..
		T[ "PluginHelp4" ] ..
		T[ "PluginHelp5" ] ..
		T[ "PluginHelp6" ] ..
		T[ "PluginHelp7" ] ..
		T[ "PluginHelp8" ] ..
		T[ "PluginHelp9" ]
	);
end

------------------------------------------------------------------------------------------
-- reload the window
------------------------------------------------------------------------------------------
function ReloadWindow()
	if(settings["useAleatoire"]["value"] == false)then
		if(settings["useSelected"]["value"] == true)then
			DefineSelectedShortCuts();
		else
			DefineShortCuts();
		end
	else
		DefineAleatoireShortCuts();
	end

	settings["isWindowVisible"]["value"] = false;
	AnimalerieWindows:SetVisible(false);
	CreateTheWindow();
	settings["isWindowVisible"]["value"] = true;
	AnimalerieWindows:SetVisible(true);
end

------------------------------------------------------------------------------------------
--function to display the infos window --
------------------------------------------------------------------------------------------
function DisplayInfosWindow(posx, posy)
	ButtonInfos = Turbine.UI.Extensions.SimpleWindow();
	ButtonInfos:SetParent( AnimalerieWindows );
	ButtonInfos:SetPosition(posx, posy);
	ButtonInfos:SetSize( 20, 20 );
	ButtonInfos:SetVisible(true);
	ButtonInfos:SetBackground(ResourcePath .. "Help.tga");
	ButtonInfos:SetZOrder(20);

	--ButtonInfos:SetBackColor(Turbine.UI.Color.Lime);

	CreateInfosWindow();

	ButtonInfos.MouseEnter = function()
		InfosWindow:SetVisible(true);
	end

	ButtonInfos.MouseLeave = function()
		InfosWindow:SetVisible(false);
	end
end