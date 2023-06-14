//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_RyuzakiW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ryuzaki_2.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 0.9)
        call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 5 or count == 15 then
        call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\punchshot.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 20 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 20 then
        call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    endif
    if count == 30 then 
        call SoundStart("war3mapImported\\Ryuzaki_2-1.mp3")
        call Effect("war3mapImported\\hit.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\djcjb.mdx", GetUnitX(c), GetUnitY(c), 120, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\zxd2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\[a]t_icesparks.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 35 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0G6')) * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_RyuzakiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0G6' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RyuzakiW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyuzakiW takes nothing returns nothing
    set gg_trg_RyuzakiW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyuzakiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyuzakiW, function Trig_RyuzakiW_Actions )
endfunction