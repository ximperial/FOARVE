//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_EsdeathR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Esdeath_4.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call Effect("war3mapImported\\[Plagiat]Effect153.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 3, 255, 255, 255, PercentTo255(50))
        call Effect("war3mapImported\\[Plagiat]Effect153.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 3, 255, 255, 255, PercentTo255(50))
        call Effect("war3mapImported\\[Plagiat]Effect153.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 3, 255, 255, 255, PercentTo255(50))
        call Effect("war3mapImported\\[Plagiat]Effect312.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
    endif
    if count == 75 then
        call SoundStart("war3mapImported\\Esdeath_4-1.mp3")
        call Effect("war3mapImported\\[Plagiat]Effect312.mdl", GetUnitX(c), GetUnitY(c), 520, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 75 and count <= 105 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e), dist / 30, a)
        set y = PolarY(GetEffectY(e), dist / 30, a)
        set z1 = GetEffectZ(e) - GetAxisZ(x - 0.01, y) + GetAxisZ(x, y)
        call SetSpecialEffectPositionEx(e, x, y, z1 - 17)
        if count == 105 then
            call SetSpecialEffectAnimation(e, "death")
        endif
    endif
    if count == 105 then
        call SoundStart("war3mapImported\\Sabo_5-1.mp3")
        call Effect("war3mapImported\\XZDL2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\[Plagiat]Effect373.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\[Plagiat]Effect568_2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 115 then
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A040')) * GetHeroAgi(c, true))
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
    set e = null
endfunction

function Trig_EsdeathR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A040' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EsdeathR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EsdeathR takes nothing returns nothing
    set gg_trg_EsdeathR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EsdeathR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EsdeathR, function Trig_EsdeathR_Actions )
endfunction