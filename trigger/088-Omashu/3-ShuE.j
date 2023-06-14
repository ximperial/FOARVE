//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShuE_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Shu_2-2.mp3")
        call SoundStart("war3mapImported\\Shu_2-3.mp3")
        call SetUnitAnimationByIndex(c, 18)
        call SetUnitTimeScale(c, 1.4)
    endif
    if count == 1 or count == 5 or count == 10 or count == 15 or count == 20 then
        call Effect("war3mapImported\\File00005630.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\0614.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count <= 20 then
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 15 then
        call SetUnitAnimationByIndex(c, 17)
    endif
    if count == 20 then
        call Effect("war3mapImported\\FantasyBattle (1582).mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\0631.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 25 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A05K')) * GetHeroInt(c, true))
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

function Trig_ShuE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05K' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShuE_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ShuE takes nothing returns nothing
    set gg_trg_ShuE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShuE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShuE, function Trig_ShuE_Actions)
endfunction