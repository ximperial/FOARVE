//TESH.scrollpos=63
//TESH.alwaysfold=0
function Trig_JotaroD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 110 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Jotaro_7.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\wavejojo.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]effect_Howling_SFX.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 70 then
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]effect_Howling_SFX.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Sprint_Cast_Base.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 90 then
        set x = PolarX(GetUnitX(t), - 120, a)
        set y = PolarY(GetUnitY(t), - 120, a)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, GetAxisZ(x, y))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
    endif
    if count == 100 then
        call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BrokenGlass.mdx", GetUnitX(t), GetUnitY(t), 125, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Ikadt1white.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[a]shockwave big.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 220, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 75, a, - 45, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 75, a, - 45, 0, 8, 1, 255, 255, 255, 255)
    endif
    if count == 110 then 
        call SetUnitFlyHeight(t, 400, 1000)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 130 then
        call SetUnitFlyHeight(t, 0, 2000)
    endif
    if count == 140 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitFlyHeight(t, 0, 0)
        call EffectUnitColor(c,"war3mapimported\\fuzzystomp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call EffectUnitColor(c,"war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call EffectUnitColor(c,"war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call EffectUnitColor(c,"war3mapimported\\[a]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call EffectUnitColor(c,"war3mapimported\\zhendi-sand.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_JotaroD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02V' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_JotaroD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_JotaroD takes nothing returns nothing
    set gg_trg_JotaroD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JotaroD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JotaroD, function Trig_JotaroD_Actions )
endfunction