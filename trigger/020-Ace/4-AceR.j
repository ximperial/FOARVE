//TESH.scrollpos=27
//TESH.alwaysfold=0
function Trig_AceR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_4.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 0.05)
        call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedHarvest.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\buff_fire.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 0, dist)
    endif
    if count <= 40 then
        set dist = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetEffectX(e), dist / 40, a)
        set y = PolarY(GetEffectY(e), dist / 40, a)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, 200 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\buff_fire.mdl", GetEffectX(e), GetEffectY(e), 200, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(80))
        endif
    endif
    if count == 40 then
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapImported\\qj3.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 0, dist)
    endif
    if count >= 40 and count <= 70 then
        set dist = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetEffectX(e), dist / 30, a)
        set y = PolarY(GetEffectY(e), dist / 30, a)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, 200 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\buff_fire.mdl", GetEffectX(e), GetEffectY(e), 200, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Ace_4-1.mp3")
        call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_FenShenDaBaoPo_2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]Nuke2.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 7, 1, 255, 255, 255, 255)
    endif
    if count == 80 then
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0AF')) * GetHeroStr(c, true))
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

function Trig_AceR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AF' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AceR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_AceR takes nothing returns nothing
    set gg_trg_AceR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceR, function Trig_AceR_Actions )
endfunction