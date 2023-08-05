//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MomijiT_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SetUnitTimeScale(c, 2)
    endif
    if count == 1 or count == 20 then
        call SoundStart("war3mapImported\\Momiji_2-2.mp3")
        set x = PolarX(GetUnitX(t) , 300, a + 45)
        set y = PolarY(GetUnitY(t) , 300, a + 45)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, GetRandomInt(7, 8))
        call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 25, a + 40, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 80, a + 40, 0, 0, 6, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a + 40, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 10 or count == 30 then
        call SoundStart("war3mapImported\\Momiji_2-2.mp3")
        set x = PolarX(GetUnitX(t) , 300, a - 45)
        set y = PolarY(GetUnitY(t) , 300, a - 45)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, GetRandomInt(7, 8))
        call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 25, a - 40, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 80, a - 40, 0, 0, 6, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a - 40, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Momiji_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call Effect("war3mapimported\\File00009632.mdx", GetUnitX(t), GetUnitY(t), 180, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
    endif
    if count == 50 then
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapimported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 50 or count == 70 then
        call SoundStart("war3mapImported\\Momiji_2-2.mp3")
    endif
    if count >= 40 and count <= 90 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 16, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 20, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), GetRandomReal(- 40, - 30), 0, GetRandomReal(0.65, 1.2), 1, 255, 255, 255, PercentTo255(80))
        endif
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Momiji_5-1.mp3")
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 950, 0)
        call SetUnitAnimationByIndex(c, 14)
        call SetUnitTimeScale(c, 0.4)
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 3, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 90 and count <= 210 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.04)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(c), randomAngle(), GetRandomReal(- 120, 0), 0, GetRandomReal(0.75, 1.15), 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
    endif
    if count == 220 then
        call SoundStart("war3mapImported\\Momiji_5-2.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapimported\\SKSKSK1.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle(), 0, 0, 3.2, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00009632.mdx", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 230 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MomijiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HJ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MomijiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MomijiT takes nothing returns nothing
    set gg_trg_MomijiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MomijiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MomijiT, function Trig_MomijiT_Actions)
endfunction