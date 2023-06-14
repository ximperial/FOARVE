//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_KizaruT_Func003 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
    local real a = Angle(GetEffectX(e), GetEffectY(e), x, y)
    local real dist = LoadReal(ht, GetHandleId(z), 2)
    local real x1 = PolarX(GetEffectX(e), dist / 15, a)
    local real y1 = PolarY(GetEffectY(e), dist / 15, a)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call SetEffectX(e, x1)
    call SetEffectY(e, y1)
    call SetSpecialEffectZ(e, z1 - 40)
    if count >= 15 then 
        call SetSpecialEffectAnimationByIndex(e, 2)
        call Effect("war3mapimported\\NewDirtEXNofire.mdx", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 450, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 0.7 * GetHeroAgi(c, true))
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

function Trig_KizaruT_Func002 takes unit c, real x, real y, real x1, real y1 returns nothing
    local timer z = CreateTimer()
    local real a = Angle(x, y, x1, y1)
    call SaveUnitHandle(ht, GetHandleId(z), 0, c)
    call SaveReal(ht, GetHandleId(z), 0, x1)
    call SaveReal(ht, GetHandleId(z), 1, y1)
    call SaveInteger(ht, GetHandleId(z), 0, 0)
    call Effect("war3mapimported\\!ylaser!2.mdx", x, y, 750, a, - 45, 0, 0.6, 0.8, 255, 255, 255, 255)
    call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
    call SaveReal(ht, GetHandleId(z), 2, Distance(x, y, x1, y1))
    call TimerStart(z, 0.04, true, function Trig_KizaruT_Func003)
    set z = null
endfunction

function Trig_KizaruT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real x2 
    local real y2
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kizaru_5-2.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 5, GetUnitX(c), GetUnitY(c))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        set x1 = PolarX(x, - 1000, a)
        set y1 = PolarY(y, - 1000, a)
        call Effect("war3mapImported\\Kizaru.mdx", x1, y1, 700, a, 0, 0, 1, 4, 255, 255, PercentTo255(40), 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 14)
        call Effect("war3mapimported\\!guang small.mdx", x1, y1, 550, a, 0, 0, 2, 4, 255, 255, 255, 255)
    endif
    if count <= 150 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 2000, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if not IsUnitInGroup(gUnit, g) then 
                call GroupAddUnit(g, gUnit)
            endif
            call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01) 
        endloop
        call GroupClear(gGroup)
    endif
    if count == 150 then
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count <= 200 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x1 = PolarX(x, - 1000, a)
            set y1 = PolarY(y, - 1000, a)
            set x2 = PolarX(x, GetRandomReal(- 800, 800), a + GetRandomReal(- 70, 70))
            set y2 = PolarY(y, GetRandomReal(- 800, 800), a + GetRandomReal(- 70, 70))
            call Trig_KizaruT_Func002(c, x1, y1, x2, y2)
        endif
    endif
    if count == 200 then
        call SetUnitFlyHeight(c, 0, 0)
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
    set g = null
endfunction

function Trig_KizaruT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A03B' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_KizaruT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_KizaruT takes nothing returns nothing
    set gg_trg_KizaruT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KizaruT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KizaruT, function Trig_KizaruT_Actions )
endfunction