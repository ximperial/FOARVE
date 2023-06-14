//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KenshinE_Func001 takes nothing returns nothing
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
    if count == 1 then
        call SoundStart("war3mapImported\\Kenshin_3.mp3")
        call SoundStart("war3mapImported\\Kenshin_3-1.mp3")
        call SoundStart("war3mapImported\\Kenshin_3-2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 13)
        call SetUnitTimeScale(c, 1.3)
        call Effect("war3mapimported\\DTJJ.mdx", GetUnitX(c) , GetUnitY(c), 25, a, 0, 0, 2, 1.5, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 5 then
        call SoundStart("war3mapImported\\Kenshin_3-2.mp3")
    endif
    if count <= 10 then
        set x = PolarX(GetUnitX(c) , 120, a)
        set y = PolarY(GetUnitY(c) , 120, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0CU')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\DGDDXZ4.mdx", GetUnitX(c) , GetUnitY(c) , 200, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\DGDDXZ4.mdx", GetUnitX(c) , GetUnitY(c) , 200, a , - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\DGDDXZ4.mdx", GetUnitX(c) , GetUnitY(c) , 200, a + 180 , - 45, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 10 then
        if HaveSavedBoolean(ht, KenshinEHash, GetHandleId(c)) then
            call RemoveSavedBoolean(ht, KenshinEHash, GetHandleId(c))
        endif
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

function Trig_KenshinE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0CU' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call TimerStart(z, 0.02, true, function Trig_KenshinE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KenshinE takes nothing returns nothing
    set gg_trg_KenshinE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshinE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KenshinE, function Trig_KenshinE_Actions)
endfunction