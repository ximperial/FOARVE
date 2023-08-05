//TESH.scrollpos=117
//TESH.alwaysfold=0
function Trig_MinatoR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Minato_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", c, "hand right")) 
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 6)
    endif
    if count == 15 or count == 25 or count == 35 or count == 50 then
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1), 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.3), 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.9))
    endif
    if count >= 15 and count <= 50 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 30, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 30, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Minato_2.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 120, a + 180, - 45, 0, 1.2, 1, 255, 255, 255, 255)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(t), GetUnitY(t), 0, a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 50 and count <= 80 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, z1 + 20)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Minato_5-1.mp3")
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetEffectX(e))
        call SetUnitY(c, GetEffectY(e))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t) - 50, 0)
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Minato_4.mp3")
        call Effect("war3mapImported\\Almagest.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(c) + 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", c, "hand right")) 
    endif
    if count >= 100 and count <= 140 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        set z1 = GetEffectZ(e) + GetAxisZ(GetEffectX(e) + 0.01, GetEffectY(e)) - GetAxisZ(GetEffectX(e) - 0.01, GetEffectY(e))
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, z1 - 20)
    endif
    if count == 140 then
        call SoundStart("war3mapImported\\Minato_5-1.mp3")
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitFlyHeight(t, 0, 0)
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Minato_2.mp3")
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A00Z')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MinatoR_Func002 takes nothing returns nothing
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
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Minato_6-2.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 13)
    endif
    if count == 10 or count == 95 then
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 200, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 200, a))
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
    endif
    if count == 20 or count == 35 or count == 50 or count == 65 or count == 80 then 
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 200, randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), 200, randomAngle()))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacing(c, a)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.7, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
    endif
    if count >= 100 and count <= 130 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count == 130 then
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 30, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 30, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(t) - 50, 0)
        call SetUnitAnimationByIndex(c, 19)
        call SetUnitFacing(c, a + 180)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count >= 140 and count <= 160 then
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
    endif
    if count == 160 then
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 170 then 
        call SetUnitFlyHeight(c, 0, 1375)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.2 * GetUnitAbilityLevel(c, 'A00Y')
        call DamageUnit(c, t, (dmg + 6 + 2 * GetUnitAbilityLevel(c, 'A00Z')) * GetHeroAgi(c, true))
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

function Trig_MinatoR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00Z' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if GetUnitTypeId(c) == 'H01M' then
            call TimerStart(z, 0.02, true, function Trig_MinatoR_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_MinatoR_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MinatoR takes nothing returns nothing
    set gg_trg_MinatoR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoR, function Trig_MinatoR_Actions )
endfunction