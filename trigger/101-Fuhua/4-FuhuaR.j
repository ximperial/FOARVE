//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_FuhuaR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Fuhua_4.mp3")
        call SoundStart("war3mapImported\\Fuhua_4-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 2)
    endif
    if count == 5 then
        call Effect("war3mapImported\\Mr.War3_JSSTZS.mdx", x, y, 25, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Mr.War3_JSSTZS.mdx", x, y, 25, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call Effect("war3mapImported\\File00002084.mdx", x, y, 300, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00009632.mdx", x, y, 300, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 0, 45, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 0, 125, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 125, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a + 125, 0, 45, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 0, 45, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 0, 125, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a, 125, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", x, y, 300, a + 125, 0, 45, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A09S')) * GetHeroInt(c, true))
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

function Trig_FuhuaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A09S' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_FuhuaR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_FuhuaR takes nothing returns nothing
    set gg_trg_FuhuaR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FuhuaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_FuhuaR, function Trig_FuhuaR_Actions )
endfunction