//TESH.scrollpos=35
//TESH.alwaysfold=0
function Trig_GonD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Gon_7.mp3")
        call SetUnitAnimationByIndex(c, 3)
        set x = PolarX(GetUnitX(c), - 30, a + 120)
        set y = PolarY(GetUnitY(c), - 30, a + 120)
        call Effect("war3mapimported\\[A]LotusStar.mdx", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count <= 160 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set x = PolarX(GetUnitX(c), - 30, a + 120)
            set y = PolarY(GetUnitY(c), - 30, a + 120)
            call Effect("war3mapimported\\A(BlackPurple).mdx", x, y, 100, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 190 then 
        call SoundStart("war3mapImported\\Gon_7-1.mp3")
        call SetUnitAnimationByIndex(c, 4)
    endif
    if count >= 170 and count <= 200 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif 
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(c), - 30, a + 120)
            set y = PolarY(GetUnitY(c), - 30, a + 120)
            call Effect("war3mapimported\\[A]LotusStar.mdx", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 200 then
        call Effect("war3mapimported\\[A]SuperBigExpPurpleLow1.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]AsumaEXP4.mdx", GetUnitX(t), GetUnitY(t), 120, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\[A]TohkaExp.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]ExpPurple.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 210 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroStr(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_GonD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02O' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_GonD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_GonD takes nothing returns nothing
    set gg_trg_GonD = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_GonD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_GonD, function Trig_GonD_Actions )
endfunction