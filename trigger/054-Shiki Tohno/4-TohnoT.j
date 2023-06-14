//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohnoT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Tohno_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count == 10 then 
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 27)
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Tohno_5-1.mp3")
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 0.8, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count >= 15 and count <= 40 then
        set x = PolarX(GetUnitX(t), 40, a)
        set y = PolarY(GetUnitY(t), 40, a) 
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 40 then 
        call SoundStart("war3mapImported\\Tohno_5-2.mp3")
        call SetUnitAnimationByIndex(c, 21) 
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(70))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Tohno_5-3.mp3")
    endif
    if count >= 40 and count <= 80 then
        call SetUnitX(c, PolarX(GetUnitX(c), 15, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 15, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), - 30, a)
            set y = PolarY(GetUnitY(c), - 30, a)
            call Effect("war3mapimported\\Tohno.mdx", x, y, GetUnitFlyHeight(c), a, 0, 0, 1, 0.6, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        endif
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Tohno_5-4.mp3")
        call SoundStart("war3mapImported\\Tohno_5-5.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitAnimationByIndex(c, 22) 
        call Effect("war3mapimported\\SKSKSK2.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\file00001557.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 8, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 250, a, 0, 0, 13, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 90 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
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

function Trig_TohnoT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AR' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TohnoT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TohnoT takes nothing returns nothing
    set gg_trg_TohnoT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohnoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TohnoT, function Trig_TohnoT_Actions )
endfunction