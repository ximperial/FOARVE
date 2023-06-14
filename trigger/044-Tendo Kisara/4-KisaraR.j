//TESH.scrollpos=21
//TESH.alwaysfold=0
function Trig_KisaraR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kisara_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 10 or count == 20 or count == 30 or count == 40 then
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 30 then
        call Effect("war3mapImported\\az-blue-lizi-shangsheng.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 50 then
        call Effect("war3mapImported\\FreezingRing.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\IceNova.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 70 then
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1.4)
    endif
    if count == 90 then
        call Effect("war3mapImported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        set x = PolarX(GetUnitX(t), 200, a)
        set y = PolarY(GetUnitY(t), 200, a)
        call Effect("war3mapImported\\az_jingzi_jiansheng01_e1.mdx", x, y, 0, a + 180, 0, 0, 1.6, 1, 255, 255, 255, 255)
    endif
    if count == 100 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A013')) * GetHeroAgi(c, true))
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

function Trig_KisaraR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A013' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KisaraR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KisaraR takes nothing returns nothing
    set gg_trg_KisaraR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KisaraR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KisaraR, function Trig_KisaraR_Actions )
endfunction