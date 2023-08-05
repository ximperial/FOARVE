//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_ChthollyQ_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Chtholly_1.mp3")
        call SoundStart("war3mapImported\\Chtholly_1-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Chtholly_1-2.mp3")
        call Effect("war3mapImported\\kdls2.mdx", GetUnitX(c) , GetUnitY(c) , 350, a , 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapImported\\SBXZAFB2.mdx", GetUnitX(c) , GetUnitY(c) , 0, a , 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
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
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0FH'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\zxd2.mdx", GetUnitX(c) , GetUnitY(c) , 100, a , 0, 0, 3, 1, 255, 255, 255, PercentTo255(85))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
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

function Trig_ChthollyQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0FH' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ChthollyQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ChthollyQ takes nothing returns nothing
    set gg_trg_ChthollyQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChthollyQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ChthollyQ, function Trig_ChthollyQ_Actions)
endfunction