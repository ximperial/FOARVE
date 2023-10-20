//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KirinF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real x1
    local real y1
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
        call SoundStart("war3mapImported\\Kirin_6.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapimported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 300, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 300, a))
    endif
    if count == 20 or count == 50 or count == 80 or count == 110 then
        call SoundStart("war3mapImported\\Kirin_6-1.mp3")
    endif
    if count >= 10 and count <= 140 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(250, 650), randomAngle(), 0, 0, GetRandomReal(5, 7), 3 - (count - 10) * 0.02, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.3)
        endif
    endif
    if count == 140 then
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 160 then
        call SoundStart("war3mapImported\\Tohno_5-5.mp3")
        call Effect("war3mapimported\\[DoFT]blinkcasterWhite.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 200, a, 0, 0, 12, 3, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 170 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

function Trig_KirinF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HS' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KirinF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KirinF takes nothing returns nothing
    set gg_trg_KirinF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KirinF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KirinF, function Trig_KirinF_Actions)
endfunction