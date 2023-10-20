//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_FuhuaT_Func005 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call SetSpecialEffectZ(e, GetEffectZ(e) - 60)
    if count >= 15 then 
        call SetSpecialEffectAnimationByIndex(e, 1)
        call Effect("war3mapImported\\AZ_shawang03_L3.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00003016.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, GetHeroInt(c, true))
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
endfunction

function Trig_FuhuaT_Func004 takes unit c, real x, real y returns nothing
    local timer z = CreateTimer()
    call SaveUnitHandle(ht, GetHandleId(z), 0, c)
    call SaveInteger(ht, GetHandleId(z), 0, 0)
    call Effect("war3mapImported\\Vergil-8.mdx", x, y, 1000, randomAngle(), - 90, - 90, 4, 1, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    call TimerStart(z, 0.04, true, function Trig_FuhuaT_Func005)
    set z = null
endfunction

function Trig_FuhuaT_Func003 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 0)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real angleRate = LoadReal(ht, GetHandleId(z) , 2)
    local real duration = LoadReal(ht, GetHandleId(z) , 3)
    local real angle = LoadReal(ht, GetHandleId(z) , 4)
    local real dist = Distance(GetEffectX(e), GetEffectY(e), x, y)
    set duration = duration - 0.1
    call SaveReal(ht, GetHandleId(z) , 3, duration)
    call SaveReal(ht, GetHandleId(z) , 4, angle + angleRate)
    call SetEffectX(e, PolarX(x, dist , LoadReal(ht, GetHandleId(z) , 4)))
    call SetEffectY(e, PolarY(y, dist , LoadReal(ht, GetHandleId(z) , 4)))
    if duration <= 0 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set e = null
endfunction
                                                                                                                                                                                                                                                                                                                                        
function Trig_FuhuaT_Func002 takes effect e, real x, real y, real angleRate, real duration returns nothing
    local timer z = CreateTimer()
    call SaveEffectHandle(ht, GetHandleId(z) , 0, e)
    call SaveReal(ht, GetHandleId(z) , 0, x)
    call SaveReal(ht, GetHandleId(z) , 1, y)
    call SaveReal(ht, GetHandleId(z) , 2, angleRate)
    call SaveReal(ht, GetHandleId(z) , 3, duration)
    call SaveReal(ht, GetHandleId(z) , 4, Angle(GetEffectX(e) , GetEffectY(e) , x, y))
    call TimerStart(z, 0.1, true, function Trig_FuhuaT_Func003)
    set z = null
endfunction

function Trig_FuhuaT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Fuhua_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 9)
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call lockUnit(gUnit, 0.5, false)
            endif 
        endloop
        call GroupClear(gGroup)
    endif
    if count >= 1 and count <= 10 then
        set x1 = PolarX(x, 900, count * 18)
        set y1 = PolarY(y, 900, count * 18)
        call Effect("war3mapImported\\Vergil-8.mdx", x1, y1, 300, a + 90, - 90, - 90, 2, 3.2, 255, 255, 255, 255)
        call Trig_FuhuaT_Func002(bj_lastCreatedEffect, x, y, 4, 3)
        call Effect("war3mapImported\\Vergil-8.mdx", x1, y1, 800, a + 90, - 90, - 90, 2, 3.2, 255, 255, 255, 255)
        call Trig_FuhuaT_Func002(bj_lastCreatedEffect, x, y, 4, 3)
        set x1 = PolarX(x, 900, -count * 18)
        set y1 = PolarY(y, 900, -count * 18)
        call Effect("war3mapImported\\Vergil-8.mdx", x1, y1, 300, a + 90, - 90, - 90, 2, 3.2, 255, 255, 255, 255)
        call Trig_FuhuaT_Func002(bj_lastCreatedEffect, x, y, 4, 3)
        call Effect("war3mapImported\\Vergil-8.mdx", x1, y1, 800, a + 90, - 90, - 90, 2, 3.2, 255, 255, 255, 255)
        call Trig_FuhuaT_Func002(bj_lastCreatedEffect, x, y, 4, 3)
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Fuhua_5-1.mp3")
    endif
    if count >= 30 and count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x1 = PolarX(x, GetRandomReal(- 700, 700), randomAngle())
            set y1 = PolarY(y, GetRandomReal(- 700, 700), randomAngle()) 
            call Trig_FuhuaT_Func004(c, x1, y1)
        endif
    endif
    if count == 150 then
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

function Trig_FuhuaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A09T' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_FuhuaT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_FuhuaT takes nothing returns nothing
    set gg_trg_FuhuaT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FuhuaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_FuhuaT, function Trig_FuhuaT_Actions )
endfunction