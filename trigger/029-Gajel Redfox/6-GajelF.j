//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_GajelF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Gajel_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 4, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimation(c, "stand ready")
        call Effect("war3mapImported\\Gravitone.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 8, 2, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SetUnitAnimation(c, "spell throw")
    endif
    if count == 30 then
        set x = PolarX(GetUnitX(c), 30, a)
        set y = PolarY(GetUnitY(c), 30, a)
        call Effect("war3mapImported\\MC Gajeel.mdl", x, y, 140, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
        call Effect("", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 30 and count <= 70 then
        set x = PolarX(GetEffectX(e), 40, a)
        set y = PolarY(GetEffectY(e), 40, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 200 + (count - 30) * 10, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\bonesipji.mdl", GetEffectX(e), GetEffectY(e), 140 + (count - 40) * 4, a, - 90, 0, 1 + (count - 40) * 0.09, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 70 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
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

function Trig_GajelF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0AX' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_GajelF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_GajelF takes nothing returns nothing
    set gg_trg_GajelF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GajelF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GajelF, function Trig_GajelF_Actions )
endfunction