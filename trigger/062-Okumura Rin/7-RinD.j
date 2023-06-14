//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RinD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Rin_7.mp3")
        call Effect("war3mapimported\\[A]RinRfire1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.2, 1, PercentTo255(50) , PercentTo255(50) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\[A]RinRfire.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 5, 255, 255, 255, PercentTo255(70))
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 1 then
        call SetEffectX(e, GetUnitX(c))
        call SetEffectY(e, GetUnitY(c))
        call SetSpecialEffectZ(e, 25 + GetUnitZ(c))
    endif
    if count == 50 or count == 180 or count == 260 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(25))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(c) , 50, a)
        set y = PolarY(GetUnitY(c) , 50, a)
        call Effect("war3mapimported\\rasengan_eff4.mdx", x, y, 80, a, - 90, 0, 0.7, 1, 255, 255, 255, PercentTo255(30))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.3, 1, 255, 255, 255, PercentTo255(70))
    endif
    if count >= 50 and count <= 80 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 15, a))
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
    endif
    if count == 70 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Rin_7-1.mp3") 
    endif
    if count == 90 or count == 140 or count == 260 then
        if count == 90 then
            set x = PolarX(GetUnitX(t) , 100, a)
            set y = PolarY(GetUnitY(t) , 100, a)
            call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, a + 75, 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, a - 75, 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(t) , 50, a)
            set y = PolarY(GetUnitY(t) , 50, a)
            call Effect("war3mapimported\\[A]GongChengBlue.mdx", x, y, 25, a, 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\[A]GongChengBlue.mdx", x, y, 25, a + 180, 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a + 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\[A]n3s_o_target.mdx", x, y, 25, a - 45, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.11)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c) , GetUnitY(c) , 80, a, - 90, 0, 1.35, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(80))
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.45, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(GetRandomReal(50, 90)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.8))
        call Effect("war3mapimported\\blue-slash-more.mdx", x, y, 25, a, 0, 0, 0.45, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count >= 90 and count <= 120 or count >= 140 or count <= 180 then
        set x = PolarX(GetUnitX(t) , 5, a)
        set y = PolarY(GetUnitY(t) , 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count >= 110 and count <= 140 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 120 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 140 then
        set x = PolarX(GetUnitX(t) , 100, a)
        set y = PolarY(GetUnitY(t) , 100, a)
        call Effect("war3mapimported\\huoyantuci.mdx", x, y, 25, a, 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1.2, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1.4, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 360, 0, 1.65, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Rin_7-2.mp3")
    endif
    if count >= 180 and count <= 260 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 30, a))
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
    endif
    if count == 230 then
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 0.6)
    endif
    if count == 260 then
        set x = PolarX(GetUnitX(t) , - 100, a)
        set y = PolarY(GetUnitY(t) , - 100, a)
        call Effect("war3mapimported\\daoguang.mdx", x, y, 25, a, - 360, 0, 1.45, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", x, y, 25, a, - 360, 0, 1.85, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\daoguang.mdx", x, y, 25, a, - 360, 0, 2.45, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        set x = PolarX(GetUnitX(t) , - 120, a)
        set y = PolarY(GetUnitY(t) , - 120, a)
        call Effect("war3mapimported\\daoguang-blue-hengsao.mdx", x, y, 25, a, 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        set x = PolarX(GetUnitX(t) , - 50, a)
        set y = PolarY(GetUnitY(t) , - 50, a)
        call Effect("war3mapimported\\[A]RinRfire1.mdx", x, y, 80, a + 180, - 90, 0, 1.15, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(t) , - 70, a)
        set y = PolarY(GetUnitY(t) , - 70, a)
        call Effect("war3mapimported\\AZ_PAFeathermoon_C_Caster.mdx", x, y, 120, a, - 180, 0, 3.1, 1, PercentTo255(60) , PercentTo255(60) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\File00000432.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 180, 0, 3.6, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, - 180, 0, 3.6, 1, PercentTo255(90) , PercentTo255(90) , 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 270 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_RinD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08S' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RinD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RinD takes nothing returns nothing
    set gg_trg_RinD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RinD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RinD, function Trig_RinD_Actions)
endfunction