//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AkameF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Akame_6.mp3")
        call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitTimeScale(c, 1.1)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Akame_6-1.mp3")
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 110, a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        call Effect("war3mapImported\\[A]Sand3.mdl", x, y, 110, a, - 90, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 40 then
        set x = PolarX(GetUnitX(t), 25, a)
        set y = PolarY(GetUnitY(t), 25, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Akame_6-2.mp3")
    endif
    if count >= 20 and count <= 50 then
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist > 50 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 12, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 12, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(c), - 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c), - 30, a))
        endif
        if count > 35 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 20, 0)
        endif
    endif
    if count == 50 then
        call SetUnitFlyHeight(c, 0, 0)
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\Akame_6-3.mp3")
        loop
            exitwhen i > 3
            set x = PolarX(GetUnitX(t), GetRandomReal(- 250, 250), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 250, 250), randomAngle())
            call Effect("war3mapimported\\blood-rou.mdx", x, y, 100, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapimported\\File00003933.mdx", x, y, 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), randomAngle())
            call Effect("war3mapimported\\bloodex1.mdx", x, y, 100, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set i = i + 1
        endloop
    endif
    if count == 65 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_AkameF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FT' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AkameF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AkameF takes nothing returns nothing
    set gg_trg_AkameF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkameF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkameF, function Trig_AkameF_Actions)
endfunction