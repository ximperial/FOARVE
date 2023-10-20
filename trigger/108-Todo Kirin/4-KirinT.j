//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KirinT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kirin_5.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapimported\\glowline(blue).mdx", GetUnitX(c), GetUnitY(c), 60, a + 75, - 75, - 75, 2.5, 3, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 3, 255, 255, 255, PercentTo255(80))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 140 then
        call SoundStart("war3mapImported\\Kirin_5-1.mp3")
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT1.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT1.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count == 160 or count == 200 or count == 240 or count == 280 then
        call SetUnitAnimationByIndex(c, 0)
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Kirin_5-2.mp3")
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
    endif
    if count == 220 then
        call SoundStart("war3mapImported\\Kirin_5-3.mp3")
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT3.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT3.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
    endif
    if count == 260 then
        call SoundStart("war3mapImported\\Kirin_5-4.mp3")
        call SoundStart("war3mapImported\\Kirin_1-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT4.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "war3mapImported\\kirinT4.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(50))
    endif
    if count >= 140 and count <= 160 or count >= 180 and count <= 200 or count >= 220 and count <= 240 or count >= 260 and count <= 280 then
        set x = PolarX(GetUnitX(t), 11, a)
        set y = PolarY(GetUnitY(t), 11, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\az_yishan2.mdx", GetUnitX(t), GetUnitY(t), 80, randomAngle(), GetRandomReal(- 60, - 20), 0, GetRandomReal(0.9, 1.15), 1, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapimported\\JeanlilyHXDG1.mdx", GetUnitX(t), GetUnitY(t), 120, randomAngle(), GetRandomReal(- 70, - 30), 0, GetRandomReal(1.3, 1.65), 1, PercentTo255(80), 255, 255, 255)
            call Effect("war3mapimported\\JeanlilyHXDG2.mdx", GetUnitX(t), GetUnitY(t), 120, randomAngle(), GetRandomReal(- 70, - 30), 0, GetRandomReal(1.3, 1.65), 1, PercentTo255(80), 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 30, randomAngle(), 0, 0, GetRandomReal(1.25, 1.95), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
    endif
    if count >= 280 and count <= 310 then
        set x = PolarX(GetUnitX(t), 18, a)
        set y = PolarY(GetUnitY(t), 18, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 280 then
        call SoundStart("war3mapImported\\Kirin_5-5.mp3")
    endif
    if count == 310 then
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 3.5, 3, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
    endif
    if count >= 300 and count <= 400 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.65, 1.85), 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1.1, 1.35), 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
    endif
    if count == 400 then
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.65)
    endif
    if count >= 400 and count <= 470 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 45, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 45, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 470 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        set x = PolarX(GetUnitX(c), - 50, a)
        set y = PolarY(GetUnitY(c), - 50, a)
        call Effect("war3mapimported\\VergilSlashes.mdx", x, y, 80, a, 0, 0, 8, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 4, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00009632.mdx", GetUnitX(t), GetUnitY(t), 170, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\DustWindFasterExact.mdx", GetUnitX(t), GetUnitY(t), 25, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 480 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
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

function Trig_KirinT_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    if not IsUnitInvulnerable(t) then 
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
    endif
    if count >= 50 or not IsUnitAlive(t) or GetUnitAbilityLevel(t, 'B00I') == 0 then 
        call StopSound(LoadSoundHandle(ht, GetHandleId(z), 1), true, false)
        call UnitRemoveAbility(t, 'A0HR')
        call UnitRemoveAbility(t, 'B00I')
        call FlushChildHashtable(ht, GetHandleId(z)) 
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set t = null
endfunction

function Trig_KirinT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HQ' then 
        set z = CreateTimer()
        if t != c then
            call PauseUnit(c, true)
            call SetUnitInvulnerable(c, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function Trig_KirinT_Func001)
        else
            call SoundStart("war3mapImported\\Kirin_5-6.mp3")
            call SaveSoundHandle(ht, GetHandleId(z), 1, dummySound)
            call UnitAddAbility(t, 'A0HR')
            call UnitMakeAbilityPermanent(t, true, 'A0HR')
            call SaveUnitHandle(ht, GetHandleId(z), 0, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.1, true, function Trig_KirinT_Func002)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KirinT takes nothing returns nothing
    set gg_trg_KirinT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KirinT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KirinT, function Trig_KirinT_Actions)
endfunction