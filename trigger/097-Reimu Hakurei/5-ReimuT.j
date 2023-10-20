//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = GetUnitFacing(c)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 300, 1000)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Reimu_5.mp3")
        call SoundStart("war3mapImported\\Reimu_5-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Reimu_5-2.mp3") 
        loop
            exitwhen i > 7
            set x = PolarX(GetUnitX(c), 700, i * 45)
            set y = PolarY(GetUnitY(c), 700, i * 45)
            call Effect("war3mapImported\\mengxtsq.mdl", x, y, 150, randomAngle(), 0, 0, 3, 2.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\cursebolt1.mdl", x, y, 150, randomAngle(), 0, 0, 5, 2.5, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call Effect("war3mapImported\\mengxts.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 2.5, 255, 255, 255, 255)
    endif
    if count >= 30 and count <= 130 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 15 * GetHeroInt(c, true) / 90) 
                if count >= 40 then
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 130 then
        call SetUnitFlyHeight(c, 0, 0)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_ReimuT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A08I' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ReimuT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ReimuT takes nothing returns nothing
    set gg_trg_ReimuT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ReimuT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ReimuT, function Trig_ReimuT_Actions )
endfunction