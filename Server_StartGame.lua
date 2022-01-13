require('AddHills')

function Server_StartGame(game, standing)
	if game.Settings.AutomaticTerritoryDistribution then 
		AddHillsToGame(game, standing)
	end;
end
