//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_TohkaR_Func001 takes nothing returns nothing
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
    local real dmg
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tohka_4.mp3")
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.85)
        call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        loop
            exitwhen i > 8
            set x = PolarX(GetUnitX(c), 250, i * 40)
            set y = PolarY(GetUnitY(c), 250, i * 40)
            call Effect("war3mapImported\\LotusStar.mdl", x, y, 25, i * 40, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set i = i + 1
        endloop
    endif
    if count >= 30 and count <= 50 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 15, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 15, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 50 then
        loop
            exitwhen i > 5
            call Effect("war3mapImported\\Tohkawave.mdl", GetUnitX(t), GetUnitY(t), 25, i * 60, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call MoveEffect(bj_lastCreatedEffect, 50, 0.6, i * 60)
            call Effect("Abilities\\Spells\\Undead\\OrbOfDeath\\OrbOfDeathMissile.mdl", GetUnitX(t), GetUnitY(t), 40, i * 60, 0, 0, 2, 2, 255, 255, 255, 255)
            call MoveEffect(bj_lastCreatedEffect, 50, 0.6, i * 60)
            call AnimEffect(bj_lastCreatedEffect, 2, 0.6)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.8, 0.6)
            set i = i + 1
        endloop
        call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\AncientExplode2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapImported\\Death Release.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\Purple Lightning.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
    endif
    if count == 55 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        set dmg = 0.2 * GetUnitAbilityLevel(c, 'B007')
        call DamageUnit(c, t, (dmg + 6 + 2 * GetUnitAbilityLevel(c, 'A05O')) * GetHeroInt(c, true))
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

function Trig_TohkaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A05O' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TohkaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TohkaR takes nothing returns nothing
    set gg_trg_TohkaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TohkaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_TohkaR, function Trig_TohkaR_Actions)
endfunction