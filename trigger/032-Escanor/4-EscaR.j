//TESH.scrollpos=36
//TESH.alwaysfold=0
function Trig_EscaR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Escanor_4.mp3")
        call SoundStart("war3mapImported\\Escanor_4-1.mp3")
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 4.5)
    endif
    if count == 10 then
        call SetUnitFlyHeight(t, 150, 0)
        call Effect("war3mapImported\\asknhq.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 10, 3, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 100 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SoundStart("war3mapImported\\Escanor_4-2.mp3")
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapImported\\shuozhu1.mdl", x, y, 25, randomAngle(), 0, 0, GetRandomReal(0.5, 1), 0.6, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\zunt.mdl", x, y, 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, 255)
            call AnimEffect(bj_lastCreatedEffect, 0, 0.6)
        endif
    endif
    if count == 100 or count == 130 or count == 150 then
        call Effect("war3mapImported\\shuozhu2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 105 then
        call SoundStart("war3mapImported\\Escanor_4-3.mp3")
    endif
    if count == 160 then 
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0CH')) * GetHeroStr(c, true))
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

function Trig_EscaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CH' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EscaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EscaR takes nothing returns nothing
    set gg_trg_EscaR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EscaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EscaR, function Trig_EscaR_Actions )
endfunction