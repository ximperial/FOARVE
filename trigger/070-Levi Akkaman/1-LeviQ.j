//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_LeviQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Levi_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c) , GetUnitY(c) , 100, a , 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c) , 80, a)
        set y = PolarY(GetUnitY(c) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call Effect("war3mapimported\\BloodEX.mdx", GetUnitX(gUnit) , GetUnitY(gUnit) , 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0EI'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\redslash2a.mdx", GetUnitX(c) , GetUnitY(c) , 0, a + count * 12 , 0, 0, 3.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\redslash2a.mdx", GetUnitX(c) , GetUnitY(c) , 0, a + 180 + count * 12 , 0, 0, 3.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call Effect("war3mapImported\\zxd1.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 5, 1, 255, 255, 255, 255)
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

function Trig_LeviQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0EI' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_LeviQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_LeviQ takes nothing returns nothing
    set gg_trg_LeviQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LeviQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_LeviQ, function Trig_LeviQ_Actions)
endfunction