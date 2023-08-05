//TESH.scrollpos=-1
//TESH.alwaysfold=0
function Trig_MinatoF_Func001 takes nothing returns nothing
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
    local effect e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Minato_5.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SetUnitAnimationByIndex(c, 5)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
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
        call SoundStart("war3mapImported\\Minato_2.mp3")
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Minato2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 120, a + 180, - 45, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count >= 25 and count <= 55 then
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y) 
        endif
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
    endif
    if count == 55 then
        call SoundStart("war3mapImported\\Minato_5-2.mp3") 
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SoundStart("war3mapImported\\Minato_6-3.mp3")
        call Effect("war3mapImported\\MinatoRSG.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(t) - 400, a, 0, 0, 7, 5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 65 and count <= 265 then
        set x = PolarX(GetUnitX(t), 3, a)
        set y = PolarY(GetUnitY(t), 3, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectZ(e, GetUnitFlyHeight(t) + GetAxisZ(GetEffectX(e), GetEffectY(e)) - 400)
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 3, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), randomAngle())
            if GetUnitFlyHeight(t) > 200 then
                set z1 = GetUnitFlyHeight(t) + GetRandomReal(- 200, 200)
            else
                set z1 = GetUnitFlyHeight(t) + GetRandomReal(0, 300)
            endif
            set pitch = Slope(x, y, z1, GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t))
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\Minato2.mdl", x, y, z1, a, pitch, 0, 1, 0.4, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, z1 + 60, a, 0, 0, GetRandomReal(0.7, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, 0, 0, GetRandomReal(1.2, 1.8), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\YellowSL.mdl", x, y, z1 + 40, a, pitch, 0, GetRandomReal(2.25, 2.75), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
        endif
    endif
    if count == 265 then
        call SoundStart("war3mapImported\\Minato_6-4.mp3")
        call SetUnitFlyHeight(t, 0, 0)
        call SetSpecialEffectAnimationByIndex(e, 2) 
        call Effect("war3mapImported\\Minato2.mdl", GetUnitX(t), GetUnitY(t), 600, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        set e2 = bj_lastCreatedEffect
    endif
    if count >= 265 and count <= 305 then
        call SetSpecialEffectZ(e2, GetEffectZ(e2) - 15)
    endif
    if count == 320 then
        call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 340 then
        call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.7, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 350 then 
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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
    set e2 = null
endfunction

function Trig_MinatoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A010' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_MinatoF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MinatoF takes nothing returns nothing
    set gg_trg_MinatoF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoF, function Trig_MinatoF_Actions )
endfunction