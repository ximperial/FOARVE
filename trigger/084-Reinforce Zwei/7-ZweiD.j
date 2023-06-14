//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ZweiD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Reinforce_7.mp3")
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapimported\\Evolt-1_new.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 7.5, 255, 255, 255, 255)
    endif
    if count <= 360 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\baise-magic-shousuo_purple_new.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
        endif
    endif
    if count == 350 then
        call SoundStart("war3mapImported\\Reinforce_7-1.mp3")
    endif
    if count == 370 then
        call Effect("war3mapimported\\bymutou-hongse3-purple.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\windcaotic3.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count >= 370 and count <= 420 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 9
                set x = PolarX(GetUnitX(t), (count - 370) * 15, i * 36)
                set y = PolarY(GetUnitY(t), (count - 370) * 15, i * 36)
                call Effect("war3mapimported\\[DoFT]PurpleAz-hit.mdx", x, y, 50, i * 36, - 90, 0, 4, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapimported\\FadeSpearPurple.mdx", x, y, 50, i * 36, 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapimported\\[DoFT]az-zise-toushewu.mdx", x, y, 50, i * 36, 0, 0, 9, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                set i = i + 1
            endloop
        endif
    endif
    if count == 430 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
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

function Trig_ZweiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A09L' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ZweiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ZweiD takes nothing returns nothing
    set gg_trg_ZweiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ZweiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ZweiD, function Trig_ZweiD_Actions)
endfunction