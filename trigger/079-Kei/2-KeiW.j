//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KeiW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\kitam_2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 36)
        call Effect("war3mapImported\\amx (345).mdx", GetUnitX(c) , GetUnitY(c) , 100, a , 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 10 then
        call Effect("war3mapImported\\byakuranball.mdx", GetUnitX(t) , GetUnitY(t) , 50, a , 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 30 then
        loop
            exitwhen i > 6
            set x = PolarX(GetUnitX(t), 30, a - 120 + (i * 40))
            set y = PolarY(GetUnitY(t), 30, a - 120 + (i * 40))
            call Effect("war3mapImported\\ByakuranFireUlti2.mdx", x , y , 40, a, 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2 - i * 0.05) 
            set i = i + 1
        endloop
    endif
    if count == 50 then
        call Effect("war3mapImported\\warpdarkcaster.mdx", GetUnitX(t) , GetUnitY(t) , 25, a , 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
    endif
    if count == 70 then
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapImported\\QQQQQR.mdx", GetUnitX(t) , GetUnitY(t) , 25, a , 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 75 then
        call Effect("war3mapimported\\bymutou_huozhu_siwang.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
    endif
    if count == 80 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0H4')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_KeiW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0H4' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KeiW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KeiW takes nothing returns nothing
    set gg_trg_KeiW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KeiW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KeiW, function Trig_KeiW_Actions)
endfunction