//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KirinR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kirin_4.mp3")
        call SetUnitAnimationByIndex(c, 0)
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2.5, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
    endif
    if count == 100 then
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 4.5, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
    endif
    if count <= 250 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 1.85), 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.1, 1.35), 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
    endif
    if count == 270 then
        call SoundStart("war3mapImported\\Kirin_4-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count >= 280 and count <= 340 then
        set x = PolarX(GetUnitX(t), 9, a)
        set y = PolarY(GetUnitY(t), 9, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\blue-daoguang-new.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1.15, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.85))
        endif
    endif
    if count == 340 then
        call SetUnitTimeScale(c, 2)
    endif
    if count == 340 or count == 350 or count == 360 or count == 370 or count == 380 or count == 390 or count == 400 then
        call SetUnitAnimation(c, "attack")
    endif
    if count >= 340 and count <= 400 then
        set x = PolarX(GetUnitX(t), 12, a)
        set y = PolarY(GetUnitY(t), 12, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\YoooBug_HitFx.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 8, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindWeak2.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(3.5, 4.1), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\slashone.mdx", GetUnitX(t), GetUnitY(t), 30, randomAngle(), 0, 0, 0.9, 1, 255, 102, 102, 255)
        endif
    endif
    if count == 410 then
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00009632.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 420 then 
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0HP')) * GetHeroInt(c, true))
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

function Trig_KirinR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HP' then 
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
        call TimerStart(z, 0.02, true, function Trig_KirinR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KirinR takes nothing returns nothing
    set gg_trg_KirinR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KirinR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KirinR, function Trig_KirinR_Actions)
endfunction