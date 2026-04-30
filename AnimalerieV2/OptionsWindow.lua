------------------------------------------------------------------------------------------
-- OptionWindow file
-- Written by Homeopatix
-- 26 january 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- define size of the window
------------------------------------------------------------------------------------------
local windowWidth = 0;
local windowHeight = 0;

windowWidth = 870;
windowHeight = 670;
------------------------------------------------------------------------------------------
-- create the options window
------------------------------------------------------------------------------------------
function GenerateOptionsWindow()
	OptionsWindow=Turbine.UI.Lotro.GoldWindow(); 
	OptionsWindow:SetSize(windowWidth, windowHeight); 
	OptionsWindow:SetText( T[ "PluginOptionsText" ] ); 

	OptionsWindow.Message=Turbine.UI.Label(); 
	OptionsWindow.Message:SetParent(OptionsWindow); 
	OptionsWindow.Message:SetSize(150,10); 
	OptionsWindow.Message:SetPosition(windowWidth/2 - 75, windowHeight - 17 ); 
	OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	OptionsWindow.Message:SetText( T[ "PluginText" ] ); 

	OptionsWindow.Message=Turbine.UI.Label(); 
	OptionsWindow.Message:SetParent(OptionsWindow); 
	OptionsWindow.Message:SetSize(600,80); 
	OptionsWindow.Message:SetPosition(windowWidth/2 - 300, 40 ); 
	OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.Verdana18);
	OptionsWindow.Message:SetText( T[ "PluginAleatoireExplication" ] ); 

	OptionsWindow.Message=Turbine.UI.Label(); 
	OptionsWindow.Message:SetParent(OptionsWindow); 
	OptionsWindow.Message:SetSize(800,40); 
	OptionsWindow.Message:SetPosition(windowWidth/2 - 400, 90 ); 
	OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
	OptionsWindow.Message:SetText( "----------------------------------------------------------------------------------------------------------------" ); 
	OptionsWindow.Message:SetForeColor( Turbine.UI.Color.Blue); 

	OptionsWindow:SetZOrder(0);
	OptionsWindow:SetWantsKeyEvents(true);
	OptionsWindow:SetPosition((Turbine.UI.Display:GetWidth()-OptionsWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-OptionsWindow:GetHeight())/2);
	OptionsWindow:SetVisible(false);
	------------------------------------------------------------------------------------------
	-- option panel --
	------------------------------------------------------------------------------------------

	centerWin = {};
	centerLab = {};
	centQS = {};
	checkBoxKeep = {};
	OptionsWindowMessage = {};
	iconPosx = 50;
	iconPosy = 180 ;

	displayTitle = false;
	valText = 1 ;

	-- Display the raven ---

	for i=1, NbrPets do
		if(displayTitle == false)then
			OptionsWindowMessage[i]=Turbine.UI.Label(); 
			OptionsWindowMessage[i]:SetParent(OptionsWindow); 
			OptionsWindowMessage[i]:SetSize(60, 40); 
			OptionsWindowMessage[i]:SetPosition(iconPosx - 10, iconPosy - 40 ); 
			OptionsWindowMessage[i]:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			OptionsWindowMessage[i]:SetFont(Turbine.UI.Lotro.Font.Verdana16);
			OptionsWindowMessage[i]:SetText( T[ "Option" .. valText ] ); 
			displayTitle = true;
			valText = valText + 1;

			OptionsWindow.Message=Turbine.UI.Label(); 
			OptionsWindow.Message:SetParent(OptionsWindow); 
			OptionsWindow.Message:SetSize(70,40); 
			OptionsWindow.Message:SetPosition(iconPosx - 10, iconPosy - 30 ); 
			OptionsWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
			OptionsWindow.Message:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold22);
			OptionsWindow.Message:SetText( "-----------" ); 
			OptionsWindow.Message:SetForeColor( Turbine.UI.Color.Blue); 
		end

		centerWin[i] = Turbine.UI.Extensions.SimpleWindow();
		centerWin[i]:SetSize( 40 , 40 );
		centerWin[i]:SetParent( OptionsWindow );
		centerWin[i]:SetPosition( iconPosx, iconPosy);
		centerWin[i]:SetVisible( true );
		centerWin[i]:SetBackColor( Turbine.UI.Color( .6, .5, .7, .5) );

		centerLab[i] = Turbine.UI.Label();
		centerLab[i]:SetParent( centerWin[i] );
		centerLab[i]:SetPosition( 0, 0 );
		centerLab[i]:SetSize( 40, 40  );
		centerLab[i]:SetText( "" );
		centerLab[i]:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
		centerLab[i]:SetZOrder(-1);
		centerLab[i]:SetMouseVisible(false);

		centQS[i] = Turbine.UI.Lotro.Quickslot();
		centQS[i]:SetParent( centerWin[i] );
		centQS[i]:SetPosition( 1, 1 );
		centQS[i]:SetSize( 36, 36 );
		centQS[i]:SetUseOnRightClick(false);
		val = 6;
		centQS[i]:SetShortcut(Turbine.UI.Lotro.Shortcut(val, Pet[i]));

		checkBoxKeep[i] = Turbine.UI.Lotro.CheckBox();
		checkBoxKeep[i]:SetParent( OptionsWindow );
		checkBoxKeep[i]:SetSize(40, 40); 
		checkBoxKeep[i]:SetFont(Turbine.UI.Lotro.Font.Verdana16);
		checkBoxKeep[i]:SetText( "" );
		checkBoxKeep[i]:SetPosition(iconPosx + 45, iconPosy);
		checkBoxKeep[i]:SetVisible(true);
		if(settings["petAvailable"]["value" .. i] == true)then
			checkBoxKeep[i]:SetChecked(true);
		else
			checkBoxKeep[i]:SetChecked(false);
		end
		checkBoxKeep[i]:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

		iconPosy = iconPosy + 44 ;

		if( i == 7  or i == 15 or i == 22 or i == 27 or i == 35 or i == 39 )then
			iconPosy = 180;
			iconPosx = iconPosx + 120;
			displayTitle = false;
		end
	end

	posy = 44 * 7 + 150 + 80;

	checkBoxAlea = Turbine.UI.Lotro.CheckBox();
	checkBoxAlea:SetParent( OptionsWindow );
	checkBoxAlea:SetSize(500, 40); 
	checkBoxAlea:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	checkBoxAlea:SetText(T[ "PluginAleatoire" ]);
	checkBoxAlea:SetPosition(windowWidth/2 - 100, posy);
	checkBoxAlea:SetVisible(true);
	if(settings["useAleatoire"]["value"] == true)then
		checkBoxAlea:SetChecked(true);
	else
		checkBoxAlea:SetChecked(false);
	end
	checkBoxAlea:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

	posy = 44 * 7 + 150 + 110;

	checkBoxSelected = Turbine.UI.Lotro.CheckBox();
	checkBoxSelected:SetParent( OptionsWindow );
	checkBoxSelected:SetSize(500, 40); 
	checkBoxSelected:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	checkBoxSelected:SetText(T[ "PluginSelected" ]);
	checkBoxSelected:SetPosition(windowWidth/2 - 100, posy);
	checkBoxSelected:SetVisible(true);
	if(settings["useSelected"]["value"] == true)then
		checkBoxSelected:SetChecked(true);
	else
		checkBoxSelected:SetChecked(false);
	end
	checkBoxSelected:SetForeColor( Turbine.UI.Color( 0.7, 0.6, 0.2 ));

	function checkBoxAlea:CheckedChanged()
		if(checkBoxAlea:IsChecked())then
			if(PlayerLvl >= 4)then
				settings["petAvailable"]["value1"] = true;
			end
			if(PlayerLvl >= 14)then
				settings["petAvailable"]["value8"] = true;
			end
			if(PlayerLvl >= 30)then
				settings["petAvailable"]["value16"] = true;
			end
			if(PlayerLvl >= 50)then
				settings["petAvailable"]["value23"] = true;
			end
			if(PlayerLvl >= 56)then
				settings["petAvailable"]["value28"] = true;
			end
			if(PlayerLvl >= 58)then
				settings["petAvailable"]["value36"] = true;
			end
			if(PlayerLvl >= 58)then
				settings["petAvailable"]["value40"] = true;
			end
			
			settings["useAleatoire"]["value"] = true;
			settings["isOptionsWindowVisible"]["value"] = false;
			OptionsWindow:SetVisible(false);
			GenerateOptionsWindow();
			OptionsWindow:SetVisible(true);
			settings["isOptionsWindowVisible"]["value"] = true;
			SaveSettings();
		else
			for i=1, NbrPets do
				settings["petAvailable"]["value" .. i] = false;
			end
			settings["useAleatoire"]["value"] = false;
			settings["isOptionsWindowVisible"]["value"] = false;
			OptionsWindow:SetVisible(false);
			GenerateOptionsWindow();
			OptionsWindow:SetVisible(true);
			settings["isOptionsWindowVisible"]["value"] = true;
			SaveSettings();
		end
	end

	buttonValider = Turbine.UI.Lotro.GoldButton();
	buttonValider:SetParent( OptionsWindow );
	buttonValider:SetPosition(windowWidth/2 - 125,  windowHeight - 40);
	buttonValider:SetSize( 300, 20 );
	buttonValider:SetFont(Turbine.UI.Lotro.Font.Verdana16);
	buttonValider:SetText( T[ "PluginOptionValidate" ] );
	buttonValider:SetTextAlignment( Turbine.UI.ContentAlignment.MiddleCenter );
	buttonValider:SetVisible(true);
	buttonValider:SetMouseVisible(true);

	ValidateChangesOptions();
	ClosingTheOptionsWindow();

	------------------------------------------------------------------------------------------
	-- event handling
	------------------------------------------------------------------------------------------
	OptionsWindow.KeyDown=function(sender, args)
		if ( args.Action == Turbine.UI.Lotro.Action.Escape ) then
			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["value"] = false;
			SaveSettings();
		end
	
		-- https://www.lotro.com/forums/showthread.php?493466-How-to-hide-a-window-on-F12&p=6581962#post6581962
		if ( args.Action == 268435635 ) then
			OptionsWindow:SetVisible(false);
			settings["isOptionsWindowVisible"]["value"] = false;
		end
	end
end
------------------------------------------------------------------------------------------
-- boutton valider
------------------------------------------------------------------------------------------
function ValidateChangesOptions()
	buttonValider.MouseClick = function(sender, args)
		for i=1, NbrPets do
			if (checkBoxKeep[i]:IsChecked() == true) then
				settings["petAvailable"]["value" .. i] = true;
			else
				settings["petAvailable"]["value" .. i] = false;
			end
		end

		if(checkBoxAlea:IsChecked() == true)then
			settings["useAleatoire"]["value"] = true ;
			settings["useSelected"]["value"] = false ;
		else
			settings["useAleatoire"]["value"] = false ;
		end

		if(checkBoxSelected:IsChecked() == true)then
			settings["useSelected"]["value"] = true ;
			settings["useAleatoire"]["value"] = false ;
		else
			settings["useSelected"]["value"] = false ;
		end

		OptionsWindow:SetVisible(false);
		settings["isOptionsWindowVisible"]["value"] = false;

		SaveSettings();
		ReloadWindow();
	end
end
------------------------------------------------------------------------------------------
-- Closing window handler
------------------------------------------------------------------------------------------
function ClosingTheOptionsWindow()
	function OptionsWindow:Closing(sender, args)
		settings["isOptionsWindowVisible"]["value"] = false;
	end
end