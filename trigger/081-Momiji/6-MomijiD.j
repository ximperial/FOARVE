//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MomijiD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Momiji_7.mp3")
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count <= 50 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 35, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 35, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 55 then
        call SetUnitAnimationByIndex(c, 10)
        call SetUnitTimeScale(c, 1.25)
    endif
    if count == 70 or count == 80 or count == 90 or count == 100 or count == 110 then
        call SoundStart("war3mapImported\\Tohno_4-1.mp3")
    endif
    if count >= 60 and count <= 140 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            set x = PolarX(GetUnitX(t), GetRandomReal(- 700, 700), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 700, 700), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(5, 7), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
        endif
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Ogita_5-4.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        call Effect("war3mapimported\\123 (383)_2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 40, randomAngle(), 0, 0, 6, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 160 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
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

function Trig_MomijiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HL' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MomijiD_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MomijiD takes nothing returns nothing
    set gg_trg_MomijiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MomijiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MomijiD, function Trig_MomijiD_Actions)
endfunction