//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TomaD_Func001 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Toma_7-1.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        set x = PolarX(GetUnitX(t), - 1000, a)
        set y = PolarY(GetUnitY(t), - 1000, a)
        call Effect("war3mapImported\\touma2.mdx", x, y, 0, a, 0, 0, 1, 4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 150 then 
        set x = PolarX(GetEffectX(e), 5, a)
        set y = PolarY(GetEffectY(e), 5, a)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\Chongfengnew.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 140 then 
        call SetSpecialEffectAnimationByIndex(e, 10)
    endif
    if count == 150 then 
        set x = PolarX(GetUnitX(t), 120, a)
        set y = PolarY(GetUnitY(t), 120, a)
        call SetEffectXY(e, x, y, 0)
    endif
    if count == 160 then 
        call Effect("war3mapImported\\Lulu_shadsd.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.8, 1, 255, 0, 0, 255)
        loop
            exitwhen i > 3
            call Effect("war3mapImported\\Lulu_kaizokusfxbyvalk888.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            set i = i + 1
        endloop
        call Effect("war3mapImported\\Lulu_by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\Light_chushou_by_wood_effect_huozhu_black.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 170 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
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
    set e = null
endfunction

function Trig_TomaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0B1' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TomaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TomaD takes nothing returns nothing
    set gg_trg_TomaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TomaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TomaD, function Trig_TomaD_Actions )
endfunction