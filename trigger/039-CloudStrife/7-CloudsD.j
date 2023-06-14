//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_CloudsD_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
	local real x
	local real y
	local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local integer i = 0
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z), 0, count)
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	call PauseUnit(t, true)
	call SetUnitInvulnerable(t, true)
	if count == 1 then
		call SoundStart("war3mapImported\\Cloud_7.mp3")
		call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
		call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
		call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
		call SetUnitAnimationByIndex(c, 27)
		call SetUnitTimeScale(c, 2)
		call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
	endif
    if count == 10 then
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 4, 4, 109, 130, 213, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapImported\\AFBWendyfeng.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 3, 255, 255, 255, 255)
    endif
	if count == 15 or count == 35 or count == 55 or count == 75 or count == 95 or count == 115 then
		call Effect("war3mapImported\\[A]RinRfire2.mdx", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
		call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdx", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
		call Effect("war3mapImported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
	endif
    if count == 125 or count == 135 or count == 145 or count == 155 or count == 165 then
        call Effect("war3mapImported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.45), 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.85, 1))
        call Effect("war3mapImported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.2, 1.65), 1, 255, 255, 255, PercentTo255(70))
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 0.85))
        call Effect("war3mapImported\\[Plagiat]Effect392.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Cloud_7-1.mp3")
    endif
	if count >= 115 and count <= 135 or count >= 145 and count <= 170 then 
		if dist > 140 then 
			call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
			call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
		else
			call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
			call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
		endif
	endif
    if count == 130 or count == 165 then
        call SetUnitAnimation(c, "attack")
        call SetUnitTimeScale(c, 1.5)
    endif
	if count == 135 or count == 170 then
        call ShakeCamera(0.6, GetOwningPlayer(c), 10)
		call ShakeCamera(0.6, GetOwningPlayer(t), 5)
		call Effect("war3mapImported\\animeslashfinal.mdx", GetUnitX(c), GetUnitY(c), 120, a, 0, 0, 3, 1, 109, 130, 213, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\AFB_hudie2.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\afbzd.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
	endif
    if count >= 135 and count <= 155 or count >= 170 and count <= 200 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 180 then
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.8)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count == 180 or count == 190 or count == 200 or count == 210 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(80))
    endif
    if count >= 180 and count <= 215 then
        if dist > 140 then 
			call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
			call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
		else
			call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
			call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
		endif
        if count < 195 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 16, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 12, 0)
        endif
    endif
	if count == 215 then 
        call ShakeCamera(1, GetOwningPlayer(c), 15)
		call ShakeCamera(1, GetOwningPlayer(t), 15)
        call SetUnitFlyHeight(c, 0, 0)
		call Effect("war3mapImported\\ChuShou_Effect_Earth1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
		call Effect("war3mapImported\\[a]sand3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
		call Effect("war3mapImported\\[A]bloodex.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
	endif
	if count == 230 then 
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call PauseUnit(t, false)
		call SetUnitInvulnerable(c, false)
		call SetUnitInvulnerable(t, false)
		call DamageUnit(c, t, 8 * GetHeroStr(c, true))
		call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
		call IssueTargetOrderById(c, 851983, t)
		call IssueImmediateOrderById(t, 851972)
		call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
		call FlushChildHashtable(ht, GetHandleId(z))
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
	set t = null
endfunction

function Trig_CloudsD_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local unit t = GetSpellTargetUnit()
	if GetSpellAbilityId() == 'A0II' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call PauseUnit(t, true)
		call SetUnitInvulnerable(t, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveUnitHandle(ht, GetHandleId(z), 1, t)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
		call TimerStart(z, 0.02, true, function Trig_CloudsD_Func001)
	endif
	set z = null
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_CloudsD takes nothing returns nothing
	set gg_trg_CloudsD = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_CloudsD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_CloudsD, function Trig_CloudsD_Actions )
endfunction