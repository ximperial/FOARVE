//TESH.scrollpos=54
//TESH.alwaysfold=0
function Trig_AizenT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real x1
    local real y1
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
        call SoundStart("war3mapImported\\Aizen_5.mp3")
        call SoundStart("war3mapImported\\Aizen_5-1.mp3")
        call SetUnitAnimationByIndex(c, 16)
        call Effect("war3mapimported\\[DoFT]twist.mdx", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_huozhu_purple.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 2, 255, 255, 255, 0)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 20 then
        set x = PolarX(GetUnitX(c), - 600, a)
        set y = PolarY(GetUnitY(c), - 600, a)
        set dist = Distance(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
        call MoveEffect(bj_lastCreatedEffect, dist / 40, 0.8, a)
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set x1 = PolarX(x, 400, a + 90)
        set y1 = PolarY(y, 400, a + 90)
        call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x1, y1, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
        call MoveEffect(bj_lastCreatedEffect, dist / 40, 0.8, a)
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x1, y1, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set x1 = PolarX(x, 400, a - 90)
        set y1 = PolarY(y, 400, a - 90)
        call Effect("war3mapimported\\[DoFT]HadoDragon.mdx", x1, y1, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3.5)
        call MoveEffect(bj_lastCreatedEffect, dist / 40, 0.8, a)
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x1, y1, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\Aizen_5-2.mp3")
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a + 90)
        set y = PolarY(GetUnitY(t), 400, a + 90)
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", x, y, 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a - 90)
        set y = PolarY(GetUnitY(t), 400, a - 90)
        call Effect("war3mapimported\\[DoFT]AizenTEffect.mdx", x, y, 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DaoGuang_BaoZha_purple.mdx", x, y, 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
    endif
    if count == 70 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_AizenT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03R' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AizenT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AizenT takes nothing returns nothing
    set gg_trg_AizenT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AizenT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AizenT, function Trig_AizenT_Actions )
endfunction