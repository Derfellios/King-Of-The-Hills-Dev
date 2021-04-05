function Client_GameRefresh(game)

	if game.Us == nil or (not Mod.PlayerGameData.InitialPopupDisplayed and not (game.Game.TurnNumber > 1 or (game.Game.TurnNumber == 1 and not game.Settings.AutomaticTerritoryDistribution))) then
		message = "\n";
		local PublicGameData = Mod.PublicGameData;
		Hills = PublicGameData.Hills;
		for _, Hill in pairs(Hills) do
			message = message .. " - " .. game.Map.Territories[Hill].Name .. "\n";
		end
		if game.Settings.AutomaticTerritoryDistribution then
			message2 = ""
		else
			message2 = "and marked with cities while picking "
		end
		if game.Us == nil then
			message3 = ""
		else
			message3 = "and can be found under 'Game' and 'Mod: King Of The Hills'."
		end 
		UI.Alert("This game includes King of the Hills. Hold all hills at the end of a turn to win. The hills are" .. message .. message2 .. message3)
		local payload = {};
		payload.Message = "InitialPopupDisplayed";
		game.SendGameCustomMessage("Please wait... ", payload, function(reply)end);
	end
end