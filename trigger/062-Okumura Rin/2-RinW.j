//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RinW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Rin_2.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 20 then
        set x = PolarX(GetUnitX(c) , 100, a)
        set y = PolarY(GetUnitY(c) , 100, a)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a + 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a - 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\blue-slash-more.mdx", x, y, 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 360, 0, 2, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 360, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\File00000432.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 180, 0, 3.6, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count >= 20 and count <= 40 then
        set x = PolarX(GetUnitX(t) , 20, a)
        set y = PolarY(GetUnitY(t) , 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count >= 40 and count <= 60 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
    endif
    if count == 60 then
        set x = PolarX(GetUnitX(c) , 100, a)
        set y = PolarY(GetUnitY(c) , 100, a)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a + 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a - 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\blue-slash-more.mdx", x, y, 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]blue-shoot.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 225, 0, 1, 1, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        set x = PolarX(GetUnitX(c) , 150, a)
        set y = PolarY(GetUnitY(c) , 150, a)
        call Effect("war3mapimported\\[A]AZ_chongci-blue.mdx", x, y, 40, a, - 225, 0, 2, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 80, a, - 90, 0, 1.25, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(60))
    endif
    if count >= 60 and count <= 80 then
        set x = PolarX(GetUnitX(t) , 20, a)
        set y = PolarY(GetUnitY(t) , 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
        if count > 70 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0) 
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif 
    endif
    if count == 70 then
        call SetUnitAnimation(c, "stand")
        call SetUnitTimeScale(c, 1)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Rin_2-1.mp3")
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitTimeScale(c, 0.8)
        call SetUnitAnimationByIndex(c, 1)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_6.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.45, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.15, 1, PercentTo255(80) , PercentTo255(80) , 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, PercentTo255(80) , PercentTo255(80) , 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
    endif
    if count >= 80 and count <= 120 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 30, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        endif
        if count > 110 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 45, 0) 
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 15, 0)
        endif
    endif
    if count == 120 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, PercentTo255(40) , PercentTo255(40) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\[A]002_blue.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\TealSlam.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\az-blue-lizi-shangsheng.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\blue-guangzhu-linghun.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 270, 0, 2.75, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 130 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A08M')) * GetHeroAgi(c, true))
        call knockupUnit(t, 0.6, 400)
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

function Trig_RinW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08M' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RinW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RinW takes nothing returns nothing
    set gg_trg_RinW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RinW, function Trig_RinW_Actions)
endfunction