//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KenshiroD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kenshiro_7.mp3")
        call SetUnitAnimationByIndex(c, 18)
    endif
    if count == 1 or count == 20 then
        call Effect("war3mapImported\\star-magic.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapImported\\WindWeak2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\WindWeak(Thicker).mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\CF2.mdl", GetUnitX(c), GetUnitY(c), 0, a, 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\wind3.mdl", GetUnitX(c), GetUnitY(c), 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count <= 20 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 23)
        call SetUnitTimeScale(c, 1.1)
    endif
    if count == 30 or count == 60 or count == 90 or count == 120 then
        call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(c), GetUnitY(c), 150, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
        call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(c), GetUnitY(c), 150, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
    endif
    if count == 40 then
        call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", PolarX(GetUnitX(t), 100, a + 90), PolarY(GetUnitY(t), 100, a + 90), 100, a - 90, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", PolarX(GetUnitX(t), 100, a - 90), PolarY(GetUnitY(t), 100, a - 90), 100, a + 90, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", PolarX(GetUnitX(t), 100, a + 90), PolarY(GetUnitY(t), 100, a + 90), 100, a - 90, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", PolarX(GetUnitX(t), 100, a - 90), PolarY(GetUnitY(t), 100, a - 90), 100, a + 90, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 50 then
        call SetUnitTimeScale(c, 0.1) 
    endif
    if count == 140 then
        call SetUnitTimeScale(c, 1)
    endif
    if count == 150 then
        call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", PolarX(GetUnitX(t), 100, a + 90), PolarY(GetUnitY(t), 100, a + 90), 100, a - 90, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", PolarX(GetUnitX(t), 100, a - 90), PolarY(GetUnitY(t), 100, a - 90), 100, a + 90, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", PolarX(GetUnitX(t), 100, a + 90), PolarY(GetUnitY(t), 100, a + 90), 100, a - 90, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", PolarX(GetUnitX(t), 100, a - 90), PolarY(GetUnitY(t), 100, a - 90), 100, a + 90, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 160 then 
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
endfunction

function Trig_KenshiroD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06G' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KenshiroD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KenshiroD takes nothing returns nothing
    set gg_trg_KenshiroD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KenshiroD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KenshiroD, function Trig_KenshiroD_Actions )
endfunction