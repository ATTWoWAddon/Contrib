WARFRONT = createHeader({
	readable = "Warfront",
	constant = "WARFRONT",
	-- #if AFTER BFA
	export = true,
	-- #endif
	icon = "Interface\\Icons\\Ability_Warrior_OffensiveStance",
	text = {
		en = [[~select(1,GetCategoryInfo(15308))]],
	},
});