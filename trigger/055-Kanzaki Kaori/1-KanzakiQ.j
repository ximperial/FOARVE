//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_KanzakiQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kanzaki_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 14)
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c), 80, a)
        set y = PolarY(GetUnitY(c), 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call Effect("war3mapImported\\BloodEX.mdx", GetUnitX(gUnit), GetUnitY(gUnit), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A05H'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        call Effect("war3mapImported\\cyzblueXT.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), - 45, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\cyzblueXT.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), - 315, 0, 2, 1, 255, 255, 255, 255)
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
    set e = null
    set g = null
endfunction

function Trig_KanzakiQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A05H' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KanzakiQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KanzakiQ takes nothing returns nothing
    set gg_trg_KanzakiQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KanzakiQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KanzakiQ, function Trig_KanzakiQ_Actions )
endfunction