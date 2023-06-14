//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_NarutoD_Func002 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_NarutoD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = GetUnitFacing(c)
    local real x
    local real y
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapimported\\OodamaRasenganNew.mdx", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    endif
    if count <= 100 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 1)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.06)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 500 + count * 3, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true) / 90)
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BlinkCaster2.mdx", GetUnitX(c), GetUnitY(c), 200, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Asuma-Explosion.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Abyssal_Impact_Base.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_NarutoD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0DJ' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NarutoD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_NarutoD takes nothing returns nothing
    set gg_trg_NarutoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ( gg_trg_NarutoD, EVENT_PLAYER_UNIT_SPELL_EFFECT )
    call TriggerAddAction( gg_trg_NarutoD, function Trig_NarutoD_Actions )
endfunction