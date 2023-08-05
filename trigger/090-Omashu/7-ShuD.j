//TESH.scrollpos=0
//TESH.alwaysfold=0
scope ShuD

    private struct Missile extends Missiles
    
    unit c
    
    method onPeriod takes nothing returns boolean
        if IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) == false then
            call SetUnitX(c, .x)
            call SetUnitY(c, .y)
        endif
        call SetUnitFlyHeight(c, .z, 0)

        return false
    endmethod
    
    method onRemove takes nothing returns nothing
        call SetUnitFlyHeight(c, 0, 0)
        set c = null
    endmethod
    
endstruct

function Trig_ShuD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Shu_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.5)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("Abilities\\Spells\\Undead\\DeathPact\\DeathPactTarget.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\kaizokusfxbyvalk4.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
        set move = Missile.create(GetUnitX(c), GetUnitY(c), 0, x, y, 0)
        set move.c = c
        set move.duration = 0.4
        set move.arc = 30
        call move.launch()
    endif
    if count == 25 then
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Cleave.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
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

function Trig_ShuD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A05R' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_ShuD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ShuD takes nothing returns nothing
    set gg_trg_ShuD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShuD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ShuD, function Trig_ShuD_Actions )
endfunction