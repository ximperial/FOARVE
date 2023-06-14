//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_RyuzakiR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ryuzaki_4.mp3")
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.5)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapImported\\devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 15 or count == 35 or count == 50 or count == 80 then
        call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.25), 2, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.45, 0.65))
    endif
    if count == 10 or count == 25 or count == 40 or count == 55 or count == 70 or count == 90 then
        if GetRandomInt(1, 2) == 1 then
            call SoundStart("war3mapImported\\Ryuzaki_4-1.mp3")
        else
            call SoundStart("war3mapImported\\Ryuzaki_4-2.mp3")
        endif
    endif
    if count >= 5 and count <= 105 then 
        set x = PolarX(GetUnitX(t), 8, a)
        set y = PolarY(GetUnitY(t), 8, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SetUnitAnimation(c, "attack")
            set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
            call Effect("war3mapImported\\hit.mdx", x, y, GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
            call Effect("war3mapImported\\hitwave.mdx", x, y, GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
        endif
    endif
    if count == 110 then 
        call SoundStart("war3mapImported\\Satomi_4-5.mp3")
        call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
    endif
    if count == 120 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0G9')) * GetHeroStr(c, true))
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

function Trig_RyuzakiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0G9' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RyuzakiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyuzakiR takes nothing returns nothing
    set gg_trg_RyuzakiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyuzakiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyuzakiR, function Trig_RyuzakiR_Actions )
endfunction