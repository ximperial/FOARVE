//TESH.scrollpos=12
//TESH.alwaysfold=0
function Trig_ByakuranF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local integer i = 0
    local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Byakuran_6.mp3")
        if b then
            call SetUnitAnimationByIndex(c, 15)
        else
            call SetUnitAnimationByIndex(c, 14)
        endif
        call Effect("war3mapImported\\Hell_Roots_Buff.mdl", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1, 2, 255, 255, 255, 255)
    endif
    if count == 100 then
        call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
    endif
    if count == 110 then
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
endfunction

function Trig_ByakuranF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0AM' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveReal(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(c, 'B00Y') > 0)
        call TimerStart(z, 0.02, true, function Trig_ByakuranF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction
    
//===========================================================================
function InitTrig_ByakuranF takes nothing returns nothing
    set gg_trg_ByakuranF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ByakuranF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ByakuranF, function Trig_ByakuranF_Actions )
endfunction