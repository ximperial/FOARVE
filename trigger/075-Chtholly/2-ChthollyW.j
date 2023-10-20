//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ChthollyW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Chtholly_2.mp3")
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Chtholly_2-1.mp3")
        call SoundStart("war3mapImported\\Chtholly_2-2.mp3")
        call Effect("war3mapimported\\Dead Spirit by Deckai2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitFacingEx(c, a + 180, true)
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 20 then
        call Effect("war3mapimported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 100, a + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\kdls2.mdx", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 3, 1, 255, 255, 255, 255) 
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1, 0, 160, 255, 255)
    endif
    if count == 30 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0FI')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_ChthollyW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FI' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ChthollyW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ChthollyW takes nothing returns nothing
    set gg_trg_ChthollyW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ChthollyW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ChthollyW, function Trig_ChthollyW_Actions)
endfunction