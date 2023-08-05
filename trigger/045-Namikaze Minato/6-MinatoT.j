//TESH.scrollpos=119
//TESH.alwaysfold=0
function Trig_MinatoT_Func001 takes nothing returns nothing
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
        call SetUnitAnimationByIndex(c, 6)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\kunaimark.mdl", c, "hand right")) 
    endif
    if count == 10 or count == 25 then
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1), 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
        call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.3), 1, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.9))
    endif
    if count >= 10 and count <= 40 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 25, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 25, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 2)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\kunaimark.mdl", t, "chest")) 
    endif
    if count >= 40 and count <= 55 then
        call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 40, 0)
    endif
    if count == 55 then
        call SoundStart("war3mapImported\\Minato_5-1.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 600, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 3, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", c, "hand right")) 
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\Minato_5-1.mp3")
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c) + 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Minato_5-1.mp3")
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 95 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count >= 95 and count <= 125 then
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 20, 0)
    endif
    if count == 115 then
        call SetUnitAnimationByIndex(c, 7)
    endif
    if count == 135 then
        call SoundStart("war3mapImported\\Minato_2.mp3")
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 80, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 150 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
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

function Trig_MinatoT_Func002 takes nothing returns nothing
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
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    if count <= 510 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Minato_5-2.mp3")
        call SoundStart("war3mapImported\\Minato_5-3.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Minato2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1, 10.4, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        call Effect("war3mapImported\\YellowSL.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.35, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 420 then
        set x = PolarX(GetUnitX(t), 5, a)
        set y = PolarY(GetUnitY(t), 5, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetSpecialEffectYaw(e, a)
        if count >= 90 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator == 5 or iterator == 10 then
                if iterator == 10 then
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call Effect("war3mapImported\\wind4.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.1), 1, 255, 255, 255, 255) 
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
                    call Effect("war3mapImported\\wavejojo.mdl", GetEffectX(e), GetEffectY(e), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.4), 1, 255, 255, 255, 255) 
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.9))
                endif
                set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), randomAngle())
                set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
                call Effect("war3mapImported\\Minato2.mdl", x, y, 0, a, 0, 0, 1, 0.4, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, 60, a, 0, 0, GetRandomReal(0.7, 1.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
                call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, GetRandomReal(1.4, 1.7), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
                set x = PolarX(GetUnitX(t), - 200, a)
                set y = PolarY(GetUnitY(t), - 200, a)
                call Effect("war3mapImported\\YellowSL.mdl", x, y, 40, a, 0, 0, GetRandomReal(2.25, 2.75), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
            endif
        endif
    endif
    if count == 250 then
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(e, 8)
    endif
    if count == 275 then
        call SetSpecialEffectAnimationByIndex(e, 10)
    endif
    if count == 420 then
        call SetSpecialEffectAnimationByIndex(e, 10)
    endif
    if count == 460 then
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call SetUnitX(t, PolarX(GetEffectX(e), 120, a))
        call SetUnitY(t, PolarY(GetEffectY(e), 120, a))
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 470 then
        call SetSpecialEffectAnimationByIndex(e, 15)
    endif
    if count == 510 then 
        call SoundStart("war3mapImported\\Minato_5-4.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (15 + 0.2 * GetUnitAbilityLevel(c, 'A00Y')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 800, a, 0.8)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 0.8, 2.8, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count >= 510 and count <= 550 then
        call SetEffectX(e, GetUnitX(t))
        call SetEffectY(e, GetUnitY(t))
        call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 550 then
        call SoundStart("war3mapImported\\Minato_5-5.mp3")
        call SetSpecialEffectAnimationByIndex(e, 1)
        call SetSpecialEffectTimeScale(e, 0.8)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MinatoT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00W' then 
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
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function Trig_MinatoT_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_MinatoT_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MinatoT takes nothing returns nothing
    set gg_trg_MinatoT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoT, function Trig_MinatoT_Actions )
endfunction