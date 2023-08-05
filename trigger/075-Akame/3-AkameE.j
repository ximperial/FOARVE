//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AkameE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local real a2
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Akame_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        set x = PolarX(GetUnitX(c), 500, a)
        set y = PolarY(GetUnitY(c), 500, a)
        call Effect("war3mapimported\\Black.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        set x = PolarX(GetUnitX(c), 1200, a)
        set y = PolarY(GetUnitY(c), 1200, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
            set a = a + 180
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        call SetUnitAnimationByIndex(c, 10)
        call SaveReal(ht, GetHandleId(z), 1, 30)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Akame_3-1.mp3")
    endif
    if count <= 20 then
        set a2 = a + LoadReal(ht, GetHandleId(z), 1)
        set x = PolarX(GetUnitX(c) , 80, a2)
        set y = PolarY(GetUnitY(c) , 80, a2)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFacingEx(c, a2, true)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0FQ')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\TZJQ5.mdx", GetUnitX(c), GetUnitY(c), 100, a2, 0, 0, 1.2, 1, 255, 255, 255, 0)
            call Effect("war3mapimported\\AZ_PA_B2.mdx", GetUnitX(c), GetUnitY(c), 25, a2, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Akame.mdx", GetUnitX(c), GetUnitY(c), 25, a2, 0, 0, 0.9, 0.8 - count * 0.02, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
    endif
    if count == 2 or count == 7 or count == 12 or count == 17 then
        set a2 = a + LoadReal(ht, GetHandleId(z), 1)
        call Effect("war3mapimported\\akamerdash.mdx", GetUnitX(c), GetUnitY(c), 100, a2, 0, 0, 0.6, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(c), GetUnitY(c), 25, a2, 0, 0, 0.9, 1, 255, 255, 255, 255)
    endif
    if count == 5 or count == 10 or count == 15 then
        call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_AkameE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0FQ' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_AkameE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_AkameE takes nothing returns nothing
    set gg_trg_AkameE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkameE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkameE, function Trig_AkameE_Actions)
endfunction