//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohkaT_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_5.mp3")
        call SetUnitAnimationByIndex(c, 8)
        set x = PolarX(GetUnitX(c), 120, a)
        set y = PolarY(GetUnitY(c), 120, a)
        call Effect("war3mapImported\\[A]fense-lizi-toushewu.mdl", x, y, 80, a, 0, 0, 1, 6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapImported\\wind3.mdl", x, y, 80, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        set x = PolarX(GetUnitX(c), 120, a)
        set y = PolarY(GetUnitY(c), 120, a)
        call Effect("war3mapImported\\[A]tx_paomo2213.mdl", x, y, 150, a, 0, 0, 1, 4, 255, 255, 255, PercentTo255(70))
        call Effect("war3mapImported\\TohkaEf3.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 2.3, 4, 255, 255, 255, PercentTo255(70))
        call Effect("war3mapImported\\az_zise-xuanwo.mdl", GetUnitX(c), GetUnitY(c), 50, a, - 90, 0, 1.8, 4, 255, 255, 255, PercentTo255(70))
    endif
    if count == 25 then
        call SetUnitTimeScale(c, 0)
    endif
    if count <= 210 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.5, 1.3), 1.5, 255, PercentTo255(40), 255, PercentTo255(GetRandomReal(40, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.3, 0.7))
            set x = PolarX(GetUnitX(c), 120, a)
            set y = PolarY(GetUnitY(c), 120, a)
            call Effect("war3mapImported\\[DoFT]AZ_Alleria_R3.mdl", x, y, 50, a, 0, 0, 1.6, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.5, 2))
        endif
    endif
    if count == 210 then
        call SoundStart("war3mapImported\\Tohka_5-1.mp3")
        call SetUnitTimeScale(c, 0.5)
    endif
    if count >= 210 and count <= 230 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e), dist / 20, a)
        set y = PolarY(GetEffectY(e), dist / 20, a)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, 80 + GetAxisZ(x, y))
    endif
    if count == 230 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectScale(e, 3)
        call SetSpecialEffectAnimation(e, "death")
        call SetSpecialEffectTimeScale(e, 0.6)
        call Effect("war3mapImported\\TohkaEf5.mdl", GetUnitX(t), GetUnitY(t), 25, a, - 45, 0, 3.5, 1.5, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapImported\\[DoFT]PurpleAz-hit.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[DoFT]PurpleAz-hit.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\FadeSpearPurple.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[A]TohkaExp.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, PercentTo255(60), 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.75, 1.5, 255, PercentTo255(60), 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\TohkaEf4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1.5, 255, PercentTo255(60), 255, PercentTo255(20))
    endif
    if count == 235 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
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

function Trig_TohkaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05S' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_TohkaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TohkaT takes nothing returns nothing
    set gg_trg_TohkaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohkaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_TohkaT, function Trig_TohkaT_Actions)
endfunction