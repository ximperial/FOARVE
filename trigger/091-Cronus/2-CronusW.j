//TESH.scrollpos=0
//TESH.alwaysfold=0
scope CronusW

    private struct Missile extends Missiles
    
    unit c
    integer i
    
    method onPeriod takes nothing returns boolean
        if IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) == false then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
        endif
        call SetUnitFlyHeight(c, .z, 0)
        set i = i + 1
        if i >= 5 then
            set i = 0
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, randomAngle(), 0, 0, GetRandomReal(0.8, 1.4), 1, 255, 255, 255, 0)
        endif

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SetUnitFlyHeight(c, 0, 0)
        set c = null
    endmethod
    
endstruct

function Trig_CronusW_Func001 takes nothing returns nothing
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
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 20 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Cronus_2.mp3")
        call SoundStart("war3mapImported\\Cronus_2-1.mp3")
        call SetUnitAnimation(c, "spell five")
        call SetUnitTimeScale(c, 1.5)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", c, "hand right")
        call SaveEffectHandle(ht, GetHandleId(z), 2, e)
        set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", c, "hand left")
        call SaveEffectHandle(ht, GetHandleId(z), 3, e)
        set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", c, "foot left")
        call SaveEffectHandle(ht, GetHandleId(z), 4, e)
        set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", c, "foot right")
        call SaveEffectHandle(ht, GetHandleId(z), 5, e)
        set x = PolarX(GetUnitX(t), -100, a)
        set y = PolarY(GetUnitY(t), -100, a)
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 80, x, y, 0)
        set move.c = c
        set move.duration = 0.4
        set move.arc = 30
        set move.i = 0
        call move.launch()
    endif
    if count == 10 then
        call SetUnitAnimation(c, "spell slam six")
    endif
    if count == 25 then 
        call SoundStart("war3mapImported\\Cronus_2-2.mp3")
        call Effect("war3mapImported\\fire-boom-newGreen.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\afbzd.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A05U')) * GetHeroInt(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 4))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 5))
    endif
    if count >= 25 and count <= 55 then
        if count > 40 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
    endif
    if count == 55 then
        call SetUnitFlyHeight(t, 0, 0)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

endscope

function Trig_CronusW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05U' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_CronusW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_CronusW takes nothing returns nothing
    set gg_trg_CronusW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CronusW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_CronusW, function Trig_CronusW_Actions)
endfunction