require('AddHills')

function Server_StartGame(game, standing)
	if game.Settings.AutomaticTerritoryDistribution then 
		AddHillsToGame(game, standing)
	else
		local Hills  = Mod.PublicGameData.Hills; -- Remove the icons from the hills
		for _, Hill in pairs(Hills) do
			standing.Territories[Hill].Structures = {}
		end
	end;
end
