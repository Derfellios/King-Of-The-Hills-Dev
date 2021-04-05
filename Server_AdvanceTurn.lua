function Server_AdvanceTurn_End(game, addNewOrder)
	local Hills  = Mod.PublicGameData.Hills;
	
	NoNeutrals = true;
	for _, Hill in pairs(Hills) do
		if game.ServerGame.LatestTurnStanding.Territories[Hill].IsNeutral then
			NoNeutrals = false;
		end
	end
	
	if NoNeutrals then
	
		IsTeamGame = false;
		for _, player in pairs(game.ServerGame.Game.Players) do
			if player.Team > -1 then
				IsTeamGame = true;
			end
		end
		
		AllSame = true
		local Owners = {}
		if IsTeamGame then
			for _, Hill in pairs(Hills) do
				table.insert(Owners, game.ServerGame.Game.Players[game.ServerGame.LatestTurnStanding.Territories[Hill].OwnerPlayerID].Team);
			end			
			for i = 1, #Owners do
				if Owners[i] ~= Owners[1] then
					AllSame = false
				end
			end
		else
			for _, Hill in pairs(Hills) do
				table.insert(Owners, game.ServerGame.LatestTurnStanding.Territories[Hill].OwnerPlayerID);
			end		
			for i = 1, #Owners do
				if Owners[i] ~= Owners[1] then
					AllSame = false
				end
			end
		end
		
		if AllSame then
			ToLose = {}
			if IsTeamGame then
				TeamID = game.ServerGame.Game.Players[game.ServerGame.LatestTurnStanding.Territories[Hills[1] ].OwnerPlayerID].Team;
				for TerrID, Terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
					if not Terr.IsNeutral and TeamID ~= game.ServerGame.Game.Players[Terr.OwnerPlayerID].Team then
						table.insert(ToLose, TerrID)
					end
				end
			else
				PlayerID = game.ServerGame.LatestTurnStanding.Territories[Hills[1] ].OwnerPlayerID;
				for TerrID, Terr in pairs(game.ServerGame.LatestTurnStanding.Territories) do
					if not Terr.IsNeutral and PlayerID ~= Terr.OwnerPlayerID then
						table.insert(ToLose, TerrID)
					end
				end
			end
			local Effect = {};
			local DoEffect = false;
			for _,terr in pairs(ToLose) do
				Effect[tablelength(Effect)+1] = WL.TerritoryModification.Create(terr); 
				Effect[tablelength(Effect)].SetOwnerOpt = WL.PlayerID.Neutral;
				DoEffect = true
			end
			if DoEffect then
				if IsTeamGame then
					message = "";
					for playerID, player in pairs(game.ServerGame.Game.Players) do
						if player.Team == TeamID then
							if message == "" then
								message = player.DisplayName(nil, false);
							else
								message = message .. " and " .. player.DisplayName(nil, false);
							end
						end
					end 
					addNewOrder(WL.GameOrderEvent.Create(WL.PlayerID.Neutral, message .." captured all hills. They win!", {}, Effect));
				else
					addNewOrder(WL.GameOrderEvent.Create(PlayerID, game.ServerGame.Game.PlayingPlayers[PlayerID].DisplayName(nil, false) .." captured all hills. They win!", {}, Effect));
				end
			end
		end
	end
end

function tablelength(t)
	local count = 0;
	for _,elem in pairs(t)do
		count = count + 1;
	end
	return count;
end