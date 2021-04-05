function Client_SaveConfigureUI(alert)
	Mod.Settings.NumberOfHills = math.min(math.max(1, NumberOfHillsSlider.GetValue()), 20);
	Mod.Settings.SizeOfHills = math.max(0, SizeOfHillsSlider.GetValue());
end