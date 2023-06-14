//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KianaD_Func001 takes nothing returns nothing
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
    if count <= 50 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kiana_7.mp3")
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 50 then
        set x = GetUnitX(c)
        set y = GetUnitY(c)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueTargetOrderById(c, 851983, t)
        call SetUnitX(t, x)
        call SetUnitY(t, y)
        call Effect("war3mapimported\\Chain2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\GilgameshCircle.mdx", GetUnitX(t), GetUnitY(t), 25, a, - 90, 0, 7, 2, 255, 255, 255, 255)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Effect_Sound5.mp3")
        call Effect("war3mapimported\\BY_Wood_Decade_RiderKick_Explode.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_KianaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09E' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KianaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KianaD takes nothing returns nothing
    set gg_trg_KianaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KianaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KianaD, function Trig_KianaD_Actions)
endfunction