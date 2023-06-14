//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Reimu_7.mp3")
        call SoundStart("war3mapImported\\Reimu_7-1.mp3")
        if IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) == false then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call Effect("war3mapimported\\[DoFT]DevilSlamAddetivRed.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\reimuZJ.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 6
            set x = PolarX(GetUnitX(c), 300, i * 60)
            set y = PolarY(GetUnitY(c), 300, i * 60)
            call Effect("war3mapimported\\reimuZJ.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroInt(c, true))
            endif
        endloop
        call GroupClear(gGroup)
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

function Trig_ReimuD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A08K' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_ReimuD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ReimuD takes nothing returns nothing
    set gg_trg_ReimuD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ReimuD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ReimuD, function Trig_ReimuD_Actions )
endfunction