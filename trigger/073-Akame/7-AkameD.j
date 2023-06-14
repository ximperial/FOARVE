//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AkameD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real a2
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Akame_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c) , 25, a , 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 15)
    endif
    if count <= 30 then
        if dist < 600 then
            set x = PolarX(GetUnitX(c), - 20, a)
            set y = PolarY(GetUnitY(c), - 20, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x)
                call SetUnitY(c, y)
            endif
        endif
        if count > 15 then
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 6, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 6, 0)
        endif
    endif
    if count == 30 then
        call SetUnitFlyHeight(c, 0, 0)
        loop
            exitwhen i > 18
            set x = PolarX(GetUnitX(c), 250, i * 20)
            set y = PolarY(GetUnitY(c), 250, i * 20)
            set a2 = Angle(x , y , GetUnitX(c) , GetUnitY(c))
            call Effect("war3mapImported\\nitu.mdl", x, y, 50, a2, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            set i = i + 1
        endloop
    endif
    if count == 40 then
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 14)
        call SetUnitTimeScale(c, 0.9)
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\OkitaAlter_2.mp3")
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 25, a + 180, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a, - 90, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 180, - 90, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 90, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 180, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 270, - 45, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 70 then 
        call SoundStart("war3mapImported\\Akame_7-1.mp3")
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_AkameD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FU' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AkameD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AkameD takes nothing returns nothing
    set gg_trg_AkameD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkameD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkameD, function Trig_AkameD_Actions)
endfunction