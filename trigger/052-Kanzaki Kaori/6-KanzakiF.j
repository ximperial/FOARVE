//TESH.scrollpos=168
//TESH.alwaysfold=0
function Trig_KanzakiF_Func001 takes nothing returns nothing
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
    local real pitch
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 3)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kanzaki_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
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
    if count >= 60 and count <= 80 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 15, 0)
    endif
    if count == 65 then
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 80 then
        set x = PolarX(GetUnitX(t), - 60, a)
        set y = PolarY(GetUnitY(t), - 60, a)
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, GetUnitFlyHeight(t) + 60, a, - 90, 0, 1, 0.4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        call SetUnitFlyHeight(t, 0, 1500)
    endif
    if count == 90 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitX(c, PolarX(GetUnitX(t), 300, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 300, a))
        call SetUnitAnimationByIndex(c, 15)
        call SetUnitTimeScale(c, 1.4)
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]Sand3.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 110 then
        call SoundStart("war3mapImported\\Kanzaki_6-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 60, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]Sand3.mdl", GetUnitX(t), GetUnitY(t), 25, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 0.75, 1, 204, 204, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.85, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
    endif
    if count >= 110 and count <= 130 then
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
    endif
    if count == 130 then
        call SetUnitTimeScale(c, 1)
        call SetUnitFlyHeight(c, 3000, 0)
    endif
    if count == 140 or count == 160 then
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
    endif
    if count >= 130 and count <= 170 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(50, 150), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(50, 150), randomAngle())
            set z1 = GetUnitFlyHeight(t) + GetRandomReal(- 150, 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set pitch = Slope(x, y, z1, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
            call Effect("war3mapImported\\Kanzaki.mdl", x, y, z1, a, pitch, 0, 1, 0.4, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4) 
            call Effect("war3mapImported\\[A]blue-qiliu-daoguang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(0.8, 1.75), 0.6, 204, 204, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 0.95))
            call Effect("war3mapImported\\[A]blue-qiliu-daoguang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), pitch, 0, GetRandomReal(1.3, 2.25), 0.6, 204, 204, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 0.85))
        endif
    endif
    if count == 180 then
        call SoundStart("war3mapImported\\Kanzaki_4.mp3")
        set x = PolarX(GetUnitX(t), 400, a)
        set y = PolarY(GetUnitY(t), 400, a)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set pitch = Slope(x, y, GetUnitFlyHeight(t) + 300, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
        call Effect("war3mapImported\\Kanzaki.mdl", x, y, GetUnitFlyHeight(t) + 300, a, pitch, 0, 1, 0.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 16)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call SaveReal(ht, GetHandleId(z), 0, pitch)
    endif
    if count >= 180 and count <= 210 then
        set x = PolarX(GetEffectX(e), 25, GetSpecialEffectYaw(e))
        set y = PolarY(GetEffectY(e), 25, GetSpecialEffectYaw(e))
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call SetSpecialEffectZ(e, z1 - 30)
    endif
    if count == 195 then
        set pitch = LoadReal(ht, GetHandleId(z), 0)
        call Effect("war3mapImported\\eros.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) - 30, GetSpecialEffectYaw(e), pitch, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Kanzaki_4-1.mp3")
        call SoundStart("war3mapImported\\Kanzaki_4-2.mp3")
    endif
    if count == 210 then
        call SetUnitX(c, GetEffectX(e))
        call SetUnitY(c, GetEffectY(e))
        call SetUnitFacing(c, GetSpecialEffectYaw(e))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 0.85, 1, 204, 204, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.95, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
    endif
    if count == 220 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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
    set e = null
endfunction

function Trig_KanzakiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KanzakiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KanzakiF takes nothing returns nothing
    set gg_trg_KanzakiF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KanzakiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KanzakiF, function Trig_KanzakiF_Actions )
endfunction