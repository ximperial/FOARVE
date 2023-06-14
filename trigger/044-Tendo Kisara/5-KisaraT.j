//TESH.scrollpos=57
//TESH.alwaysfold=0
function Trig_KisaraT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kisara_5.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 800, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 800, a))
    endif
    if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 100 or count == 120 then
        call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count <= 120 then
        call SetUnitX(c, PolarX(GetUnitX(c), 5, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 5, a))
        call SetUnitFacing(c, a)
    endif
    if count == 120 then
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapImported\\[A]ZoroEf0.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call TimeScaleEffect(bj_lastCreatedEffect, 1, 1)
        call Effect("war3mapImported\\[DoFT]DevilSlamAddetivRed.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 200 then
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.85)
        call Effect("war3mapImported\\animeslashfinal.mdx", GetUnitX(c), GetUnitY(c), 25, a - 30, 0, 0, 4, 1, 255, 51, 51, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
    endif
    if count == 230 then
        call Effect("war3mapImported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 40, a + 30, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 40, a - 30, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\afbredcharge.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[DoFT]blood132.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az_axe_e1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 240 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_KisaraT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00X' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KisaraT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KisaraT takes nothing returns nothing
    set gg_trg_KisaraT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KisaraT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KisaraT, function Trig_KisaraT_Actions )
endfunction