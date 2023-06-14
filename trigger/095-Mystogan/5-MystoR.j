//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MystoR_Func001 takes nothing returns nothing
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
    if count <= 50 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Mysto_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call lockUnit(gUnit, 3.6, true)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 5 then
        set x1 = PolarX(x, 800, 0)
        set y1 = PolarY(y, 800, 0)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\Staff1.mdx", x1, y1, 1000, a, 0, 0, 8, 8.4, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 50, 0.4, a)
    endif
    if count == 10 then
        set x1 = PolarX(x, 800, 72)
        set y1 = PolarY(y, 800, 72)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\Staff2.mdx", x1, y1, 1000, a, 0, 0, 8, 8.3, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 50, 0.4, a)
    endif
    if count == 15 then
        set x1 = PolarX(x, 800, 144)
        set y1 = PolarY(y, 800, 144)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\Staff3.mdx", x1, y1, 1000, a, 0, 0, 8, 8.2, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 50, 0.4, a)
    endif
    if count == 20 then
        set x1 = PolarX(x, 800, 216)
        set y1 = PolarY(y, 800, 216)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\Staff4.mdx", x1, y1, 1000, a, 0, 0, 8, 8.1, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 50, 0.4, a)
    endif
    if count == 25 then
        set x1 = PolarX(x, 800, 288)
        set y1 = PolarY(y, 800, 288)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\Staff5.mdx", x1, y1, 1000, a, 0, 0, 8, 8, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 0, - 50, 0.4, a)
        set x1 = PolarX(x, 800, 0)
        set y1 = PolarY(y, 800, 0)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\blue--zhendi.mdx", x1, y1, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 30 then
        set x1 = PolarX(x, 800, 72)
        set y1 = PolarY(y, 800, 72)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\blue--zhendi.mdx", x1, y1, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 35 then
        set x1 = PolarX(x, 800, 144)
        set y1 = PolarY(y, 800, 144)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\blue--zhendi.mdx", x1, y1, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 40 then
        set x1 = PolarX(x, 800, 216)
        set y1 = PolarY(y, 800, 216)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\blue--zhendi.mdx", x1, y1, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 45 then
        set x1 = PolarX(x, 800, 288)
        set y1 = PolarY(y, 800, 288)
        set a = Angle(x1, y1, x, y)
        call Effect("war3mapImported\\blue--zhendi.mdx", x1, y1, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Mysto_4-1.mp3")
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call Effect("war3mapImported\\Black.mdl", x, y, 25, a, 0, 0, 2, 7.4, 255, 255, 255, PercentTo255(40))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 50 or count == 90 or count == 130 or count == 170 or count == 210 then
        call Effect("war3mapImported\\AZ_UV.mdl", x, y, 30, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 70 then
        call Effect("war3mapImported\\MC Laxus.mdl", x, y, 300, randomAngle(), 0, 0, 5, 3, 255, 255, 255, 255)
    endif
    if count == 90 then
        call Effect("war3mapImported\\mystoganauraa.mdl", x, y, 500, randomAngle(), 0, 0, 4.5, 3, 200, 255, 255, 255)
    endif
    if count == 110 then
        call Effect("war3mapImported\\mystoganauraa.mdl", x, y, 700, randomAngle(), 0, 0, 4, 3, 255, 0, 0, 255)
    endif
    if count == 130 then
        call Effect("war3mapImported\\mystoganauraa.mdl", x, y, 900, randomAngle(), 0, 0, 6, 3, 255, 255, 255, 255)
    endif
    if count == 150 then
        call Effect("war3mapImported\\mystoganauraa.mdl", x, y, 1100, randomAngle(), 0, 0, 5.5, 3, 170, 0, 255, 255)
    endif
    if count >= 200 and count <= 350 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A0DR')) * GetHeroInt(c, true)) / 150)
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\OrbitalRay.mdl", x, y, 25, randomAngle(), 0, 0, 9.5, 1, 178, 102, 255, 255)
        endif
    endif
    if count == 350 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_MystoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0DR' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_MystoR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MystoR takes nothing returns nothing
    set gg_trg_MystoR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MystoR, function Trig_MystoR_Actions )
endfunction