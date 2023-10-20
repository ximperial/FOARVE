//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ShuF_Func001 takes nothing returns nothing
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
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Shu_6-2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 120, a))
        call SetUnitFacingToFaceUnitTimed(c, t, 0)
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapImported\\0631.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 3.5, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\0631.mdl", GetUnitX(c), GetUnitY(c), 0, randomAngle(), 0, 0, 3.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\0203.mdl", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
    endif
    if count == 30 then
        call SetUnitAnimationByIndex(c, 4)
        call Effect("war3mapImported\\zm (280).mdl", GetUnitX(c), GetUnitY(c), 200, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Shu_6-3.mp3")
        call Effect("war3mapImported\\File00002085.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00002105.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\36.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 4.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\zm (280).mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 60 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_ShuF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05Q' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ShuF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ShuF takes nothing returns nothing
    set gg_trg_ShuF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ShuF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ShuF, function Trig_ShuF_Actions)
endfunction