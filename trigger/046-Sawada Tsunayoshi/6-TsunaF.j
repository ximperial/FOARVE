//TESH.scrollpos=58
//TESH.alwaysfold=0
function Trig_TsunaF_Func001 takes nothing returns nothing
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
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tsuna_6.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 6, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 20)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 400, 400)
    endif
    if count == 50 then
        set x1 = PolarX(GetUnitX(c), - 20, a + 30)
        set y1 = PolarY(GetUnitY(c), - 20, a + 30)
        call Effect("war3mapImported\\SolarBlast2.mdx", x1, y1, 700, a + 30, - 160, 0, 1, 4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call AnimEffect(bj_lastCreatedEffect, 1, 0.6)
        set x1 = PolarX(GetUnitX(c), - 20, a - 30)
        set y1 = PolarY(GetUnitY(c), - 20, a - 30)
        call Effect("war3mapImported\\SolarBlast2.mdx", x1, y1, 700, a - 30, - 160, 0, 1, 4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call AnimEffect(bj_lastCreatedEffect, 1, 0.6)
    endif
    if count == 50 or count == 100 then
        call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(c), GetUnitY(c), 425, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count <= 100 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c), GetUnitY(c), 1500, null)
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
    if count == 100 then
        call SetUnitTimeScale(c, 0)
        set x1 = PolarX(GetUnitX(c), 20, a)
        set y1 = PolarY(GetUnitY(c), 20, a)
        set pitch = Slope(x1, y1, 650, x, y, 0)
        call Effect("war3mapImported\\SolarBlast2.mdx", x1, y1, 650, a, pitch-100, 0, 1, 3, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call AnimEffect(bj_lastCreatedEffect, 1, 0.2)
        call ForGroup(g, function ResetMoveSpeed)
        call DestroyGroup(g)
    endif
    if count >= 110 and count <= 250 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 11 * GetHeroAgi(c, true) / 130)
                call IssueImmediateOrderById(gUnit, 851972)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\Holy_Fire_Slam2.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", x, y, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", x, y, 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 260 then
        call SetUnitFlyHeight(c, 0, 1000)
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

function Trig_TsunaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A034' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_TsunaF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_TsunaF takes nothing returns nothing
    set gg_trg_TsunaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TsunaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TsunaF, function Trig_TsunaF_Actions )
endfunction