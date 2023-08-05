//TESH.scrollpos=24
//TESH.alwaysfold=0
function Trig_KizaruF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kizaru_6.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
    endif
    if count == 20 then
        call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 400, a)) 
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 0.8)
        call SetUnitFlyHeight(c, 400, 0)
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kizaru Magic.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\laseryellow.mdl", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a + 180, - 45, 0, 1, 1, 255, 255, 255, 255)
        call MoveEffect3(bj_lastCreatedEffect, 20, - 15, 0.4, a + 180)
        call AnimEffect(bj_lastCreatedEffect, 2, 0.4)
    endif
    if count == 40 then 
        call Effect("war3mapImported\\Abyssal_Impact_Base.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DivineRage.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\ValkDust.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 50 then 
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
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_KizaruF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A01A' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KizaruF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KizaruF takes nothing returns nothing
    set gg_trg_KizaruF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KizaruF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KizaruF, function Trig_KizaruF_Actions )
endfunction