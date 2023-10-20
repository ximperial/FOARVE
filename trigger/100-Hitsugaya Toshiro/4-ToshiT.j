//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ToshiT_Func001 takes nothing returns nothing
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
    local effect e
    local effect e2
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Toshiro_5.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 60, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 120, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 180, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 240, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 300, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t), GetUnitY(t), 25, 360, 0, 0, 3, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        call SaveEffectHandle(ht, GetHandleId(z), 7, bj_lastCreatedEffect)
    endif
    if count <= 20 then
        loop
            exitwhen i > 5
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call SetEffectX(e, PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e)))
            call SetEffectY(e, PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e)))
            call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
            set i = i + 1
        endloop
    endif
    if count == 30 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 3)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 8, bj_lastCreatedLightning)
        set e = LoadEffectHandle(ht, GetHandleId(z), 3)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 4)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 9, bj_lastCreatedLightning)
        set e = LoadEffectHandle(ht, GetHandleId(z), 4)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 5)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 10, bj_lastCreatedLightning)
        set e = LoadEffectHandle(ht, GetHandleId(z), 5)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 6)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 11, bj_lastCreatedLightning)
        set e = LoadEffectHandle(ht, GetHandleId(z), 6)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 7)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 12, bj_lastCreatedLightning)
        set e = LoadEffectHandle(ht, GetHandleId(z), 7)
        set e2 = LoadEffectHandle(ht, GetHandleId(z), 2)
        set bj_lastCreatedLightning = AddLightningEx("MBSS", true, GetEffectX(e), GetEffectY(e), GetEffectZ(e), GetEffectX(e2), GetEffectY(e2), GetEffectZ(e2))
        call SaveLightningHandle(ht, GetHandleId(z), 13, bj_lastCreatedLightning)
    endif
    if count == 50 then
        call Effect("war3mapImported\\icestolb.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 200)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call Effect("war3mapImported\\thunderclapcaster3.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 200)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
    endif
    if count == 60 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 8))
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 9))
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 10))
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 11))
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 12))
        call DestroyLightning(LoadLightningHandle(ht, GetHandleId(z), 13))
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

function Trig_ToshiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0CB' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ToshiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ToshiT takes nothing returns nothing
    set gg_trg_ToshiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ToshiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_ToshiT, function Trig_ToshiT_Actions)
endfunction