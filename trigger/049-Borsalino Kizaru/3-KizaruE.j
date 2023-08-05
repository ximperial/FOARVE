//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_KizaruE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0) + LoadReal(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kizaru_3.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count <= 20 then
        set x = PolarX(GetUnitX(c), 70, a)
        set y = PolarY(GetUnitY(c), 70, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFacing(c, a)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A03H')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 2 or iterator == 4 then
            if iterator == 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
            endif
            call Effect("war3mapimported\\Kizaru.mdx", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 0.3, 255, 255, 0, 100)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call Effect("war3mapimported\\HolySmiteMissileNew.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call AnimEffect(bj_lastCreatedEffect, 2, 0.5)
        endif
    endif
    if count == 20 then
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
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

function Trig_KizaruE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A03H' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveReal(ht, GetHandleId(z), 1, 30)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KizaruE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_KizaruE takes nothing returns nothing
    set gg_trg_KizaruE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KizaruE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KizaruE, function Trig_KizaruE_Actions )
endfunction