//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_EmiyaD_Func001 takes nothing returns nothing
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
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Emiya_7.mp3")
        call SoundStart("war3mapImported\\Emiya_7-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1000, 11, GetUnitX(t), GetUnitY(t))
        set x = PolarX(GetUnitX(c), -100, a)
        set y = PolarY(GetUnitY(c), -100, a)
        call Effect("war3mapImported\\EX Light.mdl", x, y, 25, randomAngle(), 0, 0, 1, 5, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 15, 15, 255)
        call Effect("war3mapImported\\herosaber.mdl", x, y, 0, a, 0, 0, 1, 12, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 50 or count == 100 or count == 150 or count == 200 or count == 250 or count == 300 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call Effect("war3mapImported\\EX Light.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 5, 255, 255, 255, 255)
    endif
    if count <= 500 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 3), 1, 255, 255, 0, PercentTo255(GetRandomReal(20, 40)))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 500 then
        call SoundStart("war3mapImported\\Emiya_7-2.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 1)
        call Effect("", GetEffectX(e), GetEffectY(e), 0, GetSpecialEffectYaw(e), 0, 0, 1, 1.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 500 and count <= 550 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set x = PolarX(GetEffectX(e), 50, GetSpecialEffectYaw(e))
        set y = PolarY(GetEffectY(e), 50, GetSpecialEffectYaw(e))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\poweraura.mdl", GetEffectX(e), GetEffectY(e), 150, GetSpecialEffectYaw(e), - 70, 0, 1 + (count - 500) * 0.06, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AncientExplodeOrange&Yellow.mdl", GetEffectX(e), GetEffectY(e), 25, GetSpecialEffectYaw(e), 0, 0, 0.5 + (count - 500) * 0.02, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 550 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_EmiyaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0DC' then 
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_EmiyaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EmiyaD takes nothing returns nothing
    set gg_trg_EmiyaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EmiyaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EmiyaD, function Trig_EmiyaD_Actions )
endfunction