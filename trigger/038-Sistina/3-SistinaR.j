//TESH.scrollpos=27
//TESH.alwaysfold=0
scope SistinaR

    private struct Missile extends Missiles
    
    unit c
    effect e
    
    method onPeriod takes nothing returns boolean
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        
        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SetSpecialEffectAnimation(e, "death")
        call Effect("war3mapImported\\sistinaboom.mdl", .x, .y, 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call GroupEnumUnitsInRange(gGroup, .x, .y, 400, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A0GT')) * GetHeroStr(c, true)) / 27)
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set c = null
        set e = null
    endmethod
    
endstruct
function Trig_SistinaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local Missile move
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sistina_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 10 or count == 20 or count == 30 then
        call SoundStart("war3mapImported\\Sistina_4-1.mp3")
    endif
    if count <= 30 then
        set x1 = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
        set y1 = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 50, x1, y1, 50)
        set move.c = c
        set move.duration = 0.4
        call Effect("war3mapImported\\sistinatoushe.mdl", move.x, move.y, move.z, a, 0, 0, 1.4, 2, 255, 255, 255, 255)
        set move.e = bj_lastCreatedEffect
        set move.curve = GetRandomReal(- 10, 10)
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

function Trig_SistinaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0GT' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_SistinaR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_SistinaR takes nothing returns nothing
    set gg_trg_SistinaR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SistinaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_SistinaR, function Trig_SistinaR_Actions )
endfunction