function AddHillsToGame(game, standing)
	NumberOfHills = Mod.Settings.NumberOfHills;
	SizeOfHills = Mod.Settings.SizeOfHills;
	
	local PublicGameData = Mod.PublicGameData;
	PublicGameData.Hills = {}
	
	local PossTerr = {};
	local PossTerrCount = 0;
	for _, territory in pairs(standing.Territories) do
		if territory.IsNeutral then
			PossTerrCount = PossTerrCount + 1;
			table.insert(PossTerr, territory.ID)
		end
	end
	
	for i = 1, math.min(NumberOfHills, PossTerrCount)  do
		local j = math.random(i, #PossTerr)
		PossTerr[i], PossTerr[j] = PossTerr[j], PossTerr[i]
		table.insert(PublicGameData.Hills, PossTerr[i])
		standing.Territories[PossTerr[i]].NumArmies = WL.Armies.Create(SizeOfHills, {})
		
		local s = standing.Territories[PossTerr[i]].Structures;
        if (s == nil) then s = {}; end;
        s[WL.StructureType.Mine] = 1;
		standing.Territories[PossTerr[i]].Structures = s;
	end

	Mod.PublicGameData = PublicGameData;
end