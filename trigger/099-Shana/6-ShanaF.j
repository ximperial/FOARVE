//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShanaF_Func001 takes nothing returns nothing
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
        if GetRandomInt(1, 2) == 1 then 
            call SoundStart("war3mapImported\\Shana_6.mp3")
        else
            call SoundStart("war3mapImported\\Shana_6-1.mp3")
        endif
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 20)
        call Effect("war3mapimported\\zunt.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.1)
        call Effect("war3mapimported\\black.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 25 then
        call SetUnitTimeScale(c, 0)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 1000, 5000)
    endif
    if count == 35 then
        call SetUnitAnimationByIndex(c, 19)
        call SetUnitTimeScale(c, 1)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFlyHeight(c, 0, 6666)
    endif
    if count == 45 then
        call SoundStart("war3mapImported\\Shana_6-2.mp3")
        call Effect("war3mapimported\\AFB_dabaozha.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        loop 
            exitwhen i > 11
            set x = PolarX(GetUnitX(c), GetRandomReal(- 900, 900), randomAngle())
            set y = PolarY(GetUnitY(c), GetRandomReal(- 900, 900), randomAngle())
            call Effect("war3mapimported\\LW11.mdx", x, y, 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\fireleaf.mdx", x, y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\firebbic.mdx", x, y, 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 11 * GetHeroInt(c, true))
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

function Trig_ShanaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0C6' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_ShanaF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ShanaF takes nothing returns nothing
    set gg_trg_ShanaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShanaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ShanaF, function Trig_ShanaF_Actions )
endfunction