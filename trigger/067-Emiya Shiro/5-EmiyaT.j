//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_EmiyaT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Emiya_5.mp3")
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Emiya_5-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 100 then
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count >= 20 and count <= 160 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(c), GetUnitY(c), 40, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(c), GetUnitY(c), 150, randomAngle(), - 45, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(c), GetUnitY(c), 150, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(3, 6), 1, GetRandomInt(1, 255), GetRandomInt(1, 255), GetRandomInt(1, 255), PercentTo255(GetRandomReal(25, 80)))
            if count >= 100 then
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 1.65), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\akiha_claw_blugreen.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), - 35, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\akiha_claw_red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), - 35, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\EarthSmash.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            endif
        endif
    endif
    if count == 160 then
        call SoundStart("war3mapImported\\Satomi_4-5.mp3")
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
    endif
    if count == 170 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_EmiyaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0DA' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EmiyaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EmiyaT takes nothing returns nothing
    set gg_trg_EmiyaT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EmiyaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EmiyaT, function Trig_EmiyaT_Actions )
endfunction