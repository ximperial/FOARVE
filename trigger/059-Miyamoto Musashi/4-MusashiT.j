//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_MusashiT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Musashi_5.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Musashi_5-1.mp3")
        loop
            exitwhen i > 7
            set x = GetUnitX(c) + (200 * i) * Cos(a * bj_DEGTORAD)
            set y = GetUnitY(c) + (200 * i) * Sin(a * bj_DEGTORAD)
            call Effect("war3mapimported\\SZBYAFB2.mdx", x, y, 25, a, 0, 0, GetRandomReal(2, 3) , 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\zxd3.mdx", x, y, 25, a, 0, 0, GetRandomReal(4, 5) , 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\wzcfql.mdx", x, y, 25, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call knockupUnit(t, 0.8, 600)
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

function Trig_MusashiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A060' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MusashiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MusashiT takes nothing returns nothing
    set gg_trg_MusashiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MusashiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MusashiT, function Trig_MusashiT_Actions)
endfunction