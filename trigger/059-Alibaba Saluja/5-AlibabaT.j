//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AlibabaT_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 3)
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
        call SoundStart("war3mapImported\\Alibaba_5.mp3")
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , 0))
    endif
    if count == 10 then
        call SetUnitX(c, PolarX(GetUnitX(t) , -400, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , -400, a))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(c) , -300, a)
        set y = PolarY(GetUnitY(c) , -300, a)
        call Effect("war3mapimported\\alibabamagiccircle.mdx", x, y, 225, a, -90, 0, 4, 5, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(c) , -200, a)
        set y = PolarY(GetUnitY(c) , -200, a)
        call Effect("war3mapimported\\Amon.mdx", x, y, 25, a, 0, 0, 1.5, 5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 10 and count <= 250 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 15 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\magmaburst.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(1, 3) , 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            loop
                exitwhen i > 11
                set x = PolarX(GetEffectX(e) , 350, i * 30)
                set y = PolarY(GetEffectY(e) , 350, i * 30)
                call Effect("war3mapimported\\FireShockRun2.mdx", x, y, 25, i * 30, 0, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
    endif
    if count == 90 then
        call SetUnitAnimationByIndex(c, 10)
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetUnitTimeScale(c, .3)
        call SetSpecialEffectTimeScale(e, .6)
    endif
    if count == 130 then
        call SetUnitTimeScale(c, 0)
        call SetSpecialEffectTimeScale(e, 0)
    endif
    if count == 210 then
        call SetUnitTimeScale(c, 1)
        call SetSpecialEffectTimeScale(e, .75)
    endif
    if count == 230 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 240 then
        call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 4, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\AFB_dabaozha.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 2)
        call Effect("war3mapimported\\XZDL2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
    endif
    if count == 250 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z) , 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_AlibabaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A049' then 
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
        call TimerStart(z, 0.02, true, function Trig_AlibabaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AlibabaT takes nothing returns nothing
    set gg_trg_AlibabaT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlibabaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AlibabaT, function Trig_AlibabaT_Actions)
endfunction