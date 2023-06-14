//TESH.scrollpos=30
//TESH.alwaysfold=0
function Trig_WendyQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Wendy_1.mp3")
        call SoundStart("war3mapImported\\Wendy_1-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 3.2)
        set x = PolarX(GetUnitX(c) , 120, a)
        set y = PolarY(GetUnitY(c) , 120, a)
        call Effect("war3mapImported\\MC Wendy.mdl", x, y , 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 15 then
        set x = PolarX(GetEffectX(e) , 80, a)
        set y = PolarY(GetEffectY(e) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 300, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A06H')) 
                call GroupAddUnit(g, gUnit)
            endif
        endloop 
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 2 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetEffectX(e) , 50, a)
            set y = PolarY(GetEffectY(e) , 50, a)
            call Effect("war3mapImported\\WeatherEffect5.mdl", x , y , 80 + count * 12, a, 0, 0, 0.5 + count * 0.14, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\File000023201.mdl", GetEffectX(e) , GetEffectY(e) , 50 + count * 8, a, 0, 0, 0.5 + count * 0.08, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
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

function Trig_WendyQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    if GetSpellAbilityId() == 'A06H' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_WendyQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_WendyQ takes nothing returns nothing
    set gg_trg_WendyQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_WendyQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_WendyQ, function Trig_WendyQ_Actions)
endfunction