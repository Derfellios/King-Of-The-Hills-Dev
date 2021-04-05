function Client_PresentConfigureUI(rootParent)
    if Mod.Settings.NumberOfHills == nil then initial0 = 2; else initial0 = Mod.Settings.NumberOfHills end
	if Mod.Settings.SizeOfHills == nil then initial1 = 10; else initial1 = Mod.Settings.SizeOfHills end
    local vert = UI.CreateVerticalLayoutGroup(rootParent);
    local horz = UI.CreateHorizontalLayoutGroup(vert);
	UI.CreateLabel(horz).SetText('Number of hills in the game');
    NumberOfHillsSlider = UI.CreateNumberInputField(horz)
		.SetSliderMinValue(1)
		.SetSliderMaxValue(5)
		.SetValue(initial0);
		UI.CreateLabel(horz).SetText('Number of armies on each hill');
    SizeOfHillsSlider = UI.CreateNumberInputField(horz)
		.SetSliderMinValue(5)
		.SetSliderMaxValue(15)
		.SetValue(initial1);
end