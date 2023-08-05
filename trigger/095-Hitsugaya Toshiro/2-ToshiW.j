//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ToshiW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Toshiro_2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1.4)
    endif
    if count == 15 then
        call Effect("war3mapImported\\tx012a.mdl", GetUnitX(c), GetUnitY(c), 80, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, 150)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        set x1 = PolarX(x, - 120, a)
        set y1 = PolarY(y, - 120, a)
        if not IsTerrainPathable(x1, y1, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x1)
            call SetUnitY(c, y1)
        else
            set x1 = PolarX(GetUnitX(c), 120, a)
            set y1 = PolarY(GetUnitY(c), 120, a)
        endif
        loop 
            exitwhen i > 5
            set x1 = PolarX(GetUnitX(c), 200, a + 20 * i)
            set y1 = PolarY(GetUnitY(c), 200, a + 20 * i)
            call Effect("war3mapImported\\bingk.mdl", x1, y1, 25, a + 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.15)
            set x1 = PolarX(GetUnitX(c), 450, a + 20 * i)
            set y1 = PolarY(GetUnitY(c), 450, a + 20 * i)
            call Effect("war3mapImported\\bingk.mdl", x1, y1, 25, a + 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.15)
            set x1 = PolarX(GetUnitX(c), 200, a + 20 * i)
            set y1 = PolarY(GetUnitY(c), 200, a + 20 * i)
            call Effect("war3mapImported\\[Effect]534.mdl", x1, y1, 25, a + 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.65)
            set x1 = PolarX(GetUnitX(c), 450, a + 20 * i)
            set y1 = PolarY(GetUnitY(c), 450, a + 20 * i)
            call Effect("war3mapImported\\[Effect]534.mdl", x1, y1, 25, a + 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.65)
            set i = i + 1
        endloop
        set i = 1
        loop 
            exitwhen i > 5
            set x1 = PolarX(GetUnitX(c), 200, a - 20 * i)
            set y1 = PolarY(GetUnitY(c), 200, a - 20 * i)
            call Effect("war3mapImported\\bingk.mdl", x1, y1, 25, a - 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.15)
            set x1 = PolarX(GetUnitX(c), 450, a - 20 * i)
            set y1 = PolarY(GetUnitY(c), 450, a - 20 * i)
            call Effect("war3mapImported\\bingk.mdl", x1, y1, 25, a - 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.15)
            set x1 = PolarX(GetUnitX(c), 200, a - 20 * i)
            set y1 = PolarY(GetUnitY(c), 200, a - 20 * i)
            call Effect("war3mapImported\\[Effect]534.mdl", x1, y1, 25, a - 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.65)
            set x1 = PolarX(GetUnitX(c), 450, a - 20 * i)
            set y1 = PolarY(GetUnitY(c), 450, a - 20 * i)
            call Effect("war3mapImported\\[Effect]534.mdl", x1, y1, 25, a - 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.65)
            set i = i + 1
        endloop
    endif
    if count == 20 then
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, (1 + GetUnitAbilityLevel(c, 'A0C8')) * GetHeroInt(c, true))
            endif
        endloop
        call GroupClear(gGroup)
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
endfunction

function Trig_ToshiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0C8' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_ToshiW_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_ToshiW takes nothing returns nothing
    set gg_trg_ToshiW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ToshiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ToshiW, function Trig_ToshiW_Actions )
endfunction