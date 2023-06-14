//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuR_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Reimu_4.mp3")
        call SoundStart("war3mapImported\\Reimu_4-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapImported\\reimuLS.mdl", x, y, 40, a, 0, 0, 1.5, 3, 255, 255, 255, 255)
    endif
    if count <= 100 then
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                if GetUnitAbilityLevel(c, 'B01P') > 0 then
                    call DamageUnit(c, gUnit, ((0.3 * GetUnitAbilityLevel(c, 'A08G') + (6 + 2 * GetUnitAbilityLevel(c, 'A08H'))) * GetHeroInt(c, true)) / 90) 
                else
                    call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A08H')) * GetHeroInt(c, true)) / 90)
                endif
                if count >= 10 then
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\Ethereal Lightning.mdl", x, y, 25, a, 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
    endif
    if count == 100 then
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

function Trig_ReimuR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A08H' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_ReimuR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ReimuR takes nothing returns nothing
    set gg_trg_ReimuR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ReimuR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ReimuR, function Trig_ReimuR_Actions )
endfunction