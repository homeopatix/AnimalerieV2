------------------------------------------------------------------------------------------
-- Init_Vars file
-- Written by Homeopatix
-- 22 Avril 2022
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- Define player global vars
------------------------------------------------------------------------------------------
Player = Turbine.Gameplay.LocalPlayer.GetInstance();
PlayerName = Player:GetName();
PlayerAlign = Player:GetAlignment(); --1: Free People / 2: Monster Play
PlayerLvl = Player:GetLevel();
PlayerClass = Player:GetClass();
PlayerRace = Player:GetRace();
------------------------------------------------------------------------------------------
-- Define some global vars
------------------------------------------------------------------------------------------
Write = Turbine.Shell.WriteLine;
screenWidth, screenHeight = Turbine.UI.Display.GetSize();

NbrPets = 43;