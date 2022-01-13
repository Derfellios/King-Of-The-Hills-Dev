 function Client_PresentSettingsUI(rootParent)
	local vert = UI.CreateVerticalLayoutGroup(rootParent);
	UI.CreateLabel(vert).SetText("The hills are indicated with Money Caches and can also found by clicking 'Game' on the bottom left and then 'Mod: King Of The Hill'");
	
	local NumberOfHills = Mod.Settings.NumberOfHills;
	local SizeOfHills = Mod.Settings.SizeOfHills;
	
    UI.CreateLabel(vert).SetText('Number of hills in the game: ' .. NumberOfHills);
	UI.CreateLabel(vert).SetText('Number of armies on each hill: ' .. SizeOfHills);
	UI.CreateLabel(vert).SetText('Hold all hills at the end of a turn to win!');
end
