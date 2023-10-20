//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_FujirenE_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_FujirenE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real a = GetUnitFacing(c)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Fujiren_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapimported\\twd2.mdx", GetUnitX(c) , GetUnitY(c) , 200, a, 0, 0, 5.3, 2, 255, 255, 255, PercentTo255(70))
        call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 1)
        call AnimEffect(bj_lastCreatedEffect, 1, 1)
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(c))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(c))
    endif
    if count <= 60 then
        call GroupEnumUnitsInRange(gGroup, LoadReal(ht, GetHandleId(z), 0), LoadReal(ht, GetHandleId(z), 1), 1000, null)
        call GroupRemoveUnit(gGroup, c)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                call PauseUnit(gUnit, true)
                if not IsUnitInGroup(gUnit, g) then
                    call SetUnitTimeScale(gUnit, 0)
                    call GroupAddUnit(g, gUnit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 60 then
        call ForGroup(g, function Trig_FujirenE_Func002)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
    set e2 = null
endfunction

function Trig_FujirenE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0FX' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_FujirenE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_FujirenE takes nothing returns nothing
    set gg_trg_FujirenE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_FujirenE, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_FujirenE, function Trig_FujirenE_Actions )
endfunction