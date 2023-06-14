//TESH.scrollpos=27
//TESH.alwaysfold=0
function Trig_YamajiQ_Func001 takes nothing returns nothing
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
    if count == 1 then
        call SoundStart("war3mapImported\\Yamaji_1.mp3")
        call SoundStart("war3mapImported\\Yamaji_1-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        if GetUnitTypeId(c) == 'H0FV' then
            call SetUnitAnimationByIndex(c, 4)
        else
            call SetUnitAnimationByIndex(c, 3)
        endif
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]Holy_Fire_Slam3.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
    endif
    if count == 5 then
        call Effect("war3mapImported\\File0000 (84).mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 10 then 
        call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 100, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 400, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 700, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 1000, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 400, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 700, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 1000, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0BA'))
            endif 
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_YamajiQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0BA' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_YamajiQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_YamajiQ takes nothing returns nothing
    set gg_trg_YamajiQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YamajiQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_YamajiQ, function Trig_YamajiQ_Actions )
endfunction