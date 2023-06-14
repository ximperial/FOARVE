//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ByakuranT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local real a = LoadReal(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local integer i = 1
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
    local effect e
    local group g2
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Byakuran_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1500, 8, GetUnitX(c), GetUnitY(c))
        if b then
            call SetUnitAnimationByIndex(c, 10)
        else
            call SetUnitAnimationByIndex(c, 4)
        endif
    endif
    if count <= 50 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\dustwaveanimate2.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.85, 1.75), 1.5, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(c), GetUnitY(c), 50, randomAngle(), 0, 0, GetRandomReal(1.55, 2.15), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Byakuran_5-1.mp3")
        if b then
            call SetUnitAnimationByIndex(c, 17)
        else
            call SetUnitAnimationByIndex(c, 16)
        endif
        call Effect("war3mapImported\\hellbond.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 7, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_doomdragon_d2.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 7, 255, 255, 255, 255)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 7, 255, 255, 255, PercentTo255(80))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 60 then
        call Effect("war3mapImported\\dzxb1.mdl", GetUnitX(c), GetUnitY(c), 110, a, 0, 0, 1.8, 8, 255, 255, 255, PercentTo255(90))
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 60 and count <= 420 then
        set g2 = CreateGroup()
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        loop
            exitwhen i > 10
            set x = PolarX(GetUnitX(c), 130 * i, a)
            set y = PolarY(GetUnitY(c), 130 * i, a)
            call GroupEnumUnitsInRange(g2, x, y, 250, null)
            loop
                set gUnit = GroupForEachUnit(g2)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) then
                    if not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(c, gUnit, 15 * GetHeroStr(c, true) / 350)
                        call GroupAddUnit(g, gUnit)
                    endif
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            if iterator == 20 then
                set x = PolarX(x, 125 * i, a)
                set y = PolarY(y, 125 * i, a)
                if i == 1 or i == 2 or i == 3 or i == 4 or i == 5 then
                    call Effect("war3mapImported\\WindCirclefaster.mdl", x, y, 100, a, -90, 0, GetRandomReal(1.2, 1.45), 1.5, PercentTo255(10), PercentTo255(10), PercentTo255(10), PercentTo255(90))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.55, 0.8))
                endif
            endif
            set i = i + 1
        endloop
        call GroupClear(g)
        call DestroyGroup(g2)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count == 420 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimation(e, "death")
        call SetUnitInvulnerable(c, false)
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
    set g2 = null
    set e = null
endfunction

function Trig_ByakuranT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetSpellTargetX(), GetSpellTargetY())
    if GetSpellAbilityId() == 'A0AL' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(c, 'B00Y') > 0)
        call TimerStart(z, 0.02, true, function Trig_ByakuranT_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_ByakuranT takes nothing returns nothing
    set gg_trg_ByakuranT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ByakuranT, function Trig_ByakuranT_Actions )
endfunction