//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AkainuD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Akainu_7.mp3")
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
    endif
    if count == 15 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Akainu_7-1.mp3")
        loop
            exitwhen i > 7
            set x = PolarX(GetUnitX(t), 300, i * 45)
            set y = PolarY(GetUnitY(t), 300, i * 45)
            call Effect("war3mapimported\\firessl.mdx", x, y, 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\firebbic.mdx", x, y, 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set i = i + 1
        endloop
    endif
    if count == 30 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_AkainuD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A01H' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AkainuD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AkainuD takes nothing returns nothing
    set gg_trg_AkainuD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkainuD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkainuD, function Trig_AkainuD_Actions)
endfunction