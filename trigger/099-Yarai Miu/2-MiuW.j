//TESH.scrollpos=39
//TESH.alwaysfold=0
globals
    integer MiuRHash = StringHash("MiuR")
    integer MiuWHash = StringHash("MiuW")
endglobals

function Trig_MiuW_Func001 takes nothing returns nothing
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
    if count <= 45 then
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
    endif
    if count == 1 then
        call SoundStart("war3mapImported\\Miu_2-1.mp3")
        call SoundStart("war3mapImported\\Miu_2-2.mp3")
        call SetUnitAnimationByIndex(c, 5)
        call SetUnitTimeScale(c, 2)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Miu_1-2.mp3")
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        set x = PolarX(GetUnitX(t), - 100, a)
        set y = PolarY(GetUnitY(t), - 100, a)
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 10 and count <= 40 then 
        set a = LoadReal(ht, GetHandleId(z), 0)
        set x = PolarX(GetUnitX(t), 20, a)
        set y = PolarY(GetUnitY(t), 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
    endif
    if count == 40 then
        call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 45 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0GL')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        if not HaveSavedBoolean(ht, MiuWHash, GetHandleId(c)) then
            call StartAbilityCooldown(GetUnitAbility(c, 'A0GL'), 0)
            call SaveBoolean(ht, MiuWHash, GetHandleId(c), true)
        endif
        if not HaveSavedHandle(ht, MiuRHash, GetHandleId(c)) and IsUnitHero(t) then
            call DisableAbility(GetUnitAbility(c, 'A0GN'), true, true)
            call EnableAbility(GetUnitAbility(c, 'A0I2'), true, true)
            call SaveUnitHandle(ht, MiuRHash, GetHandleId(c), t)
        endif
    endif
    if count == 195 then
        if HaveSavedHandle(ht, MiuRHash, GetHandleId(c)) then
            call DisableAbility(GetUnitAbility(c, 'A0I2'), true, true)
            call EnableAbility(GetUnitAbility(c, 'A0GN'), true, true)
            call RemoveSavedHandle(ht, MiuRHash, GetHandleId(c))
        endif
        if LoadBoolean(ht, MiuWHash, GetHandleId(c)) then
            call StartAbilityCooldown(GetUnitAbility(c, 'A0GL'), GetAbilityCooldown(GetUnitAbility(c, 'A0GL')))
            call RemoveSavedBoolean(ht, MiuWHash, GetHandleId(c))
        endif
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function MiuW2Reset takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    call RemoveSavedBoolean(ht, MiuWHash, GetHandleId(c))
    call FlushChildHashtable(ht, GetHandleId(z))
    call PauseTimer(z)
    call DestroyTimer(z)
    set z = null
    set c = null
endfunction

function Trig_MiuW_Func002 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Miu_2.mp3")
        call SetUnitAnimationByIndex(c, 14)
    endif
    if count <= 15 then 
        if dist > 140 then 
            call SetUnitX(t, PolarX(GetUnitX(t), dist / 10, a + 180))
            call SetUnitY(t, PolarY(GetUnitY(t), dist / 10, a + 180))
        else
            call SetUnitX(t, PolarX(GetUnitX(c), 120, a))
            call SetUnitY(t, PolarY(GetUnitY(c), 120, a))
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 20 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1.5 + 0.5 * GetUnitAbilityLevel(c, 'A0GL')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call TimerStart(z, GetAbilityCooldown(GetUnitAbility(c, 'A0GL')), false, function MiuW2Reset)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_MiuW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GL' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        if LoadBoolean(ht, MiuWHash, GetHandleId(c)) then
            if HaveSavedHandle(ht, MiuRHash, GetHandleId(c)) then
                call DisableAbility(GetUnitAbility(c, 'A0I2'), true, true)
                call EnableAbility(GetUnitAbility(c, 'A0GN'), true, true)
                call RemoveSavedHandle(ht, MiuRHash, GetHandleId(c))
            endif
            call SaveBoolean(ht, MiuWHash, GetHandleId(c), false)
            call TimerStart(z, 0.02, true, function Trig_MiuW_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_MiuW_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MiuW takes nothing returns nothing
    set gg_trg_MiuW = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MiuW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MiuW, function Trig_MiuW_Actions )
endfunction