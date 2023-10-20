//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_EmiyaW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Emiya_2.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitTimeScale(c, 2)
    endif
    if count <= 120 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 5 or iterator == 10 then
            if iterator == 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SetUnitAnimation(c, "attack")
            endif
            call Effect("war3mapImported\\akiha_claw_blugreen.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), -35, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha_claw_red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), -35, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(3, 5), 1, GetRandomInt(1, 255), GetRandomInt(1, 255), GetRandomInt(1, 255), PercentTo255(GetRandomReal(25, 80)))
            call Effect("war3mapImported\\EarthSmash.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 120 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0D7')) * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_EmiyaW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0D7' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EmiyaW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EmiyaW takes nothing returns nothing
    set gg_trg_EmiyaW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EmiyaW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_EmiyaW, function Trig_EmiyaW_Actions)
endfunction