//TESH.scrollpos=36
//TESH.alwaysfold=0
function Trig_TsunaD_Func001 takes nothing returns nothing
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
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 1.4)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 5 then
        call Effect("war3mapImported\\Icestomp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 100 then 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitX(c, PolarX(GetUnitX(t), 140, randomAngle()))
            call SetUnitY(c, PolarY(GetUnitY(t), 140, randomAngle()))
            call SetUnitAnimation(c, "attack")
            call SetUnitFacingToFaceUnitTimed(c, t, 0)
            call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Tsuna_7.mp3")
        call SetUnitAnimationByIndex(c, 9)
        call SetUnitTimeScale(c, 1)
        call Effect("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 120 then
        call SetUnitAnimationByIndex(c, 5)
        call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count >= 120 and count <= 150 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(t), 100 + (count - 120) * 15, i * 60)
                set y = PolarY(GetUnitY(t), 100 + (count - 120) * 15, i * 60)
                call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", x, y, 25, i * 60, 0, 0, 1.5, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_TsunaD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A038' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_TsunaD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_TsunaD takes nothing returns nothing
    set gg_trg_TsunaD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_TsunaD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_TsunaD, function Trig_TsunaD_Actions )
endfunction