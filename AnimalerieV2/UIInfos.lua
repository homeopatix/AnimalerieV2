------------------------------------------------------------------------------------------
-- UIInfos file
-- Written by Homeopatix
-- 16 juin 2021
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- create infos window
------------------------------------------------------------------------------------------
function CreateInfosWindow()
	InfosWindow=Turbine.UI.Lotro.GoldWindow(); 
	InfosWindow:SetSize(300,180); 
	InfosWindow:SetText("Informations"); 
	InfosWindow.Message=Turbine.UI.Label(); 
	InfosWindow.Message:SetParent(InfosWindow); 
	InfosWindow.Message:SetSize(150,10); 
	InfosWindow.Message:SetPosition(InfosWindow:GetWidth()/2 - 75, InfosWindow:GetHeight() - 20); 
	InfosWindow.Message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	InfosWindow.Message:SetText(T[ "PluginText" ]); 
	InfosWindow:SetZOrder(1);
	InfosWindow:SetWantsKeyEvents(true);
	InfosWindow:SetVisible(false);

	InfosWindow:SetPosition((Turbine.UI.Display:GetWidth()-InfosWindow:GetWidth())/2,(Turbine.UI.Display:GetHeight()-InfosWindow:GetHeight())/2);
	------------------------------------------------------------------------------------------
	-- center window
	------------------------------------------------------------------------------------------

	Texte1 = Turbine.UI.Label();
	Texte1:SetParent(InfosWindow); 
	Texte1:SetSize(250, 50); 
	Texte1:SetPosition(25, 40); 
	Texte1:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);  
	Texte1:SetForeColor(Turbine.UI.Color.Gold); 
	Texte1:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold24);
	Texte1:SetText(T[ "PluginName" ]);
	Texte1:SetZOrder(1);

	Texte2 = Turbine.UI.Label();
	Texte2:SetParent(InfosWindow); 
	Texte2:SetSize(250, 50); 
	Texte2:SetPosition(25, 75); 
	Texte2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	Texte2:SetForeColor(Turbine.UI.Color.Gold); 
	Texte2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold24);
	Texte2:SetText("V " .. tostring(Plugins[pluginName]:GetVersion())); 
	Texte2:SetZOrder(1);

	Texte2 = Turbine.UI.Label();
	Texte2:SetParent(InfosWindow); 
	Texte2:SetSize(250, 50); 
	Texte2:SetPosition(25, 110); 
	Texte2:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter); 
	Texte2:SetForeColor(Turbine.UI.Color.Gold); 
	Texte2:SetFont(Turbine.UI.Lotro.Font.BookAntiquaBold19);
	Texte2:SetText(T[ "PluginDateUpdate" ]); 
	Texte2:SetZOrder(1);
end