//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MomijiR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Momiji_4.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Momiji_2-4.mp3")
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 40 then
        set x = PolarX(GetUnitX(t) , 20, a)
        set y = PolarY(GetUnitY(t) , 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 45 or count == 55 or count == 65 then
        call SoundStart("war3mapImported\\Momiji_2-2.mp3")
        set x = PolarX(GetUnitX(t) , 150, a)
        set y = PolarY(GetUnitY(t) , 150, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call SetUnitAnimationByIndex(c, GetRandomInt(7, 8))
        call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(c), GetUnitY(c), 80, a, 0, 0, 6, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 75 then
        call SoundStart("war3mapImported\\Momiji_1-1.mp3")
        call Effect("war3mapimported\\NanaSlash.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 80 then 
        call SetUnitX(c, PolarX(GetUnitX(t) , 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , 140, a))
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A0HI')) * GetHeroAgi(c, true))
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

function Trig_MomijiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HI' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MomijiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MomijiR takes nothing returns nothing
    set gg_trg_MomijiR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MomijiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MomijiR, function Trig_MomijiR_Actions)
endfunction