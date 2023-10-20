//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShanaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Shana_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 6)
    endif
    if count == 5 then
        call SoundStart("war3mapImported\\Shana_4-1.mp3")
        call SetUnitTimeScale(c, 0)
    endif
    if count == 8 then
        call SoundStart("war3mapImported\\Shana_4-2.mp3")
        call SoundStart("war3mapImported\\Shana_4-3.mp3")
        call Effect("war3mapimported\\bluedashsfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\afbxnntx.mdx", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c), 90, a)
        set y = PolarY(GetUnitY(c), 90, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A0C4')) * GetHeroInt(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 150, a, - 90, 0, GetRandomReal(2, 3), 1, 255, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
            call Effect("war3mapimported\\AFBXZWD.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2, 1, 255, 0, 0, 255)
        endif
    endif
    if count == 15 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
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

function Trig_ShanaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0C4' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ShanaR_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ShanaR takes nothing returns nothing
    set gg_trg_ShanaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShanaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShanaR, function Trig_ShanaR_Actions)
endfunction