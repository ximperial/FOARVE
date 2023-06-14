//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShanaD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Shana_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 19)
        call Effect("war3mapImported\\s_RunningFlame Aura.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.8, 3, 255, 255, 255, 255)
        call Effect("war3mapImported\\black.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.6, 2.5, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call lockUnit(gUnit, 1.4, false)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 75 then
        call Effect("war3mapImported\\SunStrikeImpact2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\TenpaJyousaifxbyDeckai.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.7, 2, 255, 255, 255, 255)
        loop 
            exitwhen i > 8
            set x = PolarX(GetUnitX(c), GetRandomReal(- 900, 900), randomAngle())
            set y = PolarY(GetUnitY(c), GetRandomReal(- 900, 900), randomAngle())
            call Effect("war3mapimported\\fireleaf.mdx", x, y, 25, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\firebbic.mdx", x, y, 25, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            set i = i + 1
        endloop
    endif
    if count == 80 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
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

function Trig_ShanaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0C7' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShanaD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ShanaD takes nothing returns nothing
    set gg_trg_ShanaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShanaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ShanaD, function Trig_ShanaD_Actions )
endfunction