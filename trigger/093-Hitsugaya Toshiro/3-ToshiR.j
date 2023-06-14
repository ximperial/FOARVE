//TESH.scrollpos=0
//TESH.alwaysfold=0
scope ToshiR
    private struct Missile extends Missiles
    
    unit c
                
    method onPeriod takes nothing returns boolean
        call Effect("war3mapImported\\hitsugayabfardragonline.mdl", .x, .y, .z, .effect.yaw, .effect.pitch * bj_RADTODEG, 0, 7, 1, 255, 255, 255, 150)
        call Effect("war3mapImported\\az_cocochristmas_d_impact.mdl", .x, .y, .z - 100, .effect.yaw, .effect.pitch * bj_RADTODEG, 0, 4, 1, 255, 255, 255, 150)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            
        return false
    endmethod
                
    method onRemove takes nothing returns nothing
        local real x
        local real y
        set x = PolarX(.x, 250, 90)
        set y = PolarY(.y, 250, 90)
        call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 25, 90, 0, 0, 5, 2, 255, 255, 255, 175)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(.x, 250, 180)
        set y = PolarY(.y, 250, 180)
        call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 25, 180, 0, 0, 5, 2, 255, 255, 255, 175)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(.x, 250, 270)
        set y = PolarY(.y, 250, 270)
        call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 25, 270, 0, 0, 5, 2, 255, 255, 255, 175)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(.x, 250, 360)
        set y = PolarY(.y, 250, 360)
        call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 25, 360, 0, 0, 5, 2, 255, 255, 255, 175)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set c = null
    endmethod
                
endstruct
function Trig_ToshiR_Func001 takes nothing returns nothing
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
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Toshiro_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.4)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "weapon"))
        call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\blueauralance.mdl", c, "weapon"))
        set x = PolarX(GetUnitX(t), - 700, a)
        set y = PolarY(GetUnitY(t), - 700, a)
        set move = Missile.create(x, y, 25, GetUnitX(t), GetUnitY(t), 0)
        set move.c = c
        set move.duration = 0.4
        set move.arc = 45
        call move.launch()
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Toshiro_4-1.mp3")
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0CA')) * GetHeroInt(c, true))
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
endscope

function Trig_ToshiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CA' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ToshiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ToshiR takes nothing returns nothing
    set gg_trg_ToshiR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ToshiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ToshiR, function Trig_ToshiR_Actions)
endfunction