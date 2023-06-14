//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KianaF_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kiana_6.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 0.3)
    endif
    if count == 50 then
        call Effect("war3mapimported\\[DoFT]Kurohitsugib.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.45, 7.5, 255, 255, 255, PercentTo255(90))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.8)
        call TimeScaleEffect(bj_lastCreatedEffect, 1.2, 5.2)
        set x = PolarX(GetUnitX(c), - 50, a)
        set y = PolarY(GetUnitY(c), - 50, a)
        call Effect("war3mapimported\\model (117)_2.mdx", x, y, 25, a, 0, 0, 1.5, 6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 50 and count <= 300 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 30 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            call SetSpecialEffectAnimationByIndex(e, 0)
        endif
    endif
    if count == 300 then
        set x = PolarX(GetUnitX(c), 20, a)
        set y = PolarY(GetUnitY(c), 20, a)
        call Effect("war3mapimported\\model (103)_2.mdx", x, y, 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count >= 300 and count <= 325 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetEffectX(e, PolarX(GetEffectX(e), dist / 25, a))
        call SetEffectY(e, PolarY(GetEffectY(e), dist / 25, a))
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 325 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectAnimation(e, "death")
    endif
    if count == 330 then
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255) 
    endif
    if count == 340 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
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
    set e = null
endfunction

function Trig_KianaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KianaF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KianaF takes nothing returns nothing
    set gg_trg_KianaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KianaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KianaF, function Trig_KianaF_Actions)
endfunction