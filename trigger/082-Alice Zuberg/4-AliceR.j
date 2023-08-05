//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AliceR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real x2
    local real y2
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local real randomA
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 100 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Alice_4.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\AliceR.tga", 255, 255, 255, 0, 255, 255, 255, 255)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call ShakeCamera(2, GetOwningPlayer(c), 10)
        call SetUnitAnimationByIndex(c, 10)
        call lockUnit(t, 1.5, true)
        call Effect("war3mapimported\\zygz.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6) 
        call Effect("war3mapimported\\reimuLS-yellow.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 4, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
    endif
    if count <= 100 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
            call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
            call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), GetRandomReal(80, 120), randomAngle(), 0, 0, GetRandomReal(0.6, 1), 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), GetRandomReal(80, 120), randomAngle(), 0, 0, GetRandomReal(0.85, 1.5), 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        endif
    endif
    if count == 100 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
    endif
    if count == 100 or count == 130 or count == 160 or count == 190 then
        call SoundStart("war3mapImported\\Aya_5-2.mp3")
    endif
    if count >= 100 and count <= 200 then
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        call GroupEnumUnitsInRange(gGroup, x , y , 550, null)
		loop
			set gUnit = GroupForEachUnit(gGroup)
			exitwhen gUnit == null
			if FilterGeneral(c, gUnit) then
				call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A0I7')) * GetHeroAgi(c, true)) / 100)
                call IssueImmediateOrderById(gUnit, 851972)
			endif
		endloop
		call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set randomA = randomAngle()
            set x2 = PolarX(x, GetRandomReal(-300, 300), randomA)
            set y2 = PolarY(y, GetRandomReal(-300, 300), randomA)
            call Effect("war3mapimported\\effect_alice04.mdx", x2, y2, 250, randomAngle(), 0, 0, 0.6, 1.5, 255, 255, 255, 255)
        endif
    endif
    if count == 200 then 
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_AliceR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0I7' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AliceR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AliceR takes nothing returns nothing
    set gg_trg_AliceR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AliceR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AliceR, function Trig_AliceR_Actions)
endfunction