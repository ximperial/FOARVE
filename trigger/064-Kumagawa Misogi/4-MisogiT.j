//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisogiT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misogi_5.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count <= 200 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, GetRandomReal(0.1, 0.8) , 1, 0, 0, 0, PercentTo255(GetRandomReal(10, 30)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\SuperShinyThingy2.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, GetRandomReal(0.1, 1) , 1, 0, 0, 0, PercentTo255(GetRandomReal(70, 90)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
        endif
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Misogi_5-1.mp3")
    endif
    if count == 210 then
        call SetUnitTimeScale(c, 0.55)
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count == 280 then
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 360 then
        call SoundStart("war3mapImported\\Misogi_5-2.mp3") 
    endif
    if count == 370 then
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]uberdarkwave.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 0.5, 1, 0, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DarkPulseMisogi.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 2.5, 1, 0, 0, 0, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 3, 1, 0, 0, 0, PercentTo255(60))
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow1.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 380 then 
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
endfunction

function Trig_MisogiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08A' then 
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
        call TimerStart(z, 0.02, true, function Trig_MisogiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisogiT takes nothing returns nothing
    set gg_trg_MisogiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisogiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisogiT, function Trig_MisogiT_Actions)
endfunction