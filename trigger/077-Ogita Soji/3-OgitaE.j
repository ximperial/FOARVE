//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaE_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ogita_3.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        call SetUnitAnimationByIndex(c, 11)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count == 5 then
        call SetUnitFacing(c, a)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Yomi_5-2.mp3")
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\zhanji-blue-shu.mdx", GetUnitX(t), GetUnitY(t), 50, a + 60, 0, 0, 0.85, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0GF')) * GetHeroAgi(c, true))
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

function Trig_OgitaE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GF' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OgitaE_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OgitaE takes nothing returns nothing
    set gg_trg_OgitaE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaE, function Trig_OgitaE_Actions)
endfunction