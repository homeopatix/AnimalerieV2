------------------------------------------------------------------------------------------
-- define librairies
------------------------------------------------------------------------------------------
import "Turbine";
import "Turbine.UI";
import "Turbine.UI.Lotro";
import "Turbine.UI.Extensions";
import "Turbine.Gameplay";
------------------------------------------------------------------------------------------
-- Import Globals --
------------------------------------------------------------------------------------------
if Turbine.Engine.GetLanguage() == Turbine.Language.German then
	import "Homeopatix.AnimalerieV2.Localization.GlobalsDE";
	GLocale = "de";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.French then
	import "Homeopatix.AnimalerieV2.Localization.GlobalsFR";
	GLocale = "fr";
elseif Turbine.Engine.GetLanguage() == Turbine.Language.English then
	import "Homeopatix.AnimalerieV2.Localization.GlobalsEN";
	GLocale = "en";
end

import "Homeopatix.AnimalerieV2.Datas.PetsDatas";

------------------------------------------------------------------------------------------
-- Import files --
------------------------------------------------------------------------------------------
import "Homeopatix.AnimalerieV2.Init_Vars";
import "Homeopatix.AnimalerieV2.Notification";
import "Homeopatix.AnimalerieV2.VindarPatch";
import "Homeopatix.AnimalerieV2.LoadAndSave";
import "Homeopatix.AnimalerieV2.Init";
import "Homeopatix.AnimalerieV2.MinimizedIcon";
import "Homeopatix.AnimalerieV2.Commands";
import "Homeopatix.AnimalerieV2.FCT";
import "Homeopatix.AnimalerieV2.UI";
import "Homeopatix.AnimalerieV2.UIInfos";
import "Homeopatix.AnimalerieV2.OptionsWindow";