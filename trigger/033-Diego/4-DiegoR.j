//TESH.scrollpos=27
//TESH.alwaysfold=0
scope DiegoR

    private struct Missile extends Missiles
    
    unit c
    effect e
    
    method onPeriod takes nothing returns boolean
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        
        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call Effect("war3mapImported\\[A]bloodex.mdl", .x, .y, 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, .x, .y, 400, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, (0.35 + 0.05 * GetUnitAbilityLevel(c, 'A0D2')) * GetHeroStr(c, true))
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set c = null
        set e = null
    endmethod
    
endstruct
function Trig_DiegoR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real x2
    local real y2
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count <= 30 then
        set x1 = PolarX(x, GetRandomReal(800, 1100), randomAngle())
        set y1 = PolarY(y, GetRandomReal(800, 1100), randomAngle())
        set x2 = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
        set y2 = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
        set a = Angle(x1, y1, x2, y2)
        set move = Missile.create(x1, y1, GetRandomReal(700, 1200), x2, y2, 0)
        set move.c = c
        set move.duration = 0.3
        call Effect("war3mapImported\\[DoFT]DiegoKnife.mdl", move.x, move.y, move.z, a, -45, 0, 3, 1, 255, 255, 255, 255)
        set move.e = bj_lastCreatedEffect
        call move.launch()
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction
endscope

function Trig_DiegoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0D2' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_DiegoR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_DiegoR takes nothing returns nothing
    set gg_trg_DiegoR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DiegoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_DiegoR, function Trig_DiegoR_Actions )
endfunction