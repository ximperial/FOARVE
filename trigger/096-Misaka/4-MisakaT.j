//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisakaT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Misaka_5.mp3")
        call SetUnitAnimationByIndex(c, 11)
    endif
    if count == 1 or count == 10 or count == 20 then
        call Effect("war3mapimported\\MomijiThunder.mdx", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Misaka_5-1.mp3")
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 11)
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Misaka_5-2.mp3")
        call Effect("war3mapimported\\zxd5.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 30 then
        call Effect("war3mapimported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ChaoDianCiPao.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
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

function Trig_MisakaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EF' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MisakaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MisakaT takes nothing returns nothing
    set gg_trg_MisakaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisakaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisakaT, function Trig_MisakaT_Actions)
endfunction