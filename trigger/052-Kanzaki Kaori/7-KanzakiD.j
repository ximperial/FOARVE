//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KanzakiD_Func001 takes nothing returns nothing
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
    local real pitch
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kanzaki_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
    endif
    if count == 1 or count == 15 or count == 30 or count == 45 or count == 60 then
        call SoundStart("war3mapImported\\KanzakiSE1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimation(c, "attack")
        if count == 60 then 
            call Effect("war3mapImported\\animeslashfinal.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, - 90, 1.5, 1, 204, 204, 255, 255)
        else
            call Effect("war3mapImported\\animeslashfinal.mdl", GetUnitX(t), GetUnitY(t), 60, a, 0, 0, GetRandomReal(1.2, 1.6), 1, 204, 204, 255, 255)
        endif
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(0.65, 1), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
    endif
    if count <= 60 then
        set x = PolarX(GetUnitX(t), 5, a)
        set y = PolarY(GetUnitY(t), 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count >= 60 and count <= 110 then
        set x = PolarX(GetUnitX(t), 14, a)
        set y = PolarY(GetUnitY(t), 14, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 14, 0)
    endif
    if count == 60 then
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 75 or count == 100 then
        set x = PolarX(GetUnitX(t), - 30, a)
        set y = PolarY(GetUnitY(t), - 30, a)
        set pitch = Slope(x, y, GetUnitFlyHeight(t) - 30, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, GetUnitFlyHeight(t) - 30, a, pitch, 0, 1, 0.6, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        call Effect("war3mapImported\\[A]Sand3.mdl", x, y, GetUnitFlyHeight(t) + 30, a, pitch, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, pitch, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 110 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t), 0)
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 180, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 120 then
        call Effect("war3mapImported\\eros.mdl", GetUnitX(t), GetUnitY(t), 600, a, - 270, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        call SetUnitFlyHeight(c, 0, 3500)
        call SetUnitFlyHeight(t, 0, 3500)
    endif
    if count == 130 then
        call SoundStart("war3mapImported\\Kanzaki_3-1.mp3")
        call SetUnitFlyHeight(c, 3000, 0) 
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\BerkaBlue.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 8, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 150 then
        set x = PolarX(GetUnitX(t), 400, a + 60)
        set y = PolarY(GetUnitY(t), 400, a + 60)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count >= 150 and count <= 160 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetEffectX(e, PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 155 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SetSpecialEffectAnimationByIndex(e, 6) 
        set x = PolarX(GetUnitX(t), 400, a + 120)
        set y = PolarY(GetUnitY(t), 400, a + 120)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
    endif
    if count >= 155 and count <= 165 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetEffectX(e, PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 160 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
        call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 1.3, 1, 255, 255, 255, 255)
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SetSpecialEffectAnimationByIndex(e, 6) 
        set x = PolarX(GetUnitX(t), 400, a + 180)
        set y = PolarY(GetUnitY(t), 400, a + 180)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
    endif
    if count >= 160 and count <= 170 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetEffectX(e, PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 165 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
        call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 1.3, 1, 255, 255, 255, 255)
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SetSpecialEffectAnimationByIndex(e, 6) 
        set x = PolarX(GetUnitX(t), 400, a + 240)
        set y = PolarY(GetUnitY(t), 400, a + 240)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
    endif
    if count >= 165 and count <= 175 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        call SetEffectX(e, PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 170 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
        call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 1.3, 1, 255, 255, 255, 255)
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        call SetSpecialEffectAnimationByIndex(e, 6) 
        set x = PolarX(GetUnitX(t), 400, a + 300)
        set y = PolarY(GetUnitY(t), 400, a + 300)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
    endif
    if count >= 170 and count <= 180 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 6)
        call SetEffectX(e, PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e)))
        call SetEffectY(e, PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e)))
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 175 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
        call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 1.3, 1, 255, 255, 255, 255)
    endif
    if count == 180 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 6)
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
        call Effect("war3mapImported\\slashdigital.mdl", GetUnitX(t), GetUnitY(t), 25, GetSpecialEffectYaw(e), 0, 0, 1.3, 1, 255, 255, 255, 255)
    endif
    if count == 190 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitAnimationByIndex(c, 16)
        call SetUnitTimeScale(c, 0.8)
    endif
    if count >= 190 and count <= 240 then
        set x = PolarX(GetUnitX(c), - 10, a)
        set y = PolarY(GetUnitY(c), - 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        if count < 215 then 
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
        else
            call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 10, 0) 
        endif
    endif
    if count == 240 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
    endif
    if count >= 260 and count <= 280 then
        set x = PolarX(GetUnitX(c), 40, GetUnitFacing(c))
        set y = PolarY(GetUnitY(c), 40, GetUnitFacing(c))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
    endif
    if count == 265 then
        set x = PolarX(GetUnitX(t), - 250, a)
        set y = PolarY(GetUnitY(t), - 250, a)
        call Effect("war3mapImported\\eros.mdl", x, y, 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 290 then 
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
    set e = null
endfunction

function Trig_KanzakiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06E' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KanzakiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KanzakiD takes nothing returns nothing
    set gg_trg_KanzakiD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KanzakiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KanzakiD, function Trig_KanzakiD_Actions )
endfunction