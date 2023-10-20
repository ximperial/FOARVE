//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeD_Func001 takes nothing returns nothing
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
    if count <= 1020 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Monke_7.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 0.15)
    endif
    if count == 120 then
        call SoundStart("war3mapImported\\Monke_7-1.mp3")
        call SetUnitTimeScale(c, 0.01)
    endif
    if count <= 400 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.5, 0.7) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 30)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            if count <= 120 then 
                call Effect("war3mapimported\\kaizokusfxbyvalk4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.75, 1.5) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            else
                call Effect("war3mapimported\\kaizokusfxbyvalk4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(1.4, 2) , 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.3, 0.5))
            endif
        endif
    endif
    if count == 400 then
        call SoundStart("war3mapImported\\Monke_7-2.mp3")
        call SetUnitTimeScale(c, 0.01) 
    endif
    if count >= 400 and count <= 1000 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 30, a))
        else
            set count = 1000
            call SaveInteger(ht, GetHandleId(z) , 0, count)
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetUnitX(c) , - 50, a)
            set y = PolarY(GetUnitY(c) , - 50, a)
            call Effect("war3mapimported\\dustwaveanimate2X.mdx", x, y, 100, a, - 90, 0, 1.35, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(0.5, 0.75) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c) , GetUnitY(c) , 100, a, 0, 0, GetRandomReal(0.75, 1.25) , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.3, 0.5))
        endif
    endif
    if count == 1000 then
        call SetUnitTimeScale(c, 1) 
    endif
    if count == 1010 then
        call SoundStart("war3mapImported\\Monke_7-3.mp3") 
        set x = PolarX(GetUnitX(t) , 120, a)
        set y = PolarY(GetUnitY(t) , 120, a)
        call Effect("war3mapimported\\fire-boom-new.mdx", x, y, 150, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\[A]fire-zhendi-guangzhu.mdx", x, y, 150, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t) , GetUnitY(t) , 100, a + 180, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        set x = PolarX(GetUnitX(t) , 50, a)
        set y = PolarY(GetUnitY(t) , 50, a)
        call Effect("war3mapimported\\FireEffectOrange.mdx", x, y, 150, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        set x = PolarX(GetUnitX(t) , 120, a)
        set y = PolarY(GetUnitY(t) , 120, a)
        call Effect("war3mapimported\\[A]BY_Wood_Kong.mdx", x, y, 150, a, 0, 0, 1.35, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        set x = PolarX(GetUnitX(t) , 120, a)
        set y = PolarY(GetUnitY(t) , 120, a)
        call Effect("war3mapimported\\[A]FireEruption2.mdx", x, y, 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 1020 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
        call knockbackUnit(t, 700, a, 0.8)
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call SaveReal(ht, GetHandleId(z) , 0, a)
    endif
    if count >= 1020 and count <= 1060 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set a = LoadReal(ht, GetHandleId(z) , 0)
            set x = PolarX(GetUnitX(t) , 50, a)
            set y = PolarY(GetUnitY(t) , 50, a)
            call Effect("war3mapimported\\fire-boom-new.mdx", x, y, 150, a, - 90, 0, 1.35, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t) , 50, a)
            set y = PolarY(GetUnitY(t) , 50, a)
            call Effect("war3mapimported\\FireEffectOrange.mdx", x, y, 150, a, - 90, 0, 0.7, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
    endif
    if count == 1060 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_MonkeD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A08Y' then 
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
        call TimerStart(z, 0.02, true, function Trig_MonkeD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MonkeD takes nothing returns nothing
    set gg_trg_MonkeD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MonkeD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MonkeD, function Trig_MonkeD_Actions)
endfunction