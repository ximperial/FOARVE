//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_RyuzakiF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ryuzaki_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then
        call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 50, randomAngle(), 0, 0, GetRandomReal(1, 1.45), 1.5, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.6))
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Ryuzaki_4-1.mp3")
        loop
            exitwhen i > 1
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
            call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            set i = i + 1
        endloop
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Ryuzaki_6-1.mp3")
        loop
            exitwhen i > 1
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
            call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            set i = i + 1
        endloop
    endif
    if count == 65 then
        call SoundStart("war3mapImported\\Ryuzaki_4-2.mp3")
        loop
            exitwhen i > 1
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
            call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(c) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            set i = i + 1
        endloop
    endif
    if count <= 70 then 
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        if count <= 40 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 3, 0)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 3, 0)
        endif
        if count >= 40 and count <= 60 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 4, 0)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 4, 0)
        endif
        if count >= 60 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        endif
    endif
    if count == 75 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroStr(c, true))
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

function Trig_RyuzakiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GB' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RyuzakiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyuzakiF takes nothing returns nothing
    set gg_trg_RyuzakiF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyuzakiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyuzakiF, function Trig_RyuzakiF_Actions )
endfunction