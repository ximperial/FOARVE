//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_ArashF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 1
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Arash_6.mp3")
        call SoundStart("war3mapImported\\Arash_6-1.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.2)
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\arashf.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\arashf.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
    endif
    if count == 15 then
        call Effect("war3mapImported\\exshexian111.mdl", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        loop
            exitwhen i > 6
            set x = PolarX(GetUnitX(c), 230 * i, a)
            set y = PolarY(GetUnitY(c), 230 * i, a)
            call Effect("war3mapImported\\LW11.mdl", x, y, 110, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            set i = i + 1
        endloop
    endif
    if count == 25 then 
        call SetUnitTimeScale(c, 1)
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

function Trig_ArashF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HA' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_ArashF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_ArashF takes nothing returns nothing
    set gg_trg_ArashF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_ArashF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_ArashF, function Trig_ArashF_Actions )
endfunction