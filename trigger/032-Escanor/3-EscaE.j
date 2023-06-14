//TESH.scrollpos=48
//TESH.alwaysfold=0
function Trig_EscaE_Func001 takes nothing returns nothing
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
    if count <= 30 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        if GetRandomInt(1, 2) == 1 then 
            call SoundStart("war3mapImported\\Escanor_3.mp3")
        else
            call SoundStart("war3mapImported\\Escanor_3-1.mp3")
        endif
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 11)
        call SetUnitTimeScale(c, 2.25)
        call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count == 1 or count == 20 or count == 40 then
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
    endif
    if count <= 20 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        if count > 10 then 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 20, 0)
        endif
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Escanor_3-2.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\XZDL2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        loop
            exitwhen i > 5
            set x = PolarX(GetUnitX(t), 400, i * 60)
            set y = PolarY(GetUnitY(t), 400, i * 60)
            call Effect("war3mapImported\\SZBYAFB2.mdl", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 30 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0CG')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 30 and count <= 60 then
        if count > 45 then 
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 15, 0)
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 15, 0)
        endif
    endif
    if count == 60 then
        call SetUnitFlyHeight(t, 0, 0)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_EscaE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CG' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EscaE_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EscaE takes nothing returns nothing
    set gg_trg_EscaE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EscaE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EscaE, function Trig_EscaE_Actions )
endfunction