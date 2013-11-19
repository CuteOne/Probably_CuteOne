-- ProbablyEngine Rotation Packager
-- Custom Feral Combat Druid Rotation
-- Created on Nov 2nd 2013 10:35 pm

 ProbablyEngine.rotation.register_custom(103, "CuteOne - Feral", 
 {	 --In Combat
 {"pause", {	--Pause Rotation
	"@cute.Pause()"
}}, 
 {"!/pe aoe", {	--Toggle AoE
	"modifier.rshift",
 }},
 {"!/pe cd", {	--Toggle Cooldowns
	"modifier.rcontrol",
 }},
 {{		--Interrupts
	{"33786", {		--Cyclone: Focus Target
		"@cute.Cy()",
		"player.spell(33786).cooldown = 0"
	}, "focus"}, 
	{"5211", {		--Mighty Bash
		"player.spell(5211).cooldown = 0",	--Mighty Bash
		"player.range <= 8",
		"player.spell(80965).cooldown != 0",	--Skull Bash
		"player.spell(80965).cooldown <= 14",	--Skull Bash
		"target.casting"
	}, "target"}, 
	{"80965", {		--Skull Bash
		"player.spell(80965).cooldown = 0",	--Skull Bash
		"target.casting"
	}, "target"}, 
	{"132469", {	--Typhoon
		"player.spell(132469).cooldown = 0",	--Typhoon
		"target.casting"
	}, "target"}, 
	{"22570", {		--Maim
		"@cute.MA()",
		"player.spell(22570).cooldown != 0",	--Skull Bash
		"target.casting",
		"player.combopoints > 0",
		"player.energy >= 35"
	}, "target"}, 
  }, "modifier.interrupts"},
 {{		--Defensives
	{"22812", {	--Barkskin
		"!player.buff(5215)",	--Prowl
		"player.health <= 50"
	}}, 
	{"106922", {	--Might of Ursoc
		"!player.buff(5215)",	--Prowl
		"player.health <= 30"
	}}, 
	{"61336", {	--Survival Instincts
		"!player.buff(5215)",	--Prowl
		"player.health <= 25"
	}}, 
	{"22842", {	--Frenzied Regeneration
		"!player.buff(5215)",	--Prowl
		"player.buff(106922)"
	}}, 
	{"20484", {	--Rebirth
		"@cute.RB()",
		"!player.casting",
		"player.buff(69369)",	--Predatory Swiftness
		"player.spell(20484).cooldown = 0"
	}, "mouseover"}, 
 },},
 {{		--Cooldowns
	{"26297", {		--Racial: Troll Berserking
		"player.spell(26297).exists",	--Racial: Troll Berserking
		"!player.buff(5215)",			--Prowl
		"player.energy >= 75",
		"player.buff(127538)",			--Savage Roar
		"player.buff(5217)",			--Tiger's Fury
		"player.range <= 8"
	}}, 
	{"#gloves", {	--Profession: Engineering Hands
		"!player.buff(5215)",	--Prowl
		"player.energy >= 75",
		"player.buff(127538)",	--Savage Roar
		"player.buff(5217)",	--Tiger's Fury
		"!player.buff(106951)",	--Berserk
		"player.range <= 8"
	}}, 
	{"106951", {	--Berserk
		"@cute.Ber()",
		"player.buff(768)",					--Cat Form
		"!player.buff(5215)",				--Prowl
		"player.energy >= 75",
		"player.buff(127538)",				--Savage Roar
		"player.buff(5217)",				--Tiger's Fury
		"player.range <= 8",
		"player.spell(5217).cooldown > 6"	--Tiger's Fury
	}}, 
	{"106731", {	--Tier 4 Talent: Incarnation - King of the Jungle
		"@cute.KotJ()",
		"player.spell(106731).exists",	--King of the Jungle
		"!player.buff(5215)",	--Prowl
		"player.buff(127538)",	--Savage Roar
		"player.buff(5217)",	--Tiger's Fury
		"player.buff(106951)",	--Berserk
		"player.range <= 8",
		"player.spell(106731).exists"	--Incarnation
	}}, 
	{"106737", {	--Tier 4 Talent: Force of Nature
		"@cute.FoN()",
		"player.spell(106737).exists",	--Force of Nature
		"!player.buff(5215)",				--Prowl
		"player.spell(106737).cooldown = 0",	--Force of Nature
		"player.range <= 8"
	}}, 
	{"124974", {	--Tier 6 Talent: Nature's Vigil
		"@cute.NV()",
		"player.spell(124974).exists",	--Nature's Vigil
		"!player.buff(5215)",			--Prowl
		"player.energy >= 75",
		"player.buff(127538)",			--Savage Roar
		"player.buff(5217)",			--Tiger's Fury
		"player.range <= 8"
	}}, 
 }, "modifier.cooldowns"},
 {{		--Multitarget Rotation
	{"770", {	--Faerie Fire AoE
		"@cute.FF()",
		"player.range <= 8",
		"target.health > 25",
		"player.spell(770).cooldown = 0", --Faerie Fire
		"!target.debuff(113746)", --Weakened Armor
		"!player.buff(5215)" --Prowl
	}, "target"}, 
	{"127538", {	--Savage Roar AoE
		"@cute.SR()",
		"player.buff(768)", --Cat Form
		"player.range <= 20"
	}},
	{"5217", {  	--Tiger's Fury AoE
		"player.buff(768)", --Cat Form
		"player.spell(5217).cooldown = 0", --Tiger's Fury
		"player.range <= 8",
		"player.energy < 35",
		"!player.buff(106951)", --Berserk
		"!player.buff(135700)" --Clearcasting
	}}, 
	{"106830", {	--Thrash AoE
		"@cute.ThrAoE()",
		"player.buff(768)", --Cat Form
		"player.level >= 28",
		"player.range <= 8"
	}},
	{"1079", {		--Rip AoE
		"player.combopoints >= 5",
		"player.buff(768)", --Cat Form
		"player.buff(127538)", --Savage Roar
		"!player.buff(135700)", --Clearcasting
		"player.range <= 8"
	}},
	{"1822", {		--Rake AoE
		"@cute.RkAoE()",
		"player.buff(768)", --Cat Form
		"player.range <= 8",
		"!player.buff(135700)",	--Clearcasting
		"player.buff(127538)" --Savage Roar
	}},
	{"62078", {		--Swipe
		"player.buff(768)", --Cat Form
		"player.range <= 8",
		"player.buff(127538)", --Savage Roar
		"target.debuff(106830).duration > 0",	--Thrash
	}},
 }, "modifier.multitarget"},
 {{		--Single Rotation
	{"127538", {	--Savage Roar
		"@cute.SR()",
		"player.buff(768)", --Cat Form
		"player.range <= 20"
	}}, 
	{"770", {		--Faerie Fire
		"@cute.FF()",
		"player.range <= 8",
		"target.health > 25",
		"player.spell(770).cooldown = 0", --Faerie Fire
		"!target.debuff(113746)", --Weakened Armor
		"!player.buff(5215)" --Prowl
	}, "target"}, 
	{"5217", {  	--Tiger's Fury
		"player.buff(768)", --Cat Form
		"player.spell(5217).cooldown = 0", --Tiger's Fury
		"player.range <= 8",
		"player.energy < 35",
		"!player.buff(106951)", --Berserk
		"!player.buff(135700)" --Clearcasting
	}}, 
	{"106830", { 	--Thrash
		"@cute.Thr()",
		"player.buff(768)", --Cat Form
		"player.level >= 28",
		"player.range <= 8" 
	}, "target"}, 
	{"22568", { 	--Ferocious Bite
		"@cute.FB()",
		"player.buff(768)", --Cat Form
		"player.buff(127538)", --Savage Roar
		"player.range <= 8"
	}, "target"},
	{"5185", {		--Healing Touch
		"@cute.HT()",
		"player.level >= 26",
		"player.spell(108373).exists", --Dream of Cenarius Talent
		"player.buff(69369)", --Predatory Swiftness
		"!player.buff(145152)" --Dream of Cenarius Damage Buff
	}, "player"}, 
	{"1079", {		--Rip
		"@cute.RP()",
		"player.buff(768)", --Cat Form
		"player.buff(127538)", --Savage Roar
		"!player.buff(135700)", --Clearcasting
		"player.range <= 8"
	}, "target"}, 
	{"1822", {		--Rake
		"@cute.RK()",
		"player.buff(768)", --Cat Form
		"player.range <= 8",
		"!player.buff(135700)",	--Clearcasting
		"player.buff(127538)" --Savage Roar
	}, "target"}, 
	{"6785", {		--Ravage: Combo Point Building
		"@cute.FRvg()",
		"player.buff(768)", --Cat Form
		"!player.buff(5215)", --Prowl
		"player.range <= 8",
		"player.combopoints < 5"
	}, "target"},
	{"1822", {		--Rake: Combo Point Building
		"@cute.RkF()",
		"player.buff(768)", --Cat Form
		"!player.buff(5215)", --Prowl
		"player.range <= 8",
		"!player.buff(135700)",	--Clearcasting
		"player.combopoints < 5"
	}, "target"}, 
	{"5221", {		--Shred: Combo Point Building
		"@cute.ShrF()",
		--"@cute.behind()",
		--"player.behind",
		"player.buff(768)", --Cat Form
		"!player.buff(5215)", --Prowl
		"player.range <= 8",
		"player.combopoints < 5",
		"!player.buff(102534)" --Incarnation: King of the Jungle
	}, "target"}, 
	{"33876", { 	--Mangle: Combo Point Building
		"player.buff(768)", --Cat Form
		"!player.buff(5215)", --Prowl
		"player.range <= 8",
		"player.combopoints < 5", 
		"!player.buff(106731)" --Incarnation: King of the Jungle
	}, "target"}, 
 }, "!modifier.multitarget"},
 },
 {	-- Out of Combat
 {"!/pe aoe", {	--Toggle AoE
	"modifier.rshift",
 }},
 {"!/pe cd", {	--Toggle Cooldowns
	"modifier.rcontrol",
 }},
 {"50769", {	--Revive
	"@cute.RV()",
	"!player.casting",
 }, "mouseover"},
 {"768", { 		--Cat Form
	"@cute.CF()",
	"!player.buff(768)",	--Cat Form
	"!player.buff(108288)",	--Heart of the Wild	
	"player.buff(1126)" 	--Mark of the Wild
 }},
 {"1066", {		--Aquatic Form
	"@cute.AF()",
	"!player.casting",
	"!player.buff(1066)"	--Aquatic Form
 }}, 
 {"783", {		--Travel Form
	"@cute.TrF()",
	"!player.buff(768)",		--Cat Form
	"player.moving"
}}, 
 {"!/cancelform", {	--Unshapeshift - Rejuvination Cast
	"!modifier.alt",
	"!player.buff(5215)",	--Prowl
	"!player.buff(80169)",	--Food
	"!player.buff(87959)",	--Drink
	"!player.casting",
	"player.alive",
	"!player.buff(774)",
	"player.health <= 70",
	"player.form != 0"
 }}, 
 {"774", {		--Rejuvination
	"@cute.Rej()",
	"!modifier.alt",
	"!player.buff(5215)",	--Prowl
	"!player.buff(80169)",	--Food
	"!player.buff(87959)",	--Drink
	"!player.casting",
	"player.alive",
	"!player.buff(774)",
	"player.health <= 70"
 }}, 
 {"!/cancelform", {	--Unshapeshift - Mark of the Wild Cast
	"!player.buff(1126)", 
	"player.form != 0"
 }}, 
 {"1126", {  	--Mark of the Wild
	"@cute.MotW()",
	"!player.buff(40120)",
	"player.level >= 62",
	"player.form = 0",
	"!player.buff(104934)", --Eating
	"!player.buff(104269)", --Drinking	
 }, "player"},  
 {"5215", {		--Prowl
	"!player.buff(5212)",	--Prowl
	"player.buff(768)",		--Cat Form
	"target.exists",
	"target.alive",
	"player.range < 20"
 }}, 
 {"127538", {	--Savage Roar
	"@cute.SR()",
	"player.buff(768)", --Cat Form
	"player.range <= 20",
	"target.exists",
	"target.alive"
 }}, 
 {"Ravage", {		--Ravage - Opener
	"@cute.Rvg()",
	"@cute.behind()",
	"!modifier.alt",
	"!player.casting",
	"player.alive",
	"player.buff(127538)",	--Savage Roar
	"player.range <= 8",
	"player.buff(768)",		--Cat Form	
 }, "target"}, 
 {"9005", {		--Pounce
	"@cute.Pnc()",
	"@cute.behind()",
	"!modifier.alt",
	"!player.casting",
	"player.alive",
	"player.buff(127538)",	--Savage Roar
	"player.range <= 8",
	"player.buff(768)",		--Cat Form
	"player.buff(5215)",		--Prowl
	"player.level >= 32",
	"player.energy >= 50"
 }, "target"}, 
 {"33876", {	--Mangle: Opener
	"@cute.MglOp()",
	"!modifier.alt",
	"!player.casting",
	"player.alive",
	"player.buff(127538)",	--Savage Roar
	"player.range <= 8",
	"player.buff(768)"		--Cat Form	
 }, "target"}, 
 {"pause", {	--Pause Rotation
	"@cute.Pause()",
 }}, 
 })