//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OkitaSojiR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\OkitaAlter_4.mp3")
        call SetUnitAnimationByIndex(c, 15)
        call SetUnitTimeScale(c, 2)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\OkitaAlter_4-4.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 200, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 200, a))
        call Effect("war3mapImported\\kdls3.mdl", GetUnitX(c), GetUnitY(c), 300, a, 0, 0, 4, 1, 255, 255, 255, 255)
    endif
    if count == 15 then
        loop
            exitwhen i > 3
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 0, 0, 255)
            set i = i + 1
        endloop
    endif
    if count == 40 then
        call SetUnitFlyHeight(c, 500, 0)
        call SetUnitFlyHeight(t, 500, 0)
    endif
    if count == 60 then
        call SetUnitFlyHeight(c, 1000, 0)
        call SetUnitFlyHeight(t, 1000, 0)
    endif
    if count == 80 then
        call SetUnitFlyHeight(c, 1500, 0)
        call SetUnitFlyHeight(t, 1500, 0)
    endif
    if count == 40 or count == 60 or count == 80 then
        call SoundStart("war3mapImported\\OkitaAlter_4-1.mp3")
        call Effect("war3mapImported\\FCJX_DG.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 90, 0, 3, 1, 255, 255, 255, 255)
        loop
            exitwhen i > 4
            call Effect("war3mapImported\\DGDDXZ4.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), randomAngle(), - 45, 0, GetRandomReal(1, 1.2), 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        set i = 0
        loop
            exitwhen i > 1
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1, 1, 255, 0, 0, 255)
            set i = i + 1
        endloop
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\OkitaAlter_4-2.mp3")
    endif
    if count >= 80 and count <= 100 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 75, 0)
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 75, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 90, 0, 1, 1, 100, 0, 0, 220)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\yydlz.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then 
        call SoundStart("war3mapImported\\OkitaAlter_4-3.mp3")
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A04T')) * GetHeroAgi(c, true))
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

function Trig_OkitaSojiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A04T' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OkitaSojiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OkitaSojiR takes nothing returns nothing
    set gg_trg_OkitaSojiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OkitaSojiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_OkitaSojiR, function Trig_OkitaSojiR_Actions )
endfunction