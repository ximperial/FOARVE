//TESH.scrollpos=6
//TESH.alwaysfold=0
function Trig_KiritoF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Kirito_5.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 2.4, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapImported\\Effect_Fate_jiujian_galibang_dimianjianqi2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 2.4, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 100 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator == 10 or iterator == 20 then
            if iterator == 20 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SoundStart("war3mapImported\\Kirito_5-3.mp3")
                call SetUnitAnimationByIndex(c, 32)
            else
                call SoundStart("war3mapImported\\Kirito_5-2.mp3")
            endif
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(200, 400), randomAngle(), - 45, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\JeanlilyHXDG1.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(300, 400), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\JeanlilyHXDG2.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(300, 400), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\uissb.mdx", GetUnitX(t), GetUnitY(t), 200, randomAngle(), - 45, 0, GetRandomReal(3, 5), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(7, 9), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\specialanimedustwave.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(3, 5), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 80 then
        call SoundStart("war3mapImported\\Kirito_5-1.mp3")
    endif
    if count == 110 then 
        call SetUnitTimeScale(c, 1)
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

function Trig_KiritoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A096' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KiritoF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KiritoF takes nothing returns nothing
    set gg_trg_KiritoF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KiritoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KiritoF, function Trig_KiritoF_Actions )
endfunction