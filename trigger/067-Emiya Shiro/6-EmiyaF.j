//TESH.scrollpos=0
//TESH.alwaysfold=0
scope EmiyaF
    private struct Missile extends Missiles
    
    unit c
    group g
    effect e
        
    method onPeriod takes nothing returns boolean
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call DamageUnit(c, gUnit, 0.55 * GetHeroAgi(c, true))
                call IssueImmediateOrderById(gUnit, 851972)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        if not IsTerrainPathable(.x, .y, PATHING_TYPE_FLYABILITY) then
            call SetSpecialEffectPositionEx(e, .x, .y, .z)
        else
            return true
        endif
    
        return false
    endmethod
        
    method onRemove takes nothing returns nothing
        call DestroyGroup(g)
        set c = null
        set g = null
    endmethod
        
endstruct

function Trig_EmiyaF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local real z1
    local real x1
    local real y1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local Missile move
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Emiya_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count <= 90 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 2 or iterator == 5 then
            if iterator == 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
            endif
            set x = PolarX(GetUnitX(c), -50, a)
            set y = PolarY(GetUnitY(c), -50, a)
            if GetRandomInt(1, 2) == 1 then
                set x = PolarX(GetUnitX(c), GetRandomReal(0, 500), a + 90)
                set y = PolarY(GetUnitY(c), GetRandomReal(0, 500), a + 90)
            else
                set x = PolarX(GetUnitX(c), GetRandomReal(0, 500), a - 90)
                set y = PolarY(GetUnitY(c), GetRandomReal(0, 500), a - 90)
            endif
            set z1 = GetRandomReal(30, 170)
            set x1 = PolarX(x, 1600, a)
            set y1 = PolarY(y, 1600, a)
            set move = Missile.create(x, y, z1, x1, y1, z1)
            set move.c = c
            call Effect("war3mapImported\\ToonBoomBlue.mdl", x, y, z1, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\LongSword.mdl", x, y, z1, a, 0, 0, 1.25, 2.4 - count * 0.02, 255, 255, 255, 255)
            set move.e = bj_lastCreatedEffect
            set move.duration = 0.4
            set move.g = CreateGroup()
            call SaveInteger(ht, GetHandleId(z), 4 + LoadInteger(ht, GetHandleId(z), 2), move)
            call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + 1)
        endif
    endif
    if count <= 90 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 2500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
        endloop
        call GroupClear(gGroup)
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Emiya_6-1.mp3")
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count >= 90 and count <= 120 then
        set move = LoadInteger(ht, GetHandleId(z), 4 + LoadInteger(ht, GetHandleId(z), 3))
        call move.launch()
        call SaveInteger(ht, GetHandleId(z), 3, LoadInteger(ht, GetHandleId(z), 3) + 1)
    endif
    if count == 120 then
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
    set g = null
endfunction
endscope

function Trig_EmiyaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0DB' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveInteger(ht, GetHandleId(z), 2, 0)
        call SaveInteger(ht, GetHandleId(z), 3, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_EmiyaF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_EmiyaF takes nothing returns nothing
    set gg_trg_EmiyaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EmiyaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EmiyaF, function Trig_EmiyaF_Actions )
endfunction