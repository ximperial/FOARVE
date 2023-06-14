//TESH.scrollpos=81
//TESH.alwaysfold=0
function Trig_HibariT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real z1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Hibari_5.mp3")
        call SetUnitAnimationByIndex(c, 4)
        call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 25 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 25 then
        call SetUnitAnimationByIndex(c, 2)
        call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 25, a + 180, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Needle.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 2.5, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 25 and count <= 50 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.25)
        call SetSpecialEffectZ(e, z1 + 5)
    endif
    if count >= 50 and count <= 80 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, GetRandomReal(1.5, 3), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 80 then
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        loop
            exitwhen i > 4
            call Effect("war3mapImported\\Needle.mdx", GetUnitX(t), GetUnitY(t), 100, i * 72, 0, 0, 4, 1.4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 3 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
    endif
    if count >= 80 and count <= 110 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set i = 0
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, GetHandleId(z), 3 + i)
                call SetEffectX(e, PolarX(GetEffectX(e), 70, GetSpecialEffectYaw(e)))
                call SetEffectY(e, PolarY(GetEffectY(e), 70, GetSpecialEffectYaw(e)))
                call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
                call SetSpecialEffectYaw(e, GetSpecialEffectYaw(e) + 14.4)
                set i = i + 1
            endloop
        endif
    endif
    if count >= 110 and count <= 130 then
        set i = 0
        loop
            exitwhen i > 4
            set e = LoadEffectHandle(ht, GetHandleId(z), 3 + i)
            set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
            call SetEffectX(e, PolarX(GetEffectX(e), 40, a))
            call SetEffectY(e, PolarY(GetEffectY(e), 40, a))
            if count > 120 then
                call SetSpecialEffectZ(e, z1 - 30)
            else
                call SetSpecialEffectZ(e, z1 + 30)
            endif
            set i = i + 1
        endloop
    endif
    if count == 130 then
        call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, .8, 1.5, 255, 255, 255, 255)
    endif
    if count == 140 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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
    set e = null
endfunction

function Trig_HibariT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A04J' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_HibariT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_HibariT takes nothing returns nothing
    set gg_trg_HibariT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HibariT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_HibariT, function Trig_HibariT_Actions )
endfunction