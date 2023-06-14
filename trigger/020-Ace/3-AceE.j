//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_AceE_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real x1
    local real y1
    local effect e
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 30 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Ace_3.mp3")
        call SetUnitAnimationByIndex(c, 8)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        loop
            exitwhen i > 17
            call Effect("war3mapImported\\fire1.mdl", GetUnitX(c), GetUnitY(c), 10, i * 20, 0, 0, 2, 3, 255, 255, 255, PercentTo255(90))
            call SaveEffectHandle(ht, GetHandleId(z), 2 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(c))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(c))
    endif
    if count <= 30 then
        loop
            exitwhen i > 17
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set x = PolarX(GetEffectX(e), 25, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), 25, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 10 + GetAxisZ(x, y))
            set i = i + 1
        endloop
    endif
    if count == 30 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        set i = 0
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        loop
            exitwhen i > 7
            set x1 = PolarX(x, 100, i * 45)
            set y1 = PolarY(y, 100, i * 45)
            call Effect("war3mapImported\\[A]acefireshockrun.mdl", x1, y1, 20, i * 45, 0, 0, 1, 2, 255, 255, 255, 255)
            set x1 = PolarX(x, 250, i * 45)
            set y1 = PolarY(y, 250, i * 45)
            call Effect("war3mapImported\\[A]acefireshockrun.mdl", x1, y1, 20, i * 45, 0, 0, 1, 2, 255, 255, 255, 255)
            set x1 = PolarX(x, 400, i * 45)
            set y1 = PolarY(y, 400, i * 45)
            call Effect("war3mapImported\\[A]acefireshockrun.mdl", x1, y1, 20, i * 45, 0, 0, 1, 2, 255, 255, 255, 255)
            set x1 = PolarX(x, 550, i * 45)
            set y1 = PolarY(y, 550, i * 45)
            call Effect("war3mapImported\\[A]acefireshockrun.mdl", x1, y1, 20, i * 45, 0, 0, 1, 2, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 700, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call lockUnit(gUnit, 0.4, false)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count >= 30 and count <= 130 then
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        call GroupEnumUnitsInRange(gGroup, x, y, 700, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, ((1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0AC')) * GetHeroStr(c, true)) / 50)
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 130 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_AceE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0AC' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AceE_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_AceE takes nothing returns nothing
    set gg_trg_AceE = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AceE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AceE, function Trig_AceE_Actions )
endfunction