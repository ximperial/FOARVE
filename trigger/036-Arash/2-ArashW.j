//TESH.scrollpos=39
//TESH.alwaysfold=0
scope ArashW
    private struct Missile extends Missiles
    
    unit c
    effect e
        
    method onPeriod takes nothing returns boolean
        local real angle = Angle(.x, .y, .impact.x, .impact.y)
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        call SetSpecialEffectOrientation(e, angle, .effect.pitch, .effect.roll)
        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        call SetSpecialEffectAnimation(e, "death")
        set c = null
        set e = null
    endmethod
        
endstruct

function Trig_ArashW_Func001 takes nothing returns nothing
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
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Arash_2.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 10 then
        call Effect("war3mapImported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitFlyHeight(c, 600, 0)
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Cronus_1-1.mp3")
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 600, GetUnitX(t), GetUnitY(t), 10)
        set move.c = c
        set move.duration = 0.4
        call Effect("Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", GetUnitX(c), GetUnitY(c), move.origin.z, move.origin.angle, move.origin.alpha, 0, 3, 1.5, 255, 255, 255, 255)
        set move.e = bj_lastCreatedEffect
        call move.launch()
    endif
    if count == 25 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 35 then
        call Effect("war3mapImported\\fireeffectorange.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\firessl.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 40 then 
        call Effect("war3mapImported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 600, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0H6')) * GetHeroStr(c, true))
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

endscope

function Trig_ArashW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0H6' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ArashW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ArashW takes nothing returns nothing
    set gg_trg_ArashW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ArashW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ArashW, function Trig_ArashW_Actions )
endfunction