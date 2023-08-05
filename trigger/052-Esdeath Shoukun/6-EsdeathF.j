//TESH.scrollpos=15
//TESH.alwaysfold=0
function Trig_EsdeathF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Esdeath_6.mp3")
    endif
    if count == 10 then
        call Effect("war3mapImported\\Shockwave Blue.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 140, a))
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 1.4)
        call Effect("war3mapImported\\Icestomp.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Fortress Death Classic.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
    endif
    if count == 25 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Esdeath_6-1.mp3")
        call SetUnitTimeScale(c, 1)
        loop
            exitwhen i > 5
            set x = PolarX(GetUnitX(t), 300, 60 * i)
            set y = PolarY(GetUnitY(t), 300, 60 * i)
            call Effect("war3mapImported\\sxbbtx2.mdl", x, y, 25, 60 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\icefirst.mdl", GetUnitX(t), GetUnitY(t), 25 + 100 * i, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 55 then 
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

function Trig_EsdeathF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A03C' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_EsdeathF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_EsdeathF takes nothing returns nothing
    set gg_trg_EsdeathF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_EsdeathF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_EsdeathF, function Trig_EsdeathF_Actions )
endfunction