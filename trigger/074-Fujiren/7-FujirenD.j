//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_FujirenD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Fujiren_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2.6, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Fujiren_7-1.mp3")
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 120, a + 30)
        set y = PolarY(GetUnitY(t), 120, a + 30)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\renfujireal.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Fujiren_7-1.mp3")
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 120, a + 120)
        set y = PolarY(GetUnitY(t), 120, a + 120)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\renfujireal.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Fujiren_7-1.mp3")
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 120, a + 210)
        set y = PolarY(GetUnitY(t), 120, a + 210)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\renfujireal.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Fujiren_7-1.mp3")
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 120, a + 300)
        set y = PolarY(GetUnitY(t), 120, a + 300)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\renfujireal.mdx", x, y, 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 4)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 75 then
        call Effect("war3mapImported\\Momo_devilslamita.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 80 then 
        if GetRandomInt(1, 2) == 1 then
            call SetUnitX(c, PolarX(GetUnitX(t), 120, a + 30))
            call SetUnitY(c, PolarY(GetUnitY(t), 120, a + 30))
        else
            if GetRandomInt(1, 2) == 1 then
                call SetUnitX(c, PolarX(GetUnitX(t), 120, a + 120))
                call SetUnitY(c, PolarY(GetUnitY(t), 120, a + 120))
            else
                if GetRandomInt(1, 2) == 1 then
                    call SetUnitX(c, PolarX(GetUnitX(t), 120, a + 210))
                    call SetUnitY(c, PolarY(GetUnitY(t), 120, a + 210))
                else
                    call SetUnitX(c, PolarX(GetUnitX(t), 120, a + 300))
                    call SetUnitY(c, PolarY(GetUnitY(t), 120, a + 300))
                endif
            endif
        endif
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_FujirenD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0G1' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_FujirenD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_FujirenD takes nothing returns nothing
    set gg_trg_FujirenD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FujirenD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_FujirenD, function Trig_FujirenD_Actions )
endfunction