//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisogiR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misogi_4.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.25)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Misogi_4-1.mp3")
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 40, a + 45, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 40, a - 45, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 50, a + 45, - 45, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 50, a - 45, - 45, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(t) , GetUnitY(t) , 100, a + 45, - 90, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.85, 1, 0, 0, 0, PercentTo255(40))
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Misogi_4-2.mp3")
        call SetUnitTimeScale(c, 1)
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count == 60 then
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(t) , GetUnitY(t) , 100, a - 45, - 90, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.85, 1, 0, 0, 0, PercentTo255(40)) 
        call Effect("war3mapimported\\[A]blackstrike.mdx", PolarX(GetUnitX(t) , 100, a) , PolarY(GetUnitY(t) , 100, a) , 40, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", PolarX(GetUnitX(c) , 30, a + 120) , PolarY(GetUnitY(c) , 30, a + 120) , 100, a, - 90, 0, 0.85, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", PolarX(GetUnitX(c) , 30, a + 120) , PolarY(GetUnitY(c) , 30, a + 120) , 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SaveReal(ht, GetHandleId(z) , 0, a)
    endif
    if count >= 60 and count <= 70 then
        set a = LoadReal(ht, GetHandleId(z) , 0)
        call SetUnitX(c, PolarX(GetUnitX(c) , 26, a))
        call SetUnitY(c, PolarY(GetUnitY(c) , 26, a))
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Misogi_4-3.mp3")
        call SetUnitFacing(c, a + 180)
    endif
    if count >= 70 and count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, GetRandomReal(0.1, 0.75) , 1, 0, 0, 0, PercentTo255(40))
            call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , - 45, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]blackbombb.mdx", PolarX(GetUnitX(t) , GetRandomReal(- 200, 200) , randomAngle()) , PolarY(GetUnitY(t) , GetRandomReal(- 200, 200) , randomAngle()) , 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 160 then
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]DarkPulseMisogi.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2.5, 1, 0, 0, 0, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 170 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A089')) * GetHeroAgi(c, true))
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

function Trig_MisogiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A089' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisogiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisogiR takes nothing returns nothing
    set gg_trg_MisogiR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisogiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisogiR, function Trig_MisogiR_Actions)
endfunction