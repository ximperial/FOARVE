//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_ArashR_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Arash_4.mp3")
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count <= 50 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 1), 1.5, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(c), - 50, a)
            set y = PolarY(GetUnitY(c), - 50, a)
            call Effect("war3mapImported\\model (117)_2.mdx", x, y, 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
    endif
    if count == 50 then
        call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), 0, dist)
    endif
    if count >= 50 and count <= 65 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set dist = LoadReal(ht, GetHandleId(z), 0)
        call SetEffectX(e, PolarX(GetEffectX(e), dist / 15, a))
        call SetEffectY(e, PolarY(GetEffectY(e), dist / 15, a))
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 65 then 
        call SoundStart("war3mapImported\\Cronus_3-3.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimation(e, "death")
        call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 70 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0H8')) * GetHeroStr(c, true))
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
    set e = null
endfunction

function Trig_ArashR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0H8' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ArashR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ArashR takes nothing returns nothing
    set gg_trg_ArashR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ArashR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ArashR, function Trig_ArashR_Actions )
endfunction