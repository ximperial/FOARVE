//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MystoW_Func001 takes nothing returns nothing
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
    if count <= 25 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Mysto_2.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 5 then
        set x = PolarX(GetUnitX(c), 100, a)
        set y = PolarY(GetUnitY(c), 100, a)
        call Effect("war3mapimported\\skymgs.mdx", x, y, 110, a, - 90, 0, 1.1, 1, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\MiniExplode.mp3")
        call Effect("war3mapimported\\SkyRing.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\SkyBomb.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255) 
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0DP')) * GetHeroInt(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
    endif
    if count >= 25 and count <= 55 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\SkyBomb.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255) 
        endif
    endif
    if count == 55 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_MystoW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0DP' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MystoW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MystoW takes nothing returns nothing
    set gg_trg_MystoW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MystoW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MystoW, function Trig_MystoW_Actions)
endfunction