function Client_PresentMenuUI(rootParent, setMaxSize, setScrollable, game, close)	
    if game.Us ~= nil then
	
		NumberOfHills = 2;
		if Mod.Settings.NumberOfHills ~= nil then
			NumberOfHills = Mod.Settings.NumberOfHills;
		end
	
		local vert = UI.CreateVerticalLayoutGroup(rootParent);
		
		UI.CreateLabel(vert).SetText('The '..Mod.Settings.NumberOfHills..' hills in this game are:');

		local PublicGameData = Mod.PublicGameData;
		Hills = PublicGameData.Hills;
		for _, Hill in pairs(Hills) do
			UI.CreateLabel(vert).SetText("- " .. game.Map.Territories[Hill].Name);
		end
		UI.CreateLabel(vert).SetText('Hold all hills at the end of a turn to win!');
	end
end


