//TESH.scrollpos=104
//TESH.alwaysfold=0
function Trig_MinatoW_Func001 takes nothing returns nothing
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
        call SetUnitAnimationByIndex(c, 5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", c, "hand right")) 
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count >= 10 and count <= 30 then 
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Minato_2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a)) 
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call Effect("war3mapImported\\wind4.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 35 then
        call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A03K')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_MinatoW_Func002 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Minato_6-1.mp3")
        call SetUnitAnimationByIndex(c, 13)
    endif
    if count == 10 or count == 115 then
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
    if count == 20 or count == 35 or count == 50 or count == 65 or count == 80 or count == 95 then 
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
    if count == 120 then 
        call Effect("war3mapImported\\[A]bloodex.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.2 * GetUnitAbilityLevel(c, 'A00Y')
        call DamageUnit(c, t, (dmg + 1 + GetUnitAbilityLevel(c, 'A03K')) * GetHeroAgi(c, true))
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

function Trig_MinatoW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03K' then 
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
            call TimerStart(z, 0.02, true, function Trig_MinatoW_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_MinatoW_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MinatoW takes nothing returns nothing
    set gg_trg_MinatoW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MinatoW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MinatoW, function Trig_MinatoW_Actions )
endfunction