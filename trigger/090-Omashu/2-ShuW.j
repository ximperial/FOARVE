//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShuW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Shu_2-1.mp3")
        call SoundStart("war3mapImported\\Shu_1-2.mp3")
        call SetUnitAnimationByIndex(c, 15)
    endif
    if count == 1 or count == 5 or count == 10 then
        call Effect("war3mapImported\\File00005630.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 15 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a)) 
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 15 then
        call Effect("war3mapImported\\1062.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\0631.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 1.5)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 15 and count <= 30 then
        set a = LoadReal(ht, GetHandleId(z), 0) + 12
        call SetUnitX(t, PolarX(GetUnitX(c), 120, a)) 
        call SetUnitY(t, PolarY(GetUnitY(c), 120, a))
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 20 then
        call Effect("war3mapImported\\FantasyBattle (1582).mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\0631.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 25 then
        call Effect("war3mapImported\\FantasyBattle (1520).mdl", GetUnitX(c), GetUnitY(c), 200, randomAngle(), 0, 0, 6, 1, 255, 255, 255, 255)
    endif
    if count == 30 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A05F')) * GetHeroInt(c, true))
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

function Trig_ShuW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05F' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShuW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ShuW takes nothing returns nothing
    set gg_trg_ShuW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShuW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShuW, function Trig_ShuW_Actions)
endfunction