//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RinF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Rin_6.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SaveEffectHandle(ht, GetHandleId(z) , 2, AddSpecialEffectTarget("war3mapImported\\[A]zise-lizi-tous.mdl", c, "weapon")) 
        call SaveEffectHandle(ht, GetHandleId(z) , 3, AddSpecialEffectTarget("war3mapImported\\buff_shenlan.mdl", c, "weapon"))
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\blue-zise-shousuo.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]az_goods_tp_target(3).mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.25, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 10 then
        call SetUnitTimeScale(c, 0.01)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Rin_6-1.mp3")
        call SetUnitTimeScale(c, 0.25)
    endif
    if count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\blue-zise-shousuo.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.15, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.25, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count >= 150 and count <= 250 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 40, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 40, a))
        else
            set x = PolarX(GetUnitX(t) , 5, a)
            set y = PolarY(GetUnitY(t) , 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif 
        if count > 200 then 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 10, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        endif
    endif
    if count == 150 or count == 160 or count == 180 or count == 200 or count == 220 or count == 240 or count == 260 then
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c)+ 200, a, - 90, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c)+ 200, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(60))
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, GetUnitFlyHeight(c)+ 200, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 190 then
        call SetUnitTimeScale(c, 0.15)
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Rin_6-2.mp3")
    endif
    if count == 220 then
        call SetUnitTimeScale(c, 0.25)
    endif
    if count == 240 then
        call SoundStart("war3mapImported\\Rin_6-3.mp3")
    endif
    if count == 260 then
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 40, a + 180, - 270, 0, 3, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, - 90, 0, 4, 1, PercentTo255(90) , PercentTo255(90) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\[A]boom-blue-zhendi.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call Effect("war3mapimported\\BY_Wood_Sand_YueKongJi.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 5)
        call Effect("war3mapimported\\[A]az-ice-zhendi.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]zhendi-water.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 5, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 270 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 2))
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z) , 3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_RinF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08R' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RinF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RinF takes nothing returns nothing
    set gg_trg_RinF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RinF, function Trig_RinF_Actions)
endfunction