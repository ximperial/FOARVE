//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_WendyW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Wendy_2.mp3")
        call SetUnitTimeScale(c, 2)
    endif
    if count == 1 or count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then 
        call SetUnitAnimation(c, "attack")
    endif
    if count <= 80 then
        set x = PolarX(GetUnitX(c) , 25, a)
        set y = PolarY(GetUnitY(c) , 25, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null 
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1 + GetUnitAbilityLevel(c, 'A06I')) * GetHeroAgi(c, true)) 
                call GroupAddUnit(g, gUnit)
            endif
        endloop 
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\MoonFireSlash.mdl", GetUnitX(c) , GetUnitY(c) , 25, a + 80, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call MoveEffect(bj_lastCreatedEffect, 40, 0.6, a + 80)
            call Effect("war3mapImported\\MoonFireSlash.mdl", GetUnitX(c) , GetUnitY(c) , 25, a - 80, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call MoveEffect(bj_lastCreatedEffect, 40, 0.6, a - 80)
            call Effect("war3mapImported\\BigExplosionBlue.mdl", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 80 then
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
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

function Trig_WendyW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    if GetSpellAbilityId() == 'A06I' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_WendyW_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_WendyW takes nothing returns nothing
    set gg_trg_WendyW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_WendyW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_WendyW, function Trig_WendyW_Actions)
endfunction