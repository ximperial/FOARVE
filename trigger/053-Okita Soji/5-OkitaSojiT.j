//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OkitaSojiT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 1
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\OkitaAlter_5.mp3")
            call SoundStart("war3mapImported\\OkitaAlter_5-1.mp3")
            call SoundStart("war3mapImported\\OkitaAlter_5-2.mp3")
        else
            call SoundStart("war3mapImported\\SojiAlter_5-3.mp3")
        endif
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 1.75)
    endif
    if count == 10 then
        call Effect("war3mapImported\\exshexian5black.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\exshexian5white.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 2, 255, 255, 0, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 5
            set x = PolarX(GetUnitX(c), 300 * i, a)
            set y = PolarY(GetUnitY(c), 300 * i, a)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", x, y, 300, randomAngle(), - 90, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd3.mdl", x, y, 400, a, - 90, 0, 6, 1, 255, 255, 0, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", x, y, 300, a, - 90, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", x, y, 300, randomAngle(), - 90, 0, 3, 1, 255, 255, 0, 220)
            set i = i + 1
        endloop
    endif
    if count == 20 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
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

function Trig_OkitaSojiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A04U' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OkitaSojiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OkitaSojiT takes nothing returns nothing
    set gg_trg_OkitaSojiT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OkitaSojiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_OkitaSojiT, function Trig_OkitaSojiT_Actions )
endfunction