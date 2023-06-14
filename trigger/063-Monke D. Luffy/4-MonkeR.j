//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeR_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Monke_4.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call SetUnitTimeScale(c, 0.25)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Monke_4-1.mp3")
    endif
    if count == 130 then
        call SoundStart("war3mapImported\\Monke_4-2.mp3")
    endif
    if count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.4, 0.6) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 30)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
        endif
    endif
    if count == 150 or count == 200 or count == 250 or count == 300 then
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 0.5) 
    endif
    if count >= 150 and count <= 350 then
        set x = PolarX(GetUnitX(t) , 3, a)
        set y = PolarY(GetUnitY(t) , 3, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            if dist < 600 then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            else
                call SetUnitX(t, PolarX(GetUnitX(c) , 600, a))
                call SetUnitY(t, PolarY(GetUnitY(c) , 600, a))
            endif 
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\File00001831.mdx", x, y, 100, a, 0, 0, GetRandomReal(1.75, 2.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(80, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\File00001831.mdx", x, y, 100, a, 0, 0, GetRandomReal(1.75, 2.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(80, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\Hit.mdx", x, y, 100, a, 0, 0, GetRandomReal(1.25, 1.65) , 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\Hit.mdx", x, y, 100, a, 0, 0, GetRandomReal(1.25, 1.65) , 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            set x = PolarX(GetUnitX(c) , GetRandomReal(0, 400) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(0, 400) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\EffecthPush.mdx", x, y, 100, a, 0, 0, GetRandomReal(0.6, 0.7) , 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            set x = PolarX(GetUnitX(c) , GetRandomReal(0, 400) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(0, 400) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\EffecthPush.mdx", x, y, 100, a, 0, 0, GetRandomReal(0.6, 0.7) , 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\AZ_Jugg_E1.mdx", x, y, 100, a, 0, 0, GetRandomReal(1, 1.3) , 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            set x = PolarX(GetUnitX(c) , GetRandomReal(50, 700) , a)
            set y = PolarY(GetUnitY(c) , GetRandomReal(50, 700) , a)
            set x = PolarX(x, GetRandomReal(- 300, 300) , a - 90)
            set y = PolarY(y, GetRandomReal(- 300, 300) , a - 90)
            call Effect("war3mapimported\\AZ_Jugg_E1.mdx", x, y, 100, a, 0, 0, GetRandomReal(1, 1.3) , 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.4, 0.6) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 30)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.3) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.35, 0.5) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c) , GetUnitY(c) , 100, a, 0, 0, GetRandomReal(0.75, 1.25) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
        endif
    endif
    if count == 360 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A08V')) * GetHeroAgi(c, true))
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

function Trig_MonkeR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08V' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_MonkeR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MonkeR takes nothing returns nothing
    set gg_trg_MonkeR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MonkeR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MonkeR, function Trig_MonkeR_Actions)
endfunction