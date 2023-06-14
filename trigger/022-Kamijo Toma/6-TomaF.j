//TESH.scrollpos=96
//TESH.alwaysfold=0
function Trig_TomaF_Func001 takes nothing returns nothing
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
    local real dist2
    local integer i = 0
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Toma_6.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 10 or count == 90 then
        call Effect("war3mapImported\\pltx.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\djcjb.mdx", GetUnitX(c), GetUnitY(c), 150, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 250, a, - 90, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx", GetUnitX(t), GetUnitY(t), 250, a, 0, 0, 0.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapImported\\zxd1.mdx", GetUnitX(t), GetUnitY(t), 250, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 150, a, -90, 0, 1.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count >= 10 and count <= 50 or count >= 90 and count <= 130 then 
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 80, a, - 90, 0, GetRandomReal(0.5, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
    endif
    if count == 60 or count == 140 then
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
    endif
    if count >= 60 and count <= 90 or count >= 140 and count <= 170 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif 
    endif
    if count == 80 then 
        call SetUnitAnimationByIndex(c, 10) 
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
    endif
    if count == 160 then 
        call SetUnitAnimationByIndex(c, 14)
    endif
    if count == 170 then 
        call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(t), GetUnitY(t), 80, a, - 45, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 120, a, - 45, 0, 3.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 90, a, - 45, 0, 1.8, 1, 255, 255, 255, 255) 
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
    endif
    if count >= 170 and count <= 200 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif 
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count == 200 then
        call SoundStart("war3mapImported\\Toma_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\touma2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect 
        call SaveReal(ht, GetHandleId(z), 0, dist)
    endif
    if count >= 200 and count <= 220 then
        set dist = LoadReal(ht, GetHandleId(z), 0)
        set dist2 = Distance(GetUnitX(c), GetUnitY(c), GetEffectX(e), GetEffectY(e))
        set z1 = GetParabolaZEx(dist2, dist, 400, 0, 650) 
        set x = PolarX(GetEffectX(e), dist / 20, a)
        set y = PolarY(GetEffectY(e), dist / 20, a)
        set pitch = Slope(GetEffectX(e), GetEffectY(e), GetEffectZ(e), x, y, z1)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, z1 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        call SetSpecialEffectPitch(e, pitch+90)
    endif
    if count == 240 then 
        call SoundStart("war3mapImported\\Toma_2-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
    endif
    if count == 250 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroStr(c, true))
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

function Trig_TomaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0B0' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TomaF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TomaF takes nothing returns nothing
    set gg_trg_TomaF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TomaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TomaF, function Trig_TomaF_Actions )
endfunction