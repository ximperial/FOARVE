//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NuraD_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Nura_7.mp3")
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , 0))
        call SetUnitX(c, PolarX(GetUnitX(t) , -500, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , -500, a))
        call SetUnitAnimationByIndex(c, 3)
        call Effect("war3mapimported\\sakura round.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\red aura.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ByakuranFireUlti2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .7)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call SaveReal(ht, GetHandleId(z) , 0, a)
    endif
    if count >= 10 and count <= 50 then
        set a = LoadReal(ht, GetHandleId(z) , 0)
        set x = PolarX(GetUnitX(c) , 15, a)
        set y = PolarY(GetUnitY(c) , 15, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\[A]qianbenying8.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ByakuranFireUlti2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 40 then
        call SoundStart("war3mapImported\\Nura_7-1.mp3")
    endif
    if count == 50 then
        call Effect("war3mapimported\\BloodP1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .6)
        call Effect("war3mapimported\\[A]bloodex.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .6)
        call Effect("war3mapImported\\UltiZoro.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .4)
    endif
    if count == 60 then 
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z) , 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_NuraD_Func002 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Nura_7-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t) , -120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , -120, a))
        call SetUnitAnimationByIndex(c, 11)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\az_doomdragon_d2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\ByakuranFireUlti2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .7)
        call Effect("war3mapimported\\[A]qianbenying8.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Nura_7-2.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapImported\\1062.mdx", GetUnitX(c) , GetUnitY(c) , 40, a, -180, 0, 0.8, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .4)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Nura_7-3.mp3")
        call Effect("war3mapimported\\[A]SuperBigExpBlackBlack.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, -90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 3.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 60 then
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 9 * GetHeroAgi(c, true))
        call knockbackUnit(t, 600, a, 0.6)
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

function Trig_NuraD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07K' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        if GetUnitTypeId(c) == 'H0GA' then 
            call TimerStart(z, 0.02, true, function Trig_NuraD_Func002)
        else
            call TimerStart(z, 0.02, true, function Trig_NuraD_Func001)
        endif
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NuraD takes nothing returns nothing
    set gg_trg_NuraD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NuraD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NuraD, function Trig_NuraD_Actions)
endfunction