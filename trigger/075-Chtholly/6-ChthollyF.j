//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ChthollyF_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Chtholly_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 3.5, 255, 255, 255, PercentTo255(40))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\oxgz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 4, 255, 255, 255, PercentTo255(70))
        call AnimEffect(bj_lastCreatedEffect, 1, 2.8)
        call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 2.8)
    endif
    if count == 15 or count == 75 or count == 135 then
        set x = PolarX(GetUnitX(t), 400, randomAngle())
        set y = PolarY(GetUnitY(t), 400, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\Chtholly.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        if GetRandomInt(1, 2) == 1 then 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
        else
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
        endif
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 20 or count == 80 or count == 140 then
        call SoundStart("war3mapImported\\Neptun_6-1.mp3")
    endif
    if count == 25 or count == 85 or count == 145 then
        call Effect("war3mapimported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 100, GetSpecialEffectYaw(e) + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\kdls2.mdx", GetUnitX(t), GetUnitY(t), 200, GetSpecialEffectYaw(e), 0, 0, 3, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 3.5, 1, 0, 160, 255, 255)
    endif
    if count >= 15 and count <= 40 or count >= 75 and count <= 100 or count >= 135 and count <= 160 then
        call SetEffectX(e, PolarX(GetEffectX(e), 40, GetSpecialEffectYaw(e))) 
        call SetEffectY(e, PolarY(GetEffectY(e), 40, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 45 or count == 105 then
        set x = PolarX(GetUnitX(t), 400, randomAngle())
        set y = PolarY(GetUnitY(t), 400, randomAngle())
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapimported\\Chtholly.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        if GetRandomInt(1, 2) == 1 then 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
        else
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
        endif
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count == 50 or count == 110 then
        call SoundStart("war3mapImported\\Neptun_6-1.mp3")
    endif
    if count == 55 or count == 115 then
        call Effect("war3mapimported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 100, GetSpecialEffectYaw(e2) + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\kdls2.mdx", GetUnitX(t), GetUnitY(t), 200, GetSpecialEffectYaw(e2), 0, 0, 3, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e2), 0, 0, 3.5, 1, 0, 160, 255, 255)
    endif
    if count >= 45 and count <= 70 or count >= 105 and count <= 130 then
        call SetEffectX(e2, PolarX(GetEffectX(e2), 40, GetSpecialEffectYaw(e2))) 
        call SetEffectY(e2, PolarY(GetEffectY(e2), 40, GetSpecialEffectYaw(e2)))
        call SetSpecialEffectZ(e2, GetAxisZ(GetEffectX(e2), GetEffectY(e2)))
    endif
    if count == 165 then
        call SoundStart("war3mapImported\\Shu_6-3.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, GetEffectX(e))
        call SetUnitY(c, GetEffectY(e))
        call SetUnitFacing(c, GetSpecialEffectYaw(e))
        call SetUnitAnimationByIndex(c, 6)
        call Effect("war3mapImported\\File00002085.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00002105.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\36.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 4.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\zm (280).mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 175 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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
    set e2 = null
endfunction

function Trig_ChthollyF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FM' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ChthollyF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ChthollyF takes nothing returns nothing
    set gg_trg_ChthollyF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChthollyF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ChthollyF, function Trig_ChthollyF_Actions)
endfunction