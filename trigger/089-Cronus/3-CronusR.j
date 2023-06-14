//TESH.scrollpos=0
//TESH.alwaysfold=0
scope CronusR

    private struct Missile extends Missiles
    
    unit c
    unit t
    integer i
        
    method onPeriod takes nothing returns boolean
        local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        local real x1 = PolarX(GetUnitX(c), 140, a)
        local real y1 = PolarY(GetUnitY(c), 140, a)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
            call SetUnitX(t, x1)
            call SetUnitY(t, y1)
        endif
        call SetUnitFlyHeight(c, .z, 0)
        call SetUnitFlyHeight(t, .z + 10, 0)
        set i = i + 1
        if i >= 3 then
            set i = 0
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, randomAngle(), 0, 0, GetRandomReal(0.8, 1.4), 1, 255, 255, 255, 0)
        endif

        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        set c = null
    endmethod
        
endstruct

function Trig_CronusR_Func001 takes nothing returns nothing
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
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Cronus_4.mp3")
        call SoundStart("war3mapImported\\Cronus_4-1.mp3")
        call SoundStart("war3mapImported\\Cronus_4-2.mp3")
        call SetUnitAnimationByIndex(c, 4)
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
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Cronus_4-1.mp3")
        call SoundStart("war3mapImported\\Cronus_4-3.mp3")
        call SetUnitAnimation(c, "spell slam six")
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(c), GetUnitY(c), 100, a, - 90, 0, 2, 1, 0, 255, 0, 255)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_2.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 5, 1, 0, 255, 0, 255)
        set move = Missile.create(GetUnitX(t), GetUnitY(t), 0, PolarX(GetUnitX(t), 600, a), PolarY(GetUnitY(t), 600, a), 0)
        set move.c = c
        set move.t = t
        set move.i = 0
        set move.duration = 0.4
        set move.arc = 40
        call move.launch()
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 35 then 
        call SoundStart("war3mapImported\\Cronus_4-4.mp3")
        call SoundStart("war3mapImported\\Cronus_4-5.mp3")
        call Effect("war3mapImported\\fire-boom-newGreen.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 0, 255, 0, 255)
        call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A05W')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 4))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 5))
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

function Trig_CronusR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05W' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_CronusR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_CronusR takes nothing returns nothing
    set gg_trg_CronusR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CronusR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_CronusR, function Trig_CronusR_Actions)
endfunction