//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisogiD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Misogi_7.mp3")
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , 0)) 
        call SetUnitX(c, PolarX(GetUnitX(t) , - 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 400, a))
        call SetUnitAnimationByIndex(c, 2)
        call SaveReal(ht, GetHandleId(z) , 0, a)
    endif
    if count <= 30 then
        set a = LoadReal(ht, GetHandleId(z) , 0)
        call SetUnitX(c, PolarX(GetUnitX(c) , 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c) , 20, a))
    endif
    if count == 20 then
        call SetUnitTimeScale(c, 1.5) 
        call Effect("war3mapimported\\Medaka Box Misogi Kumagawa Screw 1.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 3, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Misogi_7-1.mp3")
        call SetUnitFacing(c, a)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 0.5, 1, 0, 0, 0, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Misogi_7-2.mp3")
        call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 25, a + 45, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a + 45, - 90, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Misogi_7-2.mp3")
        call Effect("war3mapimported\\[A]blackstrike.mdx", GetUnitX(t) , GetUnitY(t) , 25, a - 45, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a - 45, - 90, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 110 then
        call SoundStart("war3mapImported\\Misogi_7-3.mp3")
        call SetUnitTimeScale(c, 1)
    endif
    if count == 140 then
        call SetUnitAnimation(c, "spell slam")
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 0, 0, 0, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 150 then
        call Effect("war3mapimported\\Medaka Box Misogi Kumagawa Screw 3.mdx", GetUnitX(t) , GetUnitY(t) , 800, a, - 90, 0, 5, 1, 255, 255, 255, 255) 
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 150 and count <= 170 then
        call SetSpecialEffectZ(e, GetEffectZ(e) - 40)
    endif
    if count == 170 then
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]Kuroi Getsuga Tenshou Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]darkfog.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.7, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.55, 1, 0, 0, 0, PercentTo255(60)) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapimported\\[A]DarkPulseMisogi.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 0, 0, 0, PercentTo255(40)) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60)) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count == 180 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z) , 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MisogiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisogiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisogiD takes nothing returns nothing
    set gg_trg_MisogiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisogiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisogiD, function Trig_MisogiD_Actions)
endfunction