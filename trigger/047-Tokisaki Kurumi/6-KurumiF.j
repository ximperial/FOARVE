//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_KurumiF_Func001 takes nothing returns nothing
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
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Kurumi_6.mp3")
        call SetUnitAnimationByIndex(c, 14)
        call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3.5, 3, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 100 then
        call Effect("war3mapImported\\KurumiBall.mdx", GetUnitX(t), GetUnitY(t), 800, a, 0, 0, 4, 4.8, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count == 110 then
        call SetUnitAnimationByIndex(c, 15)
    endif
    if count >= 120 and count <= 240 then
        call SetSpecialEffectZ(e, GetEffectZ(e) - 6)
    endif
    if count == 240 then
        call SoundStart("war3mapImported\\Kurumi_6-1.mp3")
        call SetSpecialEffectAnimationByIndex(e, 2)
        call Effect("war3mapImported\\sjkjz.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 250 then 
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
endfunction

function Trig_KurumiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02Y' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KurumiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KurumiF takes nothing returns nothing
    set gg_trg_KurumiF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KurumiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KurumiF, function Trig_KurumiF_Actions )
endfunction