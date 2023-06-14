//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ZweiT_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
	local real x = LoadReal(ht, GetHandleId(z), 0)
	local real y = LoadReal(ht, GetHandleId(z), 1)
	local real x1
	local real y1
	local real ux
	local real uy
	local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
	local integer i = 0
	local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
	local effect e
	local real RC
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z), 0, count)
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Reinforce_5.mp3")
        call SetUnitAnimationByIndex(c, 6)
		call UnitAddAbility(c, 'Amrf')
		call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 400, 0)
		call VisionArea(GetOwningPlayer(c), 1500, 6, GetUnitX(c), GetUnitY(c))
		call Effect("war3mapimported\\VoidDrown.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
		call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
		call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
	endif
	if count >= 10 and count <= 50 then
		set iterator = iterator + 1
		call SaveInteger(ht, GetHandleId(z), 1, iterator)
		if iterator >= 2 then
			call SaveInteger(ht, GetHandleId(z), 1, 0)
			call Effect("war3mapImported\\dustwaveanimate2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), randomAngle(), 0, 0, GetRandomReal(0.65, 2), 1.5, 255, 50, 255, PercentTo255(60))
			call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
			call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
			call Effect("war3mapImported\\dustwaveanimate2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), randomAngle(), 0, 0, GetRandomReal(1.5, 3.5), 1.5, 255, 50, 255, PercentTo255(80))
			call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
			call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
		endif
	endif
	if count == 50 then
		set x1 = PolarX(GetUnitX(c), 20, a)
		set y1 = PolarY(GetUnitY(c), 20, a)
		call Effect("war3mapImported\\Starlight Charge.mdx", x1, y1, 550, a, 0, 0, 3, 6, 255, 255, 255, 255)
		call AnimEffect(bj_lastCreatedEffect, 1, 0.6)
		call TimeScaleEffect(bj_lastCreatedEffect, 0, 1.1)
		call Effect("war3mapImported\\scjj.mdx", GetUnitX(c), GetUnitY(c), 400, randomAngle(), 0, 0, 0.8, 6, 255, 255, 255, 255)
	endif
	if count <= 100 then
		call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2500, null)
		loop
			set gUnit = GroupForEachUnit(gGroup)
			exitwhen gUnit == null
			if not IsUnitInGroup(gUnit, g) then 
		  call GroupAddUnit(g, gUnit)
			endif
			call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
		endloop
		call GroupClear(gGroup)
	endif
	if count == 100 then
		call ForGroup(g, function ResetMoveSpeed)
		call DestroyGroup(g)
	endif
	if count == 90 or count == 120 or count == 150 or count == 180 or count == 210 or count == 240 or count == 270 or count == 300 or count == 330 then
		call SoundStart("war3mapImported\\biu3.mp3")
	endif
    if count == 80 then
        call SaveInteger(ht, GetHandleId(z), 1, 0)
    endif
	if count >= 80 and count <= 350 then
		set iterator = iterator + 1
		call SaveInteger(ht, GetHandleId(z), 1, iterator)
		if iterator >= 15 then
			call SaveInteger(ht, GetHandleId(z), 1, 0)
			set ux = GetUnitX(c)
			set uy = GetUnitY(c)
            set i = 1
            loop
                exitwhen i > 2
                set RC = LoadReal(ht, GetHandleId(z), 2) + 10
                set x1 = PolarX(ux, GetRandomReal(200, 1600), a + RC)
                set y1 = PolarY(uy, GetRandomReal(200, 1600), a + RC)
                if RC >= 30 then
                    set RC = 20
                endif
                call SaveReal(ht, GetHandleId(z), 2, RC)
                call Effect("war3mapImported\\moonwrath-purple.mdx", x1, y1, 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call GroupEnumUnitsInRange(gGroup, x1, y1, 450, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then 
                        call DamageUnit(c, gUnit, 0.8 * GetHeroInt(c, true))
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif 
                endloop
                call GroupClear(gGroup)
                
                set x1 = PolarX(ux, GetRandomReal(200, 1600), a)
                set y1 = PolarY(uy, GetRandomReal(200, 1600), a)
                call Effect("war3mapImported\\moonwrath-purple.mdx", x1, y1, 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call GroupEnumUnitsInRange(gGroup, x1, y1, 450, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then 
                        call DamageUnit(c, gUnit, 0.8 * GetHeroInt(c, true))
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif 
                endloop
                call GroupClear(gGroup)
                
                set RC = LoadReal(ht, GetHandleId(z), 3) - 10
                set x1 = PolarX(ux, GetRandomReal(200, 1600), a + RC)
                set y1 = PolarY(uy, GetRandomReal(200, 1600), a + RC)
                if RC <= -30 then
                    set RC = -20
                endif
                call SaveReal(ht, GetHandleId(z), 3, RC)
                call Effect("war3mapImported\\moonwrath-purple.mdx", x1, y1, 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call GroupEnumUnitsInRange(gGroup, x1, y1, 450, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(c, gUnit) then 
                        call DamageUnit(c, gUnit, 0.8 * GetHeroInt(c, true))
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif 
                endloop
                call GroupClear(gGroup)
                
                set i = i + 1
            endloop
		endif
        set iterator = LoadInteger(ht, GetHandleId(z), 2) + 1
        call SaveInteger(ht, GetHandleId(z), 2, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call Effect("war3mapImported\\baise-magic-shousuo_purple.mdx", GetUnitX(c), GetUnitY(c), 500, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        endif
	endif
	if count == 360 then
		call SetUnitFlyHeight(c, 0, 0)
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call SetUnitInvulnerable(c, false)
		call IssueImmediateOrderById(c, 851972)
		call FlushChildHashtable(ht, GetHandleId(z))
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
	set g = null
	set e = null
endfunction
  
function Trig_ZweiT_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local real x = GetSpellTargetX()
	local real y = GetSpellTargetY()
	if GetSpellAbilityId() == 'A09J' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
		call SaveReal(ht, GetHandleId(z), 0, x)
		call SaveReal(ht, GetHandleId(z), 1, y)
		call SaveReal(ht, GetHandleId(z), 2, 10)
        call SaveReal(ht, GetHandleId(z), 3, -10)
		call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
		call TimerStart(z, 0.02, true, function Trig_ZweiT_Func001)
	endif
	set z = null
	set c = null
endfunction
  
//===========================================================================
function InitTrig_ZweiT takes nothing returns nothing
	set gg_trg_ZweiT = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_ZweiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_ZweiT, function Trig_ZweiT_Actions )
endfunction