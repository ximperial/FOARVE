//TESH.scrollpos=9
//TESH.alwaysfold=0
function Trig_JotaroW_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Jotaro_1.mp3")
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 1.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), 0, dist)
    endif
    if count == 10 then
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetSpecialEffectTimeScale(e, 0.3)
    endif
    if count == 30 then
        call SetSpecialEffectAnimationByIndex(e, 2)
        call SetSpecialEffectTimeScale(e, 0.5)
    endif
    if count == 40 then
        set dist = LoadReal(ht, GetHandleId(z), 0)
        if dist > 400 then
            call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetEffectX(e, PolarX(GetUnitX(t), 120, a))
            call SetEffectY(e, PolarY(GetUnitY(t), 120, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
            call SetSpecialEffectYaw(e, a + 180)
            call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        else
            call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetEffectX(e, PolarX(GetUnitX(t), -120, a))
            call SetEffectY(e, PolarY(GetUnitY(t), -120, a))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
            call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 50 then
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\Jotaro_2.mp3")
        else
            call SoundStart("war3mapImported\\Jotaro_2-1.mp3")
        endif
        set dist = LoadReal(ht, GetHandleId(z), 0)
        if dist > 400 then
            set a = a + 180
        endif
        call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\flashaura.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 60 then 
        set dist = LoadReal(ht, GetHandleId(z), 0)
        if dist > 400 then
            set a = a + 180
        endif
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A02Q')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_JotaroW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02Q' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_JotaroW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_JotaroW takes nothing returns nothing
    set gg_trg_JotaroW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JotaroW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JotaroW, function Trig_JotaroW_Actions )
endfunction