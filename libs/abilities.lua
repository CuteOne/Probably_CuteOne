-- Initialize tables
if not cute then cute = {} end
 --cute.ttd("target")
 --cute.GroupInfo()
 --cute.behind()
-- --cute.SymMem()
--cute.dummy()
--cute.timecheck()

function cute.Ber() --Berserk
	if cute.ttd("target")>=18
	then 
		return true
	else
		return false
	end
end

function cute.Cy() --Cyclone
	if UnitExists("focus") 
		and IsSpellInRange(GetSpellInfo(33786),"focus")==1  
	then
		return true
	else
		return false
	end
end

function cute.RB() --Rebirth
	if UnitExists("mouseover") 
		and UnitIsDeadOrGhost("mouseover") 
		and UnitCanCooperate("player", "mouseover")     
		and not cute.LineOfSight("mouseover")
		and IsSpellInRange(GetSpellInfo(20484),"mouseover")==1 
	then
		return true
	else
		return false
	end
end

function cute.RV() --Revive
	if UnitCanCooperate("player", "mouseover")     
		and not cute.LineOfSight("mouseover")
		and IsSpellInRange(GetSpellInfo(20484),"mouseover")==1
		and UnitExists("mouseover")
		and UnitIsDeadOrGhost("mouseover")
	then
		return true
	else
		return false
	end
end

function cute.FF() --Faerie Fire
	if (UnitAffectingCombat("player")==1 or (UnitAffectingCombat("player")==nil and select(2,IsInInstance())=="none")) 
		and (cute.war()==0 or cute.wac() < 3) 
	then 
		return true
	else
		return false
	end
end

function cute.FB() --Ferocious Bite
	if not cute.HaveBuff("player",{139121,139117,139120})
		and ((cute.thp()<=25 and ((cute.rpr() > 0 and cute.rpr()<=4) or cute.ttd("target")<=4)) 
			or (cute.rpp() < 108 and cute.rpr() > 6 and GetComboPoints("player") >= 5 and cute.pow() >= 50)) 
	then
		return true
	else
		return false
	end
end

function cute.CF() --Cat Form
	if not ((UnitCastingInfo("player") and select(9,UnitCastingInfo("player"))) or select(8,UnitChannelInfo("player"))) 
		and (((UnitAffectingCombat("player")==1 or IsOutdoors()==nil) 
			and not (IsMounted() or UnitBuffID("player",40120))) 
				or (UnitExists("target") and not UnitBuffID("player",768)))
	then
		return true
	else
		return false
	end
end

function cute.AF() --Aquatic Form
	if IsSwimming() then 
		return true
	else
		return false
	end
end

function cute.TrF() --Travel Form
	if not IsFlyableArea() 
		and IsOutdoors() 
		and not IsSwimming() 
	then
		return true
	else
		return false
	end
end

function cute.HT() --Healing Touch
	if cute.psr() < 1.5 or GetComboPoints("player")>=4 then
		return true
	else
		return false
	end
end

function cute.MA() --Maim
	if (select(2,GetInstanceInfo())=="arena" or select(2,GetInstanceInfo())=="pvp") then
		return true
	else
		return false
	end
end

-- function cute.Lac() --Lacerate
	-- cute.initial()
	-- if incom and ubid(p,bf) and cd(lac)==0 then
		-- return true
	-- else 
		-- return false
	-- end
-- end

function cute.MglOp() --Mangle: Opener
	if not SpellIsTargeting() 
		and (UnitLevel("player") < 54 or cute.GlyphCheck(127540)==false	or cute.behind("target")==false) 
		and UnitIsPVP("player")==nil
	then
		return true
	else
		return false
	end
end

-- function cute.Mbf() --Mangle: Bear Form
	-- cute.initial()
	-- if incom and ubid(p,bf) and cd(mbf)==0 and hastar then
		-- return true
	-- else
		-- return false
	-- end
-- end

function cute.MotW() --Mark of the Wild
	cute.GroupInfo()
	if (not IsMounted() or UnitBuffID("player",40120)) then
		for i=1,#cutemembers do 
			if not cute.HaveBuff(cutemembers[i].Unit,{115921,20217,1126,90363}) 
				and (#cutemembers==select(5,GetInstanceInfo()) or select(2,IsInInstance())=="none") 
			then 
				return true 
			else
				return false
			end
		end
	else
		return false
	end
end

-- function cute.ML() --Maul
	-- cute.initial()
	-- if incom and ubid(p,bf) and cd(ml)==0 and pow>=60 then
		-- return true
	-- else
		-- return false
	-- end
-- end

function cute.Pause() --Pause
	if IsMounted()
		or SpellIsTargeting()
		or not UnitExists("target")
		or UnitBuffID("player",80169)
		or UnitBuffID("player",87959)
		or UnitChannelInfo("player") 
		or UnitIsDeadOrGhost("player") 
		or UnitIsDeadOrGhost("target")
		or UnitBuffID("target",117961) --Impervious Shield - Qiang the Merciless
		or UnitDebuffID("player",135147) --Dead Zone - Iron Qon: Dam'ren
		or UnitBuffID("target",143593) --Defensive Stance - General Nagrazim
		or UnitBuffID("target",140296) --Conductive Shirld - Thunder Lord / Lightning Guardian
		or not UnitAffectingCombat("Player")
	then 
		return true 
	else
		return false
	end
end

function cute.Pnc() --Pounce
	if not SpellIsTargeting() 
		and UnitIsPVP("player") --Code better checks for PvP Servers
		and not UnitCanCooperate("player", "target")  
		and cute.behind("target")==true
	then
		return true
	else
		return false
	end	
end

function cute.RK() --Rake
	if (cute.rrr() > 0.5 and cute.rkr() < 9 and cute.rrr()<=1.5) 
		or cute.rkr() < 3
		or ((cute.ttd("target")-cute.rkr()) > 3 and (cute.crkd() > cute.rkd() or (cute.rkr() < 3 and cute.rkp()>=75)))
	then
		return true
	else
		return false
	end
end

function cute.RkAoE()	--Rake AoE
	if cute.rkr() < 3 
		and cute.ttd("target") >= 15 
	then
		return true
	else
		return false
	end
end

function cute.Rvg() --Ravage: Opener
	if not SpellIsTargeting() 
		and (UnitBuffID("player",81022) or IsStealthed()) 
		and not UnitCanCooperate("player", "target")  
		and UnitIsPVP("player")==nil 
		and cute.behind("target")==true
	then
		return true
	else
		return false
	end
end

function cute.Rej() --Rejuvination
	if  not SpellIsTargeting()
		and (UnitAffectingCombat("player")~=1 or UnitLevel("player")<26) 
		and not UnitBuffID("player",774) 
	then 
		return true
	else
		return false
	end
end

-- function cute.RC() --Remove Corruption
	-- cute.initial()
	-- if ValidDispel("player") and cd(rc)==0 and cp > 0 and pow>=35 and ((select(2,GetInstanceInfo())~="arena" and select(2,GetInstanceInfo())~="pvp") or outcom) then
		-- return true
	-- elseif ValidDispel("mouseover") and cd(rc)==0 then
		-- return true
	-- else
		-- return false
	-- end
-- end

function cute.RP() --Rip
	if (cute.bossID()~=63053 and cute.ttd("target") > 4) 
		and ((GetComboPoints("player")>=5 and cute.rpr()==0) or (GetComboPoints("player")>=4 and cute.rpp()>=95 and cute.ttd("target") > 30 and cute.rrr() > 0 and cute.rrr()<=11.5) or (GetComboPoints("player")>=5 and ((cute.rpr() < 6 and cute.thp() > 25) or (cute.rpp() > 108 and (cute.rscbuff() == 0 or cute.rscbuff>=7))) and cute.ttd("target")>=15))
	then
		return true
	else
		return false
	end
end

function cute.SR() --Savage Roar
	if not UnitCanCooperate("player", "target") and (cute.srr()<=1 and cute.pow()>=25 and (cute.GlyphCheck(127540)==true or GetComboPoints("player") > 0))
		or ((cute.GlyphCheck(127540)==true or GetComboPoints("player") > 0) and cute.rpr() > 0 and cute.rpr() < 10 and (12 + (GetComboPoints("player")*6))>=(cute.srr() + 12) and cute.srrpdiff() <= 4 and cute.pow()>=25)
	then 
		return true
	else
		return false
	end
end

function cute.FRvg() --Ravage: Filler
	if (UnitBuffID("player",102543) and cute.pow()>=45) 
		or UnitBuffID("player",81022) 
	then
		return true
	else
		return false
	end
end

function cute.RkF() --Rake: Filler
	if (cute.ttd("target") - cute.rkr()) > 3 and ((cute.crkd() * ((cute.rkr()/3) + 1)) - (cute.rkd() * (cute.rkr()/3))) > cute.mgld() then
		return true
	else
		return false
	end
end

function cute.ShrF() --Shred: Filler (Glyph)
	if ((UnitBuffID("player",106951) or UnitBuffID("player",106951) or select(2, GetPowerRegen("player"))>=15) and cute.GlyphCheck(127540)==true 
		or cute.behind("target")==true)
	then
		return true
	else
		return false
	end
end

-- function cute.SWB() --Swipe: Bear Form
	-- cute.initial()
	-- if ubid(p,bf) and incom and pow>=15 and cd(sw)==0 then
		-- return true
	-- else
		-- return false
	-- end
-- end

function cute.Thr() --Thrash
	if ((cute.ttd("target")>=6 and (cute.bossID() ~= 69700 or cute.bossID() ~= 69701)) 
		and ((cute.thrr() < 9 and cute.rrr() > 0 and cute.rrr()<=1.5 and cute.rpr() > 0)
			or (cute.thrr()<=3 and cute.rpr() > 3 and cute.rkr() > 3 and UnitBuffID("player",135700))))
	then
		return true
	else
		return false
	end
end

-- function cute.ThrB() --Thrash: Bear Form
	-- cute.initial()
	-- if incom and ubid(p,bf) and cd(thb)==0 then
		-- return true
	-- else
		-- return false
	-- end
-- end

function cute.ThrAoE() --Thrash: AoE
	if cute.pow()>=50 and cute.rrr() > 0 or cute.thrr() < 3 or (UnitBuffID("player",5217) and cute.thrr() < 9) then 
		return true
	else
		return false
	end
end

function cute.KotJ() --Tier 4 Talent: King of the Jungle
	if cute.ttd("target")>=15 then 
		return true
	else
		return false
	end
end

function cute.FoN() --Tier 4 Talent: Force of Nature
	if (((cute.dex() > 0 and cute.dex()<=1) or UnitBuffID("player",146310)) and GetSpellCharges(106737)> 0)
		or (GetSpellCharges(106737) == 3 and cute.rrr()==0 and cute.rscr()==0 and cute.Nova_CheckLastCast(106737,1))
		or (((cute.rscr() < 5 and cute.rscbuff()==10) or (cute.rrr() > 0 and cute.rrr() < 1)) and GetSpellCharges(106737) > 0)
		or (cute.ttd("target") < 20 and GetSpellCharges(106737) > 0)
	then
		return true
	else
		return false
	end
end

function cute.HotW() --Tier 6 Talent: Heart of the Wild
--	cute.initial()
--	if ubid(p,how) then
--		if check(mf) and not udbid(t,mf) then
--			cast(gsi(mf))
--		elseif check(wth) then
--			cast(gsi(wth))
--		end
--	else
		return false
--	end
end

function cute.NV() --Tier 6 Talent: Nature's Vigil
	if cute.ttd("target")>=15 then 
		return true
	else
		return false
	end
end
