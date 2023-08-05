//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_WendyT_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Wendy_5.mp3")
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , 0)) 
        call SetUnitX(c, PolarX(GetUnitX(t) , - 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 400, a))
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 1.5, 4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4) 
        call Effect("war3mapImported\\az_airflowwEnd.mdl", GetUnitX(t) , GetUnitY(t) , - 350, a, 0, 0, 3.3, 4, 70, 240, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        set x = PolarX(GetUnitX(c) , 120, a)
        set y = PolarY(GetUnitY(c) , 120, a)
        call Effect("war3mapImported\\MC Wendy.mdl", x , y , 150, a, - 90, 0, 1.5, 5, 255, 255, 255, 255)
        call Effect("war3mapImported\\by_wood_effect_yuanbanlin_sand2.mdl", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 1.2, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_3_0.mdl", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 0.4, 4, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\rasengan_eff4.mdl", GetUnitX(c) , GetUnitY(c) , 0, randomAngle() , 0, 0, 2, 4, 255, 255, 255, 150)
        call Effect("war3mapImported\\dingzhi_by_wood_effect_kuosanqiliu.mdl", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 2, 4, 255, 255, 255, 155)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect , 2)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count <= 200 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\disruptor_e2.mdl", GetUnitX(t) , GetUnitY(t) , GetRandomReal(0, 200) , randomAngle() , 0, 0, GetRandomReal(1.2, 1.5) , 1, 70, 240, 255, 150)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 200 then
        set x = PolarX(GetUnitX(c) , 80, a)
        set y = PolarY(GetUnitY(c) , 80, a)
        call Effect("war3mapImported\\kameha3.mdl", x , y , -10, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 210 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_WendyT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06L' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_WendyT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_WendyT takes nothing returns nothing
    set gg_trg_WendyT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_WendyT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_WendyT, function Trig_WendyT_Actions)
endfunction