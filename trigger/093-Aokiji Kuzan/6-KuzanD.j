//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KuzanD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kuzan_2.mp3")
        call SoundStart("war3mapImported\\Kuzan_7.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 3)
    endif
    if count <= 30 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\bkks.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
        endif
    endif
    if count == 30 then
        call Effect("war3mapimported\\sbss_bingdongxili.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.25, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapimported\\sxbbtx1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count == 40 then 
        call Effect("war3mapimported\\icefirst.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroInt(c, true))
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

function Trig_KuzanD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0C0' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KuzanD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KuzanD takes nothing returns nothing
    set gg_trg_KuzanD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KuzanD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KuzanD, function Trig_KuzanD_Actions)
endfunction