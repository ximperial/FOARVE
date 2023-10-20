//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ogita_5.mp3")
        call SoundStart("war3mapImported\\Ogita_5-1.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t) , - 500, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 500, a))
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 0.9)
        call SetUnitFacingEx(c, a, true)
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 5 then
        call SoundStart("war3mapImported\\Ogita_1-2.mp3")
        call Effect("war3mapimported\\CTshoting.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\glchj.mdx", GetUnitX(c), GetUnitY(c), 30, a, 0, 0, 1.8, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count >= 10 and count <= 30 then
        call SetUnitX(c, PolarX(GetUnitX(c), 32, GetUnitFacing(c)))
        call SetUnitY(c, PolarY(GetUnitY(c), 32, GetUnitFacing(c)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
    endif
    if count == 30 then
        call SetUnitFacing(c, a)
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count == 35 then
        call SoundStart("war3mapImported\\Ogita_2-2.mp3")
        call Effect("war3mapimported\\zhanji-blue-shu.mdx", GetUnitX(t), GetUnitY(t), 30, a + 50, 0, 0, 0.7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
    endif
    if count >= 35 and count <= 45 then
        call SetUnitX(t, PolarX(GetUnitX(t), 30, a))
        call SetUnitY(t, PolarY(GetUnitY(t), 30, a))
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Ogita_5-2.mp3")
    endif
    if count == 45 then
        call SetUnitTimeScale(c, 2)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 300, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
    endif
    if count == 50 or count == 65 or count == 75 or count == 90 then
        call SoundStart("war3mapImported\\Ogita_4-1.mp3")
    endif
    if count >= 45 and count <= 95 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = LoadReal(ht, GetHandleId(z), 0)
            set y = LoadReal(ht, GetHandleId(z), 1)
            call SetUnitX(t, PolarX(x, GetRandomReal(- 600, 600), randomAngle()))
            call SetUnitY(t, PolarY(y, GetRandomReal(- 600, 600), randomAngle()))
            call SetUnitFlyHeight(t, GetRandomReal(200, 400), 0)
            set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
            call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
            call SetUnitFacingEx(c, a, true)
            call SetUnitAnimation(c, "attack")
            call Effect("war3mapimported\\kdls2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a + 90, 45, 0, 1.4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\kdls2.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a + 90, - 45, 0, 1.4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 40, 0, 1, 1, PercentTo255(85), 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 95 then
        call SoundStart("war3mapImported\\Ogita_5-3.mp3")
    endif
    if count == 100 then
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        call SetUnitX(t, x)
        call SetUnitY(t, y)
        call SetUnitFlyHeight(t, 700, 0)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 16)
        call SetUnitTimeScale(c, 1.2)
    endif
    if count >= 100 and count <= 120 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 35, 0)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Ogita_5-4.mp3")
    endif
    if count == 125 then
        call Effect("war3mapimported\\123 (383)_2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 6, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 130 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_OgitaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GH' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OgitaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OgitaT takes nothing returns nothing
    set gg_trg_OgitaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaT, function Trig_OgitaT_Actions)
endfunction