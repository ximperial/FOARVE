//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_LeviR_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Levi_4.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapimported\\Levi.mdx", GetUnitX(c), GetUnitY(c), 0, GetUnitFacing(c), 0, 0, 1.85, 3.7, 255, 255, 255, 255) 
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, GetUnitFacing(c), 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Levi_4-1.mp3")
    endif
    if count <= 140 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetEffectX(e, PolarX(GetUnitX(t), 600, a))
        call SetEffectY(e, PolarY(GetUnitY(t), 600, a))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call SetSpecialEffectYaw(e, a + 90)
        call SaveReal(ht, GetHandleId(z), 0, a + 5)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BlackBlink.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 145 then
        set a = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
        call SetSpecialEffectYaw(e, a)
        call SetSpecialEffectAnimationByIndex(e, 6)
        set iterator = 0
        call SaveInteger(ht, GetHandleId(z), 1, 0)
    endif
    if count >= 145 and count <= 175 then
        call SetEffectX(e, PolarX(GetEffectX(e), 35, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 35, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\punchshot.mdx", GetEffectX(e), GetEffectY(e), 25, GetSpecialEffectYaw(e), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 175 then
        call SoundStart("war3mapImported\\Levi_4-2.mp3")
        call Effect("war3mapimported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 185 then 
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0EL')) * GetHeroAgi(c, true))
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

function Trig_LeviR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EL' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_LeviR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_LeviR takes nothing returns nothing
    set gg_trg_LeviR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LeviR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_LeviR, function Trig_LeviR_Actions)
endfunction