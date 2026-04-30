------------------------------------------------------------------------------------------
-- Main file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- import librarys
------------------------------------------------------------------------------------------
import "Homeopatix.AnimalerieV2.Librarys"
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
CreateTheWindow();
GenerateOptionsWindow();
------------------------------------------------------------------------------------------
-- handle minimizeIcon
------------------------------------------------------------------------------------------
if(settings["isWindowVisible"]["value"] == true) then
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, AnimalerieWindows:SetVisible(true));
else
	MainMinimizedIcon = MinimizedIcon(Images.MinimizedIcon, 32, 32, AnimalerieWindows:SetVisible(false));
end

MainMinimizedIcon:SetPosition(settings["PosIcon"]["x"], settings["PosIcon"]["y"]);
MainMinimizedIcon:SetZOrder(0);

MainMinimizedIcon:SetBackground(Images.MinimizedIcon);
MainMinimizedIcon:SetBackColorBlendMode(Turbine.UI.BlendMode.Multiply);
MainMinimizedIcon:SetBackColor(Turbine.UI.Color(0, 0.5, 0.5, 0.5));
    
MainMinimizedIcon.PositionChanged = function()
	settings["PosIcon"]["x"] = MainMinimizedIcon:GetLeft();
	settings["PosIcon"]["y"] = MainMinimizedIcon:GetTop();
	SaveSettings();
end
------------------------------------------------------------------------------------------
-- event handling
------------------------------------------------------------------------------------------
AnimalerieWindows.KeyDown=function(sender, args)
	if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
		if(settings["escEnable"]["value"] == true) then
			AnimalerieWindows:SetVisible(false);
			settings["isWindowVisible"]["value"] = false;
			SaveSettings();
		end
	end
	
	-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
	if ( args.Action == 268435635 ) then
		hudVisible=not hudVisible;
		if hudVisible then
			AnimalerieWindows:SetVisible(false);
			MainMinimizedIcon:SetVisible(false);
		else
			if(settings["isWindowVisible"]["value"] == true)then
				AnimalerieWindows:SetVisible(true);
			else
				AnimalerieWindows:SetVisible(false);
			end
			MainMinimizedIcon:SetVisible(true);
		end
	end
end

function AnimalerieWindows:Closing(sender, args)
	settings["isWindowVisible"]["value"] = false;
	SaveSettings();
end
------------------------------------------------------------------------------------------
-- if the position changes, save the new window location
------------------------------------------------------------------------------------------
AnimalerieWindows.PositionChanged = function( sender, args )
    local x,y = AnimalerieWindows:GetPosition();
    settings["PosWindow"]["x"] = x;
    settings["PosWindow"]["y"] = y;
	SaveSettings();
end