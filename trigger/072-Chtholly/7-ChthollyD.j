//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ChthollyD_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Chtholly_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 11)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 3, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\oxgz.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.1, 4.5, 255, 255, 255, PercentTo255(70))
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 10 then
        call SetUnitTimeScale(c, 0)
    endif
    if count <= 100 then
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.034)
    endif
    if count == 100 then
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetSpecialEffectTimeScale(e, 0.5)
    endif
    if count == 120 or count == 130 or count == 140 or count == 150 then
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c), randomAngle() , 0, 0, 4.5, 1, 0, 160, 255, 255)
    endif
    if count == 140 then
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 0.8)
    endif
    if count >= 120 and count <= 160 then
        if count > 140 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 70, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 70, 0)
        endif
    endif
    if count == 165 then
        call SoundStart("war3mapImported\\Kirito_6-2.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 170 then 
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
endfunction

function Trig_ChthollyD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FN' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ChthollyD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ChthollyD takes nothing returns nothing
    set gg_trg_ChthollyD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChthollyD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ChthollyD, function Trig_ChthollyD_Actions)
endfunction