//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KirinD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local effect e 
    local real dmg
    local group g
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kirin_5-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\shoc2.mdx", GetUnitX(c) , GetUnitY(c) , 60, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 1, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call Effect("war3mapimported\\shoc2.mdx", GetUnitX(c) , GetUnitY(c) , 60, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call Effect("war3mapimported\\shoc2.mdx", GetUnitX(c) , GetUnitY(c) , 60, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 15 or count == 30 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count <= 20 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 1)
        set x = PolarX(GetEffectX(e) , 65, a)
        set y = PolarY(GetEffectY(e) , 65, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        set g = LoadGroupHandle(ht, GetHandleId(z), 4)
        set dmg = (3 + 0.1 * GetUnitAbilityLevel(c, 'A0HO')) * GetHeroInt(c, true)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, dmg)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\[A]Sand3.mdx", GetEffectX(e) , GetEffectY(e), 25, a, 0, 0, 0.8, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
    endif
    if count >= 15 and count <= 35 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 2)
        set x = PolarX(GetEffectX(e) , 70, a)
        set y = PolarY(GetEffectY(e) , 70, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        set g = LoadGroupHandle(ht, GetHandleId(z), 5)
        set dmg = (3 + 0.1 * GetUnitAbilityLevel(c, 'A0HO')) * GetHeroInt(c, true)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, dmg)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count >= 30 and count <= 50 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 3)
        set x = PolarX(GetEffectX(e) , 70, a)
        set y = PolarY(GetEffectY(e) , 70, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        set g = LoadGroupHandle(ht, GetHandleId(z), 6)
        set dmg = (3 + 0.1 * GetUnitAbilityLevel(c, 'A0HO')) * GetHeroInt(c, true)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, dmg)
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 20 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 1)
        call SetSpecialEffectAnimation(e, "death")
    endif
    if count == 35 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 2)
        call SetSpecialEffectAnimation(e, "death")
    endif
    if count == 50 then
        set e = LoadEffectHandle(ht, GetHandleId(z) , 3)
        call SetSpecialEffectAnimation(e, "death")
    endif
    if count == 50 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(LoadGroupHandle(ht, GetHandleId(z), 4))
        call DestroyGroup(LoadGroupHandle(ht, GetHandleId(z), 5))
        call DestroyGroup(LoadGroupHandle(ht, GetHandleId(z), 6))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_KirinD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0HT' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 4, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z), 5, CreateGroup())
        call SaveGroupHandle(ht, GetHandleId(z), 6, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KirinD_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KirinD takes nothing returns nothing
    set gg_trg_KirinD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KirinD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KirinD, function Trig_KirinD_Actions)
endfunction