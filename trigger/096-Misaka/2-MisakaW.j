//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisakaW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misaka_2.mp3")
        call SetUnitAnimationByIndex(c, 13)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\lightnings long.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 4))
    endif
    if count == 5 or count == 10 or count == 15 then
        call Effect("war3mapimported\\lightnings long.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 4))
    endif
    if count == 20 then
        call Effect("war3mapimported\\MomijiThunder.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 25 then 
        call Effect("war3mapimported\\zxd5.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0EC')) * GetHeroInt(c, true))
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

function Trig_MisakaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EC' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisakaW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisakaW takes nothing returns nothing
    set gg_trg_MisakaW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisakaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisakaW, function Trig_MisakaW_Actions)
endfunction