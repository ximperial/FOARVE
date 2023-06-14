//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_DioD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Dio_7.mp3")
        call SetUnitAnimationByIndex(c, 2)
        set x = PolarX(GetUnitX(c), 50, a)
        set y = PolarY(GetUnitY(c), 50, a)
        call Effect("war3mapimported\\dash sfx.mdx", x, y, 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(40))
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\wind3.mdx", x, y, 75, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        call Effect("war3mapimported\\wind4.mdx", x, y, 75, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count <= 30 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 30 then
        call SetUnitTimeScale(c, 0.01)
        call Effect("war3mapimported\\File00000187.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 40, a)
        set y = PolarY(GetUnitY(t), 40, a)
        call Effect("war3mapimported\\az-blue-lizi-shangsheng.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        set x = PolarX(GetUnitX(t), 40, a)
        set y = PolarY(GetUnitY(t), 40, a)
        call Effect("war3mapimported\\File00003575.mdx", x, y, 25, a, 0, 0, 0.9, 6, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
        call AnimEffect(bj_lastCreatedEffect, 1, 5.4)
    endif
    if count == 80 or count == 130 or count == 180 or count == 230 or count == 280 then
        call Effect("war3mapimported\\File00000187.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.68)
        call Effect("war3mapimported\\az-blue-lizi-shangsheng.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
    endif
    if count == 260 then
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 0.3)
    endif
    if count == 280 then
        call SoundStart("war3mapImported\\Dio_7-1.mp3")
    endif
    if count == 300 then
        call Effect("war3mapimported\\File00000187.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.45, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        call Effect("war3mapimported\\qqqqqr.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.45, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count == 310 then 
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

function Trig_DioD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FE' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_DioD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DioD takes nothing returns nothing
    set gg_trg_DioD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DioD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_DioD, function Trig_DioD_Actions)
endfunction