//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NuraT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Nura_5.mp3")
        if GetUnitTypeId(c) == 'H0GA' then
            call SetUnitAnimationByIndex(c, 4)
        else
            call SetUnitAnimationByIndex(c, 5)
        endif
    endif
    if count == 1 or count == 10 or count == 20 or count == 30 or count == 40 or count == 60 or count == 80 then
        call Effect("war3mapimported\\DustWaveAnimate2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(.5, 1))
    endif
    if count == 10 then
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        call Effect("war3mapimported\\[A]DarkBlast.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, -90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .6)
        call Effect("war3mapimported\\blackstrike.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .6)
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, -90, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
    endif
    if count >= 10 and count <= 40 then
        set x = PolarX(GetUnitX(t) , 20, a)
        set y = PolarY(GetUnitY(t) , 20, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 20 or count == 40 or count == 60 or count == 80 then
        call Effect("war3mapimported\\[A]Desecrate.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\Gravitone.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 40 then
        call Effect("war3mapimported\\Shockwave Blue.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 80 and count <= 110 then
        if dist > 140 then 
            call SetUnitX(c, PolarX(GetUnitX(c) , dist / 20, a))
            call SetUnitY(c, PolarY(GetUnitY(c) , dist / 20, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t) , - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t) , - 120, a))
        endif
    endif
    if count == 100 then
        if GetUnitTypeId(c) == 'H0GA' then
            call SetUnitAnimationByIndex(c, 6)
        else
            call SetUnitAnimationByIndex(c, 5)
        endif
    endif
    if count == 110 then
        call Effect("war3mapimported\\[A]SuperBigExpBlackBlack.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, -90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]SuperBigExplosionBlack.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapimported\\[A]DevilSlamDark.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]blackbombb.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 3.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]SuperBigExpBlackLow.mdx", GetUnitX(t) , GetUnitY(t) , 150, a, -90, 0, 2.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
    endif
    if count == 120 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_NuraT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07I' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NuraT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NuraT takes nothing returns nothing
    set gg_trg_NuraT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NuraT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NuraT, function Trig_NuraT_Actions)
endfunction