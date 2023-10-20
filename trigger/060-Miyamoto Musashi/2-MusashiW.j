//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_MusashiW_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 20 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Musashi_2.mp3")
        call SoundStart("war3mapImported\\Musashi_2-1.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, .75)
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapimported\\musashi.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 155)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .75)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A05J')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call Effect("war3mapimported\\TZJQ.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 20 and count <= 50 then
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e) , GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set a = LoadReal(ht, GetHandleId(z) , 0)
            call Effect("war3mapimported\\wzcfql.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
        endif
    endif
    if count == 50 then 
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MusashiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05J' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MusashiW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MusashiW takes nothing returns nothing
    set gg_trg_MusashiW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MusashiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MusashiW, function Trig_MusashiW_Actions)
endfunction