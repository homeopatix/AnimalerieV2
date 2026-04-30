------------------------------------------------------------------------------------------
-- UI file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create the main window
------------------------------------------------------------------------------------------
function CreateTheWindow()
	AnimalerieWindows=Turbine.UI.Lotro.GoldWindow();
	AnimalerieWindows:SetSize(324,170);
	AnimalerieWindows:SetText( T["PluginName"] );
	AnimalerieWindows.Message=Turbine.UI.Label();
	AnimalerieWindows.Message:SetParent(AnimalerieWindows);
	AnimalerieWindows.Message:SetSize(150,10);
	AnimalerieWindows.Message:SetPosition(AnimalerieWindows:GetWidth()/2 - 75, 32);
	AnimalerieWindows.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	AnimalerieWindows.Message:SetText( T["PluginTextFam"] );

	AnimalerieWindows.Message=Turbine.UI.Label();
	AnimalerieWindows.Message:SetParent(AnimalerieWindows);
	AnimalerieWindows.Message:SetSize(150,10);
	AnimalerieWindows.Message:SetPosition(AnimalerieWindows:GetWidth()/2 - 75, 85);
	AnimalerieWindows.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
	AnimalerieWindows.Message:SetText( T["PluginTextFood"] );
	AnimalerieWindows:SetWantsKeyEvents(true);

	AnimalerieWindows:SetPosition(settings["PosWindow"]["x"], settings["PosWindow"]["y"]);

	if(settings["isWindowVisible"]["value"] == true) then
		AnimalerieWindows:SetVisible(true);
	else
		AnimalerieWindows:SetVisible(false);
	end

	--------------------------------------------------------------------------------------------
	--Pet icons
	--------------------------------------------------------------------------------------------

	centerWindow = {} ;
	centerLabel = {};
	centerQS = {};
	releaseQS = {};

	posx = 15;
	posy = 41;

	for i=1, 14 do
		centerWindow[i] = Turbine.UI.Extensions.SimpleWindow();
		centerWindow[i]:SetSize( 40 , 40 );
		centerWindow[i]:SetParent( AnimalerieWindows );
		if(i <= 7)then
			centerWindow[i]:SetPosition( posx ,AnimalerieWindows:GetHeight()/2 - posy);
		else
			centerWindow[i]:SetPosition( posx ,AnimalerieWindows:GetHeight()/2 + posy);
		end
		centerWindow[i]:SetVisible( true );
		centerWindow[i]:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );

		centerLabel[i] = Turbine.UI.Label();
		centerLabel[i]:SetParent( centerWindow[i] );
		centerLabel[i]:SetPosition( 0, 0 );
		centerLabel[i]:SetSize( 40, 40  );
		centerLabel[i]:SetText( "" );
		centerLabel[i]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		centerLabel[i]:SetZOrder(-1);
		centerLabel[i]:SetMouseVisible(false);

		centerQS[i] = Turbine.UI.Lotro.Quickslot();
		centerQS[i]:SetParent( centerWindow[i] );
		centerQS[i]:SetPosition( 1, 1 );
		centerQS[i]:SetSize( 36, 36 );
		centerQS[i]:SetUseOnRightClick(false);

		posx = posx + 42;

		if(i == 7)then
			posx = 15;
			posy = 13;
		end
	end

	------------------------------------------------------------------------------------------
	-- releae pet button
	------------------------------------------------------------------------------------------
	AnimalerieButton = Turbine.UI.Lotro.GoldButton();
	AnimalerieButton:SetParent( AnimalerieWindows );
	AnimalerieButton:SetPosition(AnimalerieWindows:GetWidth()/2 - 75, AnimalerieWindows:GetHeight()/2 + 57);
	AnimalerieButton:SetSize( 150, 20 );
	AnimalerieButton:SetText( T["PluginReleaseButton"] );
	AnimalerieButton:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	AnimalerieButton:SetVisible(true);
	AnimalerieButton:SetMouseVisible(true);

	releaseWindow = Turbine.UI.Extensions.SimpleWindow();
	releaseWindow:SetSize( 150, 20 );
	releaseWindow:SetParent( AnimalerieWindows );
	releaseWindow:SetPosition(AnimalerieWindows:GetWidth()/2 - 75, AnimalerieWindows:GetHeight()/2 + 57);
	releaseWindow:SetOpacity( 0 );
	releaseWindow:SetFadeSpeed( 0.5 );
	releaseWindow:SetVisible( true );
	releaseWindow:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );

	releaseQSBack = Turbine.UI.Control();
	releaseQSBack:SetParent( releaseWindow );
	releaseQSBack:SetZOrder(-1);
	releaseQSBack:SetSize( 150, 20 );

	posx = 0;
	for i=1, 5 do
		releaseQS = Turbine.UI.Lotro.Quickslot();
		releaseQS:SetParent(  releaseQSBack );
		releaseQS:SetShortcut(Turbine.UI.Lotro.Shortcut(Turbine.UI.Lotro.ShortcutType.Alias, T["PluginReleaseAlias"]));
		releaseQS:SetSize( 150, 20 );
		releaseQS:SetPosition( posx, 0 );
		releaseQS:SetAllowDrop(false);

		posx = posx + 32;
	end

	------------------------------------------------------------------------------------------
	-- set the functions
	------------------------------------------------------------------------------------------
	SetTheShortCuts();
	SetTheDragAndDrop();
	SetTheMouseClick();
	DeleteTheSHortCuts();
	------------------------------------------------------------------------------------------
	-- Closing window handler
	------------------------------------------------------------------------------------------
	ClosingWindow();

	------------------------------------------------------------------------------------------
	-- Display the info window on mouse over my name
	------------------------------------------------------------------------------------------
	DisplayInfosWindow(AnimalerieWindows:GetWidth()/2 - 135, AnimalerieWindows:GetHeight() - 28);
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
				settings["isWindowVisible"]["value"] = false;
				MainMinimizedIcon:SetVisible(false);
			else
				if(settings["isWindowVisible"]["value"] == true)then
					AnimalerieWindows:SetVisible(true);
					settings["isWindowVisible"]["value"] = true;
				else
					AnimalerieWindows:SetVisible(false);
					settings["isWindowVisible"]["value"] = false;
				end
				MainMinimizedIcon:SetVisible(true);
			end
		end
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

end