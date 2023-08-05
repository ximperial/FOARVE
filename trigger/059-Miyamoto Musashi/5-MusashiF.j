//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_MusashiF_Func001 takes nothing returns nothing
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
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Musashi_6-3.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 5.4, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4) 
    endif
    if count == 10 then
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        set x = PolarX(GetUnitX(t), - 400, a)
        set y = PolarY(GetUnitY(t), - 400, a)
        call Effect("war3mapimported\\Musashi2.mdx", x , y , 0, a, 0, 0, 1, 5.4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 17)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 110 and count <= 120 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetEffectX(e), 90, a)
        set y = PolarY(GetEffectY(e), 90, a)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, GetAxisZ(x, y))
        call Effect("war3mapimported\\Musashi.mdx", GetEffectX(e) , GetEffectY(e) , 0, a, 0, 0, 1, 0.8 - (count - 110) * 0.02, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "attack")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 115 then
        loop
            exitwhen i > 11
            set x = PolarX(GetUnitX(t), GetRandomReal(- 120, - 180), a)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 120, - 180), a)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 20, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 340, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\File00005641.mdx", x, y, 120, a + GetRandomReal(- 45, 45), - 320, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\FCJX_DG.mdx", x, y, GetRandomReal(200, 600), randomAngle(), GetRandomReal(- 120, - 140), 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            set i = i + 1
        endloop
    endif
    if count == 120 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 13)
        call SetSpecialEffectTimeScale(e, 0.1)
    endif
    if count == 260 then
        call SoundStart("war3mapImported\\Musashi_5-1.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set i = 1
        loop
            exitwhen i > 10
            set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t) , GetUnitY(t))
            set x = PolarX(GetEffectX(e), 150 * i, a)
            set y = PolarY(GetEffectY(e), 150 * i, a)
            call Effect("war3mapimported\\zxd5.mdx", x, y, 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set i = i + 1
        endloop
    endif
    if count == 270 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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
    set e = null
endfunction

function Trig_MusashiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A064' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MusashiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MusashiF takes nothing returns nothing
    set gg_trg_MusashiF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MusashiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MusashiF, function Trig_MusashiF_Actions)
endfunction