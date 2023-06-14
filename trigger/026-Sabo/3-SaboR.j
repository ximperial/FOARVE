//TESH.scrollpos=45
//TESH.alwaysfold=0
function Trig_SaboR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sabo_4.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 10 then
        set x = PolarX(GetUnitX(t), - 300, a + 45)
        set y = PolarY(GetUnitY(t), - 300, a + 45)
        call SoundStart("war3mapImported\\Sabo_4-1.mp3")
        call Effect("war3mapimported\\Sabo.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\HyZLAFB.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DragonZhua.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 25 then
        set x = PolarX(GetUnitX(t), - 300, a + 135)
        set y = PolarY(GetUnitY(t), - 300, a + 135)
        call SoundStart("war3mapImported\\Sabo_4-1.mp3")
        call Effect("war3mapimported\\Sabo.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\HyZLAFB.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DragonZhua.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 40 then
        set x = PolarX(GetUnitX(t), - 300, a + 225)
        set y = PolarY(GetUnitY(t), - 300, a + 225)
        call SoundStart("war3mapImported\\Sabo_4-1.mp3")
        call Effect("war3mapimported\\Sabo.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\HyZLAFB.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DragonZhua.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 55 then
        set x = PolarX(GetUnitX(t), - 300, a + 315)
        set y = PolarY(GetUnitY(t), - 300, a + 315)
        call SoundStart("war3mapImported\\Sabo_4-1.mp3")
        call Effect("war3mapimported\\Sabo.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\HyZLAFB.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\DragonZhua.mdx", x, y, 25, Angle(x, y, GetUnitX(t), GetUnitY(t)), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 70 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A07U')) * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_SaboR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07U' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_SaboR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SaboR takes nothing returns nothing
    set gg_trg_SaboR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SaboR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_SaboR, function Trig_SaboR_Actions )
endfunction