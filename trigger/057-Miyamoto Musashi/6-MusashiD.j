//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_MusashiD_Func001 takes nothing returns nothing
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
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\Musashi_6.mp3")
        else
            call SoundStart("war3mapImported\\Musashi_6-1.mp3")
        endif
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 5, 1.5, 255, 0, 255, 220)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Musashi_6-2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call Effect("war3mapimported\\SBXZAFB2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1.5, 255, 0, 255, 220)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        loop
            exitwhen i > 2
            set x = GetUnitX(t) + 200 * Cos((i * 120) * bj_DEGTORAD)
            set y = GetUnitY(t) + 200 * Sin((i * 120) * bj_DEGTORAD)
            set a = Angle(x, y, GetUnitX(t) , GetUnitY(t))
            call Effect("war3mapimported\\afbwzntx.mdx", x, y, 125, a + 45, 0, 0, 4, 1, 255, 255, 255, 255)
            set x = GetUnitX(t) + 400 * Cos((i * (- 120)) * bj_DEGTORAD)
            set y = GetUnitY(t) + 400 * Sin((i * (- 120)) * bj_DEGTORAD)
            set a = Angle(x, y, GetUnitX(t) , GetUnitY(t))
            call Effect("war3mapimported\\afbwzntx.mdx", x, y, 125, a - 45, 0, 0, 4, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (8 + 0.4 * GetUnitAbilityLevel(c, 'A05X')) * GetHeroAgi(c, true))
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

function Trig_MusashiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06A' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MusashiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MusashiD takes nothing returns nothing
    set gg_trg_MusashiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MusashiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MusashiD, function Trig_MusashiD_Actions)
endfunction