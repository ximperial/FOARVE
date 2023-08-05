//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ReimuF_Func001 takes nothing returns nothing
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
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Reimu_6.mp3")
        call SoundStart("war3mapImported\\Reimu_6-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        loop
            exitwhen i > 9
            set x1 = PolarX(x, 800, i * 36)
            set y1 = PolarY(y, 800, i * 36)
            set a = Angle(x1, y1, x, y)
            call Effect("war3mapImported\\reimuyuzha.mdl", x1, y1, 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 2 + i, bj_lastCreatedEffect)
            set x1 = PolarX(x, 750, i * 36)
            set y1 = PolarY(y, 750, i * 36)
            set a = Angle(x1, y1, x, y)
            call Effect("war3mapImported\\spiritarrow_pink.mdl", x1, y1, 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 12 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
    endif
    if count >= 10 and count <= 40 then
        loop
            exitwhen i > 9 
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call SetEffectX(e, PolarX(GetEffectX(e), 60, GetSpecialEffectYaw(e)))
            call SetEffectY(e, PolarY(GetEffectY(e), 60, GetSpecialEffectYaw(e)))
            set e = LoadEffectHandle(ht, GetHandleId(z), 12 + i)
            call SetEffectX(e, PolarX(GetEffectX(e), 60, GetSpecialEffectYaw(e)))
            call SetEffectY(e, PolarY(GetEffectY(e), 60, GetSpecialEffectYaw(e)))
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 200, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(c, gUnit, 11 * GetHeroInt(c, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set i = i + 1
        endloop
    endif
    if count == 40 then
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

function Trig_ReimuF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A08J' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_ReimuF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ReimuF takes nothing returns nothing
    set gg_trg_ReimuF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ReimuF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ReimuF, function Trig_ReimuF_Actions )
endfunction