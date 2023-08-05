//TESH.scrollpos=75
//TESH.alwaysfold=0
function Trig_TsunaT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Tsuna_2.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 17)
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count >= 20 and count <= 50 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count >= 50 and count <= 70 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 70 then
        call SoundStart("war3mapImported\\Tsuna_1.mp3")
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count >= 70 and count <= 85 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 85 then
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacing(c, a + 180)
    endif
    if count == 95 then
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 45, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count >= 95 and count <= 115 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count == 115 then
        call SoundStart("war3mapImported\\Tsuna_1.mp3")
        call SetUnitAnimationByIndex(c, 12)
    endif
    if count >= 115 and count <= 130 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 20, 0)
    endif
    if count == 130 then
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 140 then
        call SoundStart("war3mapImported\\Tsuna_5.mp3")
        set x = PolarX(GetUnitX(t), 200, a)
        set y = PolarY(GetUnitY(t), 200, a)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, x)
        call SetUnitY(c, y)
        call Effect("war3mapImported\\BlackBlink.mdx", x, y, 600, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Sawada.mdx", x, y, 400, a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 18)
        set x = PolarX(GetUnitX(c), - 10, a)
        set y = PolarY(GetUnitY(c), - 10, a)
        call Effect("war3mapImported\\dzxb1.mdx", x, y, 700, a + 180, - 315, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call AnimEffect(bj_lastCreatedEffect, 1, 0.4)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Tsuna_5-1.mp3")
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        call Effect("war3mapImported\\dzxb2.mdx", x, y, 650, a, - 45, 0, 2, 0.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call AnimEffect(bj_lastCreatedEffect, 1, 0.2)
    endif
    if count >= 150 and count <= 180 then
        if count <= 170 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(t, x)
                call SetUnitY(t, y)
            endif
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set i = 1
            loop
                exitwhen i > 4
                set x = PolarX(GetUnitX(c), 100 * i, a + 180)
                set y = PolarY(GetUnitY(c), 100 * i, a + 180)
                call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx", x, y, 700 + i * 100, a + 180, - 45, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(c), 100 * i, a)
                set y = PolarY(GetUnitY(c), 100 * i, a)
                call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx", x, y, 650 - i * 100, a, - 315, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
    endif
    if count == 170 then
        call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Holy_Fire_Slam2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 180 then
        call SetUnitFlyHeight(c, 600, 0)
        call SetUnitFlyHeight(c, 0, 1500)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_TsunaT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A039' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TsunaT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TsunaT takes nothing returns nothing
    set gg_trg_TsunaT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TsunaT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TsunaT, function Trig_TsunaT_Actions )
endfunction