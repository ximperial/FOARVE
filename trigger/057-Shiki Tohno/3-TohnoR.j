//TESH.scrollpos=147
//TESH.alwaysfold=0
function Trig_TohnoR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Tohno_4.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, 6)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 10 or count == 40 or count == 80 or count == 120 or count == 160 then 
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.65, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 20 or count == 30 or count == 40 or count == 50 or count == 60 then
        call SoundStart("war3mapImported\\Tohno_4-1.mp3")
    endif
    if count >= 10 and count <= 70 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 20, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 340, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 320, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
        endif
    endif
    if count == 80 or count == 100 or count == 120 then 
        call SetUnitAnimationByIndex(c, 0)
        call SoundStart("war3mapImported\\Tohno_4-4.mp3")
    endif
    if count == 130 then
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count == 140 or count == 140 or count == 150 or count == 160 or count == 170 or count == 180 then
        call SoundStart("war3mapImported\\Tohno_4-2.mp3")
    endif
    if count == 145 or count == 155 or count == 165 or count == 175 or count == 185 then
        call SoundStart("war3mapImported\\Tohno_4-3.mp3") 
    endif
    if count >= 130 and count <= 190 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 20, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            elseif GetRandomInt(1, 2) == 1 then 
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 340, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            else
                call Effect("war3mapimported\\qzzz.mdx", GetUnitX(c), GetUnitY(c), 120, a + GetRandomReal(- 45, 45), - 320, 0, GetRandomReal(1.4, 2.1), 1, 0, 0, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
        endif
    endif
    if count == 190 then
        call SoundStart("war3mapImported\\Tohno_4-7.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 1000, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 1000, a))
        call SetUnitAnimationByIndex(c, 21) 
        call SetUnitTimeScale(c, 2)
    endif
    if count >= 190 and count <= 220 then
        call SetUnitX(c, PolarX(GetUnitX(c), 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 20, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), - 30, a)
            set y = PolarY(GetUnitY(c), - 30, a)
            call Effect("war3mapimported\\Tohno.mdx", x, y, GetUnitFlyHeight(c), a, 0, 0, 1, 0.6, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        endif
    endif
    if count == 220 then
        call SoundStart("war3mapImported\\Tohno_4-5.mp3")
        call SoundStart("war3mapImported\\Tohno_4-6.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitAnimationByIndex(c, 22) 
        loop
            exitwhen i > 13
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapimported\\FCJX_DG.mdx", x, y, 300, randomAngle(), GetRandomReal(- 120, - 140), 0, 3, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call Effect("war3mapimported\\yishan2Red.mdx", GetUnitX(t), GetUnitY(t), 25, a + 40, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\yishan2Red.mdx", GetUnitX(t), GetUnitY(t), 25, a - 40, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 230 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0AQ')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_TohnoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AQ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TohnoR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TohnoR takes nothing returns nothing
    set gg_trg_TohnoR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohnoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TohnoR, function Trig_TohnoR_Actions )
endfunction