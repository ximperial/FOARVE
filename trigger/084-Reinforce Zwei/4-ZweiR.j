//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ZweiR_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Reinforce_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 0.8)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 10, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(80)) 
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\Evolt-7.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.5, 2, 255, 255, 255, 255) 
        call AnimEffect(bj_lastCreatedEffect, 1, 0.8)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Reinforce_4-1.mp3")
        call Effect("war3mapimported\\PurpleShield.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.5, 1.5, PercentTo255(18),  PercentTo255(18), PercentTo255(60), 0)
        call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        call Effect("war3mapimported\\BlackHoleOt.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.3, 1.5, 0, 0, 0, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
        call Effect("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        call SaveEffectHandle(ht, GetHandleId(z), 12, bj_lastCreatedEffect)
    endif
    if count >= 10 and count <= 30 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 10)
        call SetSpecialEffectZ(e, GetEffectZ(e) - 2)
        call SetSpecialEffectAlpha(e, PercentTo255(20 + (count-10) * 4))
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.32)
        set e = LoadEffectHandle(ht, GetHandleId(z), 11)
        call SetSpecialEffectZ(e, GetEffectZ(e) - 4.5)
        call SetSpecialEffectAlpha(e, PercentTo255((count-10) * 4))
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.2)
        set e = LoadEffectHandle(ht, GetHandleId(z), 12)
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 1)
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Effect_SoundQ.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 10)
        call SetSpecialEffectAnimation(e, "death")
        set e = LoadEffectHandle(ht, GetHandleId(z), 11)
        call SetSpecialEffectAnimation(e, "death")
        set e = LoadEffectHandle(ht, GetHandleId(z), 12)
        call SetSpecialEffectAnimation(e, "death")
    endif
    if count == 50 then
        call Effect("war3mapimported\\windcaotic3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\PurpleExplode.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 60 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A09I')) * GetHeroInt(c, true))
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
    set e = null
endfunction

function Trig_ZweiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09I' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ZweiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ZweiR takes nothing returns nothing
    set gg_trg_ZweiR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ZweiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ZweiR, function Trig_ZweiR_Actions)
endfunction