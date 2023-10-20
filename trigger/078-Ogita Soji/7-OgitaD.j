//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ogita_7.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , - 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 140, a))
        call SetUnitAnimationByIndex(c, 0)
        call Effect("war3mapImported\\shanguangbiubiu.mdl", GetUnitX(c), GetUnitY(c), 200, a, 0, 0, 2, 2, 255, 255, 255, 255)
    endif
    if count == 10 or count == 30 or count == 50 or count == 70 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 2, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 0.8)
    endif
    if count == 65 then
        call Effect("war3mapimported\\model (24).mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\model (24).mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\model (24).mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Ogita_7-1.mp3")
        call Effect("war3mapImported\\0227.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call Effect("war3mapImported\\3shadowassault(lightzi)waveblue.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
        call Effect("war3mapImported\\[a]az-ice-zhendi.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]ChuShou_Blue1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 0.85, 1.5, 255, 255, 255, PercentTo255(80))
    endif
    if count == 100 then 
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

function Trig_OgitaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GJ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OgitaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OgitaD takes nothing returns nothing
    set gg_trg_OgitaD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaD, function Trig_OgitaD_Actions)
endfunction