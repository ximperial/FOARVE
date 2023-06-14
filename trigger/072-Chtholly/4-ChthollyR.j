//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ChthollyR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Chtholly_4.mp3")
        call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitFacing(c, a)
    endif
    if count == 10 or count == 20 or count == 30 then
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count >= 10 and count <= 35 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        call SetUnitFacingEx(c, GetUnitFacing(c) + 14.4, true)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 3.5, 1, 0, 160, 255, 255)
            call Effect("war3mapImported\\zxd2.mdx", GetUnitX(c) , GetUnitY(c) , 100, a , 0, 0, 3, 1, 255, 255, 255, PercentTo255(85))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        endif
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Chtholly_2-2.mp3")
    endif
    if count == 40 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call Effect("war3mapimported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 100, a + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\kdls2.mdx", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 3, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1, 0, 160, 255, 255)
    endif
    if count == 45 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0FK')) * GetHeroAgi(c, true))
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

function Trig_ChthollyR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FK' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ChthollyR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ChthollyR takes nothing returns nothing
    set gg_trg_ChthollyR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChthollyR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ChthollyR, function Trig_ChthollyR_Actions)
endfunction