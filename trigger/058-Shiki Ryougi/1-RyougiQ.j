//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RyougiQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_1.mp3" )
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 1)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\qyddd.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 2, 0.6, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 5 then
        call SoundStart( "war3mapImported\\Ryougi_1-1.mp3" )
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e), 80, a)
        set y = PolarY(GetEffectY(e), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A009'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, GetRandomReal(0.5, 1.25), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind2.mdx", GetEffectX(e), GetEffectY(e), 100, a, - 90, 0, GetRandomReal(0.5, 1.25), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
endfunction

function Trig_RyougiQ_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_1-2.mp3" )
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimation(c, "spell one")
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c), 80, a)
        set y = PolarY(GetUnitY(c), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set dmg = GetUnitAbilityLevel(c, 'B01O') * 0.3
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A009') + (dmg * GetHeroAgi(c, true)))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), GetRandomReal(- 200, 200), randomAngle())
            set y = PolarY(GetUnitY(c), GetRandomReal(- 200, 200), randomAngle())
            call Effect("war3mapimported\\Hit.mdx", x, y, GetRandomReal(80, 140), randomAngle(), - 90, 0, GetRandomReal(1, 1.4), 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(c), GetRandomReal(- 200, 200), randomAngle())
            set y = PolarY(GetUnitY(c), GetRandomReal(- 200, 200), randomAngle())
            call Effect("war3mapimported\\Hit.mdx", x, y, GetRandomReal(80, 140), randomAngle(), - 90, 0, GetRandomReal(1, 1.4), 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\WindExploreEffect(Bigger).mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, PercentTo255(40))
            call SetUnitTimeScale(bj_lastCreatedUnit, 1.2)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 150, a, - 90, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
            call Effect("war3mapimported\\Ultizoro.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, PercentTo255(90))
            call SetUnitTimeScale(bj_lastCreatedUnit, 1.2)
        endif
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_RyougiQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A009' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        if GetUnitAbilityLevel(c, 'B01O') > 0 then
            call TimerStart(z, 0.02, true, function Trig_RyougiQ_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_RyougiQ_Func001)
        endif
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_RyougiQ takes nothing returns nothing
    set gg_trg_RyougiQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyougiQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyougiQ, function Trig_RyougiQ_Actions )
endfunction