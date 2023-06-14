//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_DiegoD_Func001 takes nothing returns nothing
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
    local real speed = 2
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_7.mp3")
        set x = PolarX(GetUnitX(c), 70, a)
        set y = PolarY(GetUnitY(c), 70, a)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 20 then
        call SetSpecialEffectAnimationByIndex(e, 1)
    endif
    if count <= 25 then
        set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        if dist > 140 then
            call SetEffectX(e, PolarX(GetEffectX(e), dist / 15, a))
            call SetEffectY(e, PolarY(GetEffectY(e), dist / 15, a))
        else
            call SetEffectX(e, GetUnitX(t))
            call SetEffectY(e, GetUnitY(t))
        endif
        call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 25 then
        call SoundStart("war3mapImported\\Satomi_4-5.mp3")
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
    endif
    if count == 30 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
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

function Trig_DiegoD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0D5' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_DiegoD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DiegoD takes nothing returns nothing
    set gg_trg_DiegoD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DiegoD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_DiegoD, function Trig_DiegoD_Actions )
endfunction