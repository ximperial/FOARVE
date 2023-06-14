//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AkameT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real a2
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Akame_5.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\akameT.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\akameT.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\Akame.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 0.9, 3.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapimported\\Akame.mdx", GetUnitX(t), GetUnitY(t), 0, a + 180, 0, 0, 0.9, 3.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveReal(ht, GetHandleId(z), 1, a + 180)
    endif
    if count <= 140 then
        call SaveReal(ht, GetHandleId(z), 0, LoadReal(ht, GetHandleId(z), 0) + 4 )
        call SaveReal(ht, GetHandleId(z), 1, LoadReal(ht, GetHandleId(z), 1) + 4 )
        set a2 = LoadReal(ht, GetHandleId(z), 0)
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetUnitX(t), count * 5, a2)
        set y = PolarY(GetUnitY(t), count * 5, a2)
        call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        call SetSpecialEffectYaw(e, a2 + 90)
        set a2 = LoadReal(ht, GetHandleId(z), 1)
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set x = PolarX(GetUnitX(t), count * 5, a2)
        set y = PolarY(GetUnitY(t), count * 5, a2)
        call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
        call SetSpecialEffectYaw(e, a2 + 90)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 1
                set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
                call Effect("war3mapimported\\BlackBlink.mdx", GetEffectX(e), GetEffectY(e), 25, GetSpecialEffectYaw(e), 0, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
    endif
    if count == 140 then
        call SoundStart("war3mapImported\\Akame_5-1.mp3")
        set i = 0
        loop
            exitwhen i > 1
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set a2 = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
            call SetSpecialEffectAnimationByIndex(e, 3)
            call SetSpecialEffectYaw(e, a2)
            set i = i + 1
        endloop
    endif
    if count == 155 then
        loop
            exitwhen i > 1
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set a2 = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
            call Effect("war3mapimported\\a_new_k3.mdx", GetEffectX(e), GetEffectY(e) , 25, a2 , 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 140, a2)
            set y = PolarY(GetUnitY(t), 140, a2)
            call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a2 + 180)
            call SetSpecialEffectAnimationByIndex(e, 11)
            set i = i + 1
        endloop
    endif
    if count == 175 then
        call SoundStart("war3mapImported\\Rogue_2-1.mp3")
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 185 then 
        if GetRandomInt(1, 2) == 1 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        else
            set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        endif
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, GetEffectX(e))
        call SetUnitY(c, GetEffectY(e))
        call SetUnitFacingEx(c, GetSpecialEffectYaw(e), true)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_AkameT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0FS' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AkameT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AkameT takes nothing returns nothing
    set gg_trg_AkameT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AkameT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AkameT, function Trig_AkameT_Actions)
endfunction