//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_LeviF_Func001 takes nothing returns nothing
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
    local real randomA
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
        call SoundStart("war3mapImported\\Levi_6.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(t), 0))
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 5 or count == 15 then
        call Effect("war3mapimported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 25 then
        call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t) , 500, a + 60)
        set y = PolarY(GetUnitY(t) , 500, a + 60)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacing(c, a)
    endif
    if count >= 25 and count <= 45  then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call Effect("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(c) , 30, a + 60))
        call SetUnitY(c, PolarY(GetUnitY(c) , 30, a + 60))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist <= 140 then
            set count = 50
        endif
    endif
    if count == 50 then
        call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t) , 600, a + 60)
        set y = PolarY(GetUnitY(t) , 600, a + 60)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacing(c, a)
    endif
    if count >= 50 and count <= 70 then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call Effect("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(c) , 35, a + 55))
        call SetUnitY(c, PolarY(GetUnitY(c) , 35, a + 55))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist <= 140 then
            set count = 75
        endif
    endif
    if count == 75 then
        call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t) , 700, a + 60)
        set y = PolarY(GetUnitY(t) , 700, a + 60)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacing(c, a)
    endif
    if count >= 75 and count <= 95 then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call Effect("Abilities\\Spells\\Human\\FlakCannons\\FlakTarget.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(c) , 40, a - 55))
        call SetUnitY(c, PolarY(GetUnitY(c) , 40, a - 55))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist <= 140 then
            set count = 100
        endif
    endif
    if count == 100 then
        call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t) , 700, a + 60)
        set y = PolarY(GetUnitY(t) , 700, a + 60)
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacing(c, a)
    endif
    if count >= 100 and count <= 375 then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitX(c, PolarX(GetUnitX(c) , 35, a + 40))
        call SetUnitY(c, PolarY(GetUnitY(c) , 35, a + 40))
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist <= 140 then
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            set randomA = randomAngle()
            call SetUnitX(c, PolarX(x , 700, randomA))
            call SetUnitY(c, PolarY(y , 700, randomA))
            set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacing(c, a)
            call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 380 then
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x , 800, randomA))
        call SetUnitY(c, PolarY(y , 800, randomA))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacing(c, a)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitPathing(c, false)
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count >= 385 and count <= 410 then
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitX(c, PolarX(GetUnitX(c) , 32, a))
        call SetUnitY(c, PolarY(GetUnitY(c) , 32, a))
        if count > 400 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 40, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 30, 0)
        endif
    endif
    if count == 410 then
        call Effect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 40, 0, 0, 1.5, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))  
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
        call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
    endif
    if count == 420 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitPathing(c, true)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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

function Trig_LeviF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0EN' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_LeviF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_LeviF takes nothing returns nothing
    set gg_trg_LeviF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_LeviF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_LeviF, function Trig_LeviF_Actions)
endfunction