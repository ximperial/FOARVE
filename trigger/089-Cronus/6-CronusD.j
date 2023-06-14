//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_CronusD_Func001 takes nothing returns nothing
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
    if count <= 20 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Cronus_3.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 10 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Cronus_3-1.mp3")
        call SoundStart("war3mapImported\\Cronus_3-2.mp3")
        call SoundStart("war3mapImported\\Cronus_3-3.mp3")
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(t), GetUnitY(t), 120, a, - 90, 0, 3, 1, 0, 255, 0, 255)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 20 and count <= 50 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set a = LoadReal(ht, GetHandleId(z), 0)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 0, 255, 0, 255)
            call Effect("war3mapImported\\Chongfengnew.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 0)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
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
endfunction

function Trig_CronusD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A063' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_CronusD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_CronusD takes nothing returns nothing
    set gg_trg_CronusD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CronusD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_CronusD, function Trig_CronusD_Actions)
endfunction