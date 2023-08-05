//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AliceW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Alice_2.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 0.6)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 20 or count == 30 or count == 40 or count == 50 then
        call SetUnitAnimationByIndex(c, GetRandomInt(3, 4))
    endif
    if count == 30 or count == 40 then
        call SoundStart("war3mapImported\\Aya_3-1.mp3")
    endif
    if count >= 20 and count <= 60 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(1.3, 1.7), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(c), GetUnitY(c), 40, randomAngle(), GetRandomReal(-30, -20), 0, GetRandomReal(1.5, 2.5), 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(c), GetUnitY(c), 40, randomAngle(), GetRandomReal(20, 30), 0, GetRandomReal(1.5, 2.5), 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
    endif
    if count == 65 then
        call SoundStart("war3mapImported\\Aya_2-1.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapimported\\Tanziro_Skill.mdx", GetUnitX(c), GetUnitY(c), 100, a+220, 0, 0, 2.5, 1, 255, 178, 102, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\lb_hdg.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 178, 102, 255)
        call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 75 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0I5')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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
endfunction

function Trig_AliceW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0I5' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AliceW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AliceW takes nothing returns nothing
    set gg_trg_AliceW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AliceW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AliceW, function Trig_AliceW_Actions)
endfunction