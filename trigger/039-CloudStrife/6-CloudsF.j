//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_CloudsF_Func001 takes nothing returns nothing
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
		call SoundStart("war3mapImported\\Satomi_4.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), -600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), -600, a))
		call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.85)
		call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
	endif
	if count == 5 or count == 15 then
		call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
		call Effect("war3mapImported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
		call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
	endif
	if count > 1 and count <= 20 then 
		if dist > 140 then 
			call SetUnitX(c, PolarX(GetUnitX(c), dist / 14, a))
			call SetUnitY(c, PolarY(GetUnitY(c), dist / 14, a))
		else
			call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
			call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
		endif
	endif
	if count == 15 then
        call SoundStart("war3mapImported\\Cloud_6.mp3")
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Cloud_6-1.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
		call Effect("war3mapImported\\blueslash.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 4, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapImported\\uissb.mdx", GetUnitX(c), GetUnitY(c), 100, a, -45, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\uissb.mdx", GetUnitX(t), GetUnitY(t), 100, a, -45, 0, 1.5, 1, 255, 255, 255, 255)
	endif
    if count >= 20 and count <= 40 then
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Cloud_6-2.mp3")
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Cloud_6-3.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), -120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), -120, a))
        call SetUnitFlyHeight(c, 600, 0)
        call SetUnitAnimationByIndex(c, 16)
    endif
    if count == 55 then
        call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx", GetUnitX(t), GetUnitY(t), 600, a, -315, 0, 1.35, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\DT112.mdx", GetUnitX(t), GetUnitY(t), 600, a, -315, 0, 1.35, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
	if count == 60 then 
		call SoundStart("war3mapImported\\Cloud_6-4.mp3")
        set x = PolarX(GetUnitX(t), 300, a)
        set y = PolarY(GetUnitY(t), 300, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), -120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), -120, a))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call ShakeCamera(1, GetOwningPlayer(c), 10)
        call ShakeCamera(1, GetOwningPlayer(t), 15)
		call Effect("war3mapImported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
	if count == 70 then 
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call PauseUnit(t, false)
		call SetUnitInvulnerable(c, false)
		call SetUnitInvulnerable(t, false)
		call DamageUnit(c, t, 11 * GetHeroStr(c, true))
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

function Trig_CloudsF_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local unit t = GetSpellTargetUnit()
	if GetSpellAbilityId() == 'A0IH' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call PauseUnit(t, true)
		call SetUnitInvulnerable(t, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveUnitHandle(ht, GetHandleId(z), 1, t)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
		call TimerStart(z, 0.02, true, function Trig_CloudsF_Func001)
	endif
	set z = null
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_CloudsF takes nothing returns nothing
	set gg_trg_CloudsF = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_CloudsF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_CloudsF, function Trig_CloudsF_Actions )
endfunction