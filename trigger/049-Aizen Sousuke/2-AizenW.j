//TESH.scrollpos=18
//TESH.alwaysfold=0
function Trig_AizenW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Aizen_2.mp3")
        call SoundStart("war3mapImported\\Aizen_2-1.mp3")
        call SetUnitAnimationByIndex(c, 17)
        call Effect("war3mapimported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\white-shandian-qiquan-yellow.mdx", c, "hand right"))
        set x = PolarX(GetUnitX(c), 10, a)
        set y = PolarY(GetUnitY(c), 10, a)
        call Effect("war3mapimported\\white-shandian-qiquan-yellow.mdx", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 10 then
        call Effect("war3mapimported\\whiteslice_yellow.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 30 then
        call SetEffectX(e, PolarX(GetEffectX(e), dist / 20, a))
        call SetEffectY(e, PolarY(GetEffectY(e), dist / 20, a))
        call SetSpecialEffectZ(e, 25 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Aizen_2-2.mp3")
        call Effect("war3mapimported\\white-qiquan-juhuang_yellow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\white-shandian-qiquan-yellow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\RaitonAizen2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_cocochristmas_d_impact_yellow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_kaldr_blast_t2_yellow.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A03P')) * GetHeroAgi(c, true))
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

function Trig_AizenW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03P' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_AizenW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_AizenW takes nothing returns nothing
    set gg_trg_AizenW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AizenW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_AizenW, function Trig_AizenW_Actions )
endfunction