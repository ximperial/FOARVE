//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_CronusF_Func001 takes nothing returns nothing
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
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count <= 40 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
    endif
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        if GetRandomInt(1, 2) == 1 then 
            call SoundStart("war3mapImported\\Cronus_7.mp3")
        else
            call SoundStart("war3mapImported\\Cronus_7-1.mp3")
        endif
        call SetUnitAnimationByIndex(c, 3)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Cronus_7-2.mp3")
        call SoundStart("war3mapImported\\Cronus_7-3.mp3")
        call Effect("war3mapImported\\bluedashsfx.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 2, 1, 0, 255, 0, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 1.5)
        call Effect("war3mapImported\\afbltjz.mdl", GetUnitX(c), GetUnitY(c), 120, randomAngle(), 0, 0, 7, 4, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 1.5)
    endif
    if count <= 20 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 5, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 5, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\zxd3.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 0, 255, 0, 255)
            call SetUnitTimeScale(bj_lastCreatedUnit, 2)
            call Effect("war3mapImported\\glchj.mdl", GetUnitX(c), GetUnitY(c), 120, a, 0, 0, 2, 1, 0, 255, 0, 255)
        endif
    endif
    if count == 20 then
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacing(c, a + 180)
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Cronus_7-4.mp3")
        call SetUnitAnimationByIndex(c, 19)
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapImported\\ltccc.mdl", GetUnitX(c), GetUnitY(c), 420, a, 0, 0, 1.2, 1, 255, 255, 255, 0)
        call SetUnitTimeScale(bj_lastCreatedUnit, 1.5)
        call UnitAddAbility(t, 'Amrf')
        call UnitRemoveAbility(t, 'Amrf')
        call SaveReal(ht, GetHandleId(z), 0, a)
        set iterator = 0
        call SaveInteger(ht, GetHandleId(z), 1, 0)
    endif
    if count >= 30 and count <= 50 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(t), 30, a)
        set y = PolarY(GetUnitY(t), 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        if count > 40 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
        else
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 40, randomAngle(), 0, 0, GetRandomReal(0.9, 1.3), 1, 255, 255, 255, 0)
            call Effect("war3mapImported\\AFB_LTSD.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) + 30, randomAngle(), 0, 0, GetRandomReal(1.7, 2.1), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 40 then
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueTargetOrderById(c, 851983, t)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Cronus_7-6.mp3")
        call SetUnitFlyHeight(t, 0, 0)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.6, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.8)
        call Effect("war3mapImported\\CronusEffectGreen.mdl", GetUnitX(t), GetUnitY(t), 180, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        call SetUnitTimeScale(bj_lastCreatedUnit, 0.8)
        call Effect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
    endif
    if count == 60 then 
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_CronusF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A062' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_CronusF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_CronusF takes nothing returns nothing
    set gg_trg_CronusF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_CronusF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_CronusF, function Trig_CronusF_Actions)
endfunction