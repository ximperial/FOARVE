//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_DiegoF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real ux
    local real uy
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local real randomA
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Diego_6.mp3")
        set x = PolarX(GetUnitX(c), 70, a - 120)
        set y = PolarY(GetUnitY(c), 70, a - 120)
        call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
    endif
    if count == 10 then
        call SetUnitAnimationByIndex(c, 2)
    endif
    if count == 30 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 2)
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call SetEffectX(e, x)
        call SetEffectY(e, y)
        call SetSpecialEffectZ(e, GetAxisZ(x, y))
        call SetSpecialEffectYaw(e, a)
        call SetSpecialEffectAnimationByIndex(e, 3)
    endif
    if count >= 30 and count <= 230 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set ux = GetUnitX(t)
            set uy = GetUnitY(t)
            set randomA = randomAngle()
            set x = PolarX(ux, GetRandomReal(-350, 350), randomA)
            set y = PolarY(uy, GetRandomReal(-350, 350), randomA)
            call Effect("war3mapimported\\Hit.mdx", x, y, GetRandomReal(50, 100), randomAngle(), 0, 0, GetRandomReal(1.2, 1.65), 1.5, 255, 100, 0, 150)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 1))
            set randomA = randomAngle()
            set x = PolarX(ux, GetRandomReal(-350, 350), randomA)
            set y = PolarY(uy, GetRandomReal(-350, 350), randomA)
            call Effect("war3mapimported\\EnergyBurst2.mdx", x, y, GetRandomReal(50, 100), randomAngle(), 0, 0, GetRandomReal(1.35, 1.85), 1.5, 255, 255, 255, 150)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.9))
        endif
    endif
    if count == 240 then
        call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .6)
        call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\windexploreeffect(bigger).mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
        call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 125, a, - 90, 0, 15, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
    endif
    if count == 250 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroStr(c, true))
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
    set e = null
endfunction

function Trig_DiegoF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0D4' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_DiegoF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_DiegoF takes nothing returns nothing
    set gg_trg_DiegoF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_DiegoF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_DiegoF, function Trig_DiegoF_Actions )
endfunction