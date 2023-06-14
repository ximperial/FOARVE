//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_CloudsT_Func001 takes nothing returns nothing
	local timer z = GetExpiredTimer()
	local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
	local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
	local integer count = LoadInteger(ht, GetHandleId(z), 0)
	local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local integer iterator2 = LoadInteger(ht, GetHandleId(z), 2)
	local real x
	local real y
    local real ux
    local real uy
	local real randomA
	local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
	local integer i = 0
	set count = count + 1
	call SaveInteger(ht, GetHandleId(z), 0, count)
	call PauseUnit(c, true)
	call SetUnitInvulnerable(c, true)
	call PauseUnit(t, true)
	call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
	if count == 1 then
		call SoundStart("war3mapImported\\Cloud_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
		call SetUnitAnimationByIndex(c, 27)
		call SetUnitTimeScale(c, 2)
        call SetUnitFlyHeight(t, 500, 0)
		call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
		call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
	endif
    if count == 50 then
        call SetUnitX(c, PolarX(GetUnitX(t), -120, a))
		call SetUnitY(c, PolarY(GetUnitY(t), -120, a))
        call SetUnitFlyHeight(c, 500, 0)
        call SetUnitAnimationByIndex(c, 23)
    endif
    if count >= 50 and count <= 120 then
        set x = PolarX(GetUnitX(c), -5, a)
        set y = PolarY(GetUnitY(c), -5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\HakenSaber2.mdx", GetUnitX(c), GetUnitY(c), 520, randomAngle(), 0, 0, GetRandomReal(0.85, 1.25), 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 510, randomAngle(), 0, 0, GetRandomReal(0.75, 1.35), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 510, randomAngle(), 0, 0, GetRandomReal(1.2, 1.9), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Cloud_5-1.mp3")
    endif
	if count >= 110 and count <= 380 then 
		set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set randomA = randomAngle()
            set ux = GetUnitX(t)
            set uy = GetUnitY(t)
            set x = PolarX(ux, GetRandomReal(100, 350), randomA)
            set y = PolarY(uy, GetRandomReal(100, 350), randomA)
            call Effect("war3mapImported\\zhanji-blueX-shu2.mdx", x, y, GetRandomReal(550, 650), randomAngle(), GetRandomReal(-45, -30), 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DT112.mdx", x, y, GetRandomReal(450, 550), randomAngle(), GetRandomReal(-45, -30), 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\uissb.mdx", x, y, GetRandomReal(500, 550), randomAngle(), GetRandomReal(-45, -30), 0, GetRandomReal(2.5, 3.5), 1, 255, 255, 255, 255)
        endif
        
        set iterator2 = iterator2 + 1
        call SaveInteger(ht, GetHandleId(z), 2, iterator2)
        if iterator2 >= 10 then
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            set randomA = randomAngle()
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetUnitX(c, PolarX(x, GetRandomReal(150, 350), randomA))
            call SetUnitY(c, PolarY(y, GetRandomReal(150, 350), randomA))
            call SetUnitFlyHeight(c, GetRandomReal(450, 600), 0)
            set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(c, a, true)
            call SetUnitAnimation(c, "attack")
            call ShakeCamera(0.2, GetOwningPlayer(c), 5)
            call ShakeCamera(0.2, GetOwningPlayer(t), 10)
        endif
	endif
	if count == 390 then
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 1000, 0)
        call SetUnitAnimationByIndex(c, 20)
        call SetUnitTimeScale(c, 1)
	endif
    if count == 400 then
        call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx", GetUnitX(t), GetUnitY(t), 500, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
		call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    endif
	if count >= 390 and count <= 410 then 
		call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 50, 0)
        if count >= 400 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 50, 0)
        endif
	endif
	if count == 410 then 
        call SoundStart("war3mapImported\\Cloud_5-2.mp3")
        call ShakeCamera(1, GetOwningPlayer(c), 10)
        call ShakeCamera(1, GetOwningPlayer(t), 10)
        call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\cleave.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
	endif
	if count == 420 then 
		call SetUnitTimeScale(c, 1)
		call PauseUnit(c, false)
		call PauseUnit(t, false)
		call SetUnitInvulnerable(c, false)
		call SetUnitInvulnerable(t, false)
		call DamageUnit(c, t, 15 * GetHeroStr(c, true))
		call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
		call IssueTargetOrderById(c, 851983, t)
		call IssueImmediateOrderById(t, 851972)
		call FlushChildHashtable(ht, GetHandleId(z))
		call PauseTimer(z)
		call DestroyTimer(z)
	endif
	set z = null
	set c = null
	set t = null
endfunction

function Trig_CloudsT_Actions takes nothing returns nothing
	local timer z
	local unit c = GetTriggerUnit()
	local unit t = GetSpellTargetUnit()
	if GetSpellAbilityId() == 'A0IG' then 
		set z = CreateTimer()
		call PauseUnit(c, true)
		call SetUnitInvulnerable(c, true)
		call PauseUnit(t, true)
		call SetUnitInvulnerable(t, true)
		call SaveUnitHandle(ht, GetHandleId(z), 0, c)
		call SaveUnitHandle(ht, GetHandleId(z), 1, t)
		call SaveInteger(ht, GetHandleId(z), 0, 0)
		call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
		call TimerStart(z, 0.02, true, function Trig_CloudsT_Func001)
	endif
	set z = null
	set c = null
	set t = null
endfunction

//===========================================================================
function InitTrig_CloudsT takes nothing returns nothing
	set gg_trg_CloudsT = CreateTrigger(  )
	call TriggerRegisterAnyUnitEventBJ(gg_trg_CloudsT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddAction( gg_trg_CloudsT, function Trig_CloudsT_Actions )
endfunction