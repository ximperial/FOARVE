//TESH.scrollpos=42
//TESH.alwaysfold=0
function Trig_RyougiF_Func001 takes nothing returns nothing
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
    local real randomA
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart( "war3mapImported\\Ryougi_9.mp3" )
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0)) 
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 20 then
        call Effect("war3mapImported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\BasicStrikeStar.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 80 or count == 130 or count == 160 or count == 190 or count == 220 then
        call Effect("war3mapImported\\valkdustNew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 0.55, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 100 or count == 140 or count == 170 or count == 200 or count == 230 then
        call SetUnitAnimation(c, "spell two")
        call Effect("war3mapImported\\slash blue.mdx", GetUnitX(t), GetUnitY(t), 40, a - 45, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\slash blue.mdx", GetUnitX(t), GetUnitY(t), 40, a + 45, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 75 then
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 80 and count <= 120 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 25, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 25, a))
    endif
    if count == 125 or count == 155 or count == 185 or count == 215 then
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x, 400, randomA))
        call SetUnitY(c, PolarY(y, 400, randomA))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 130 and count <= 150 or count >= 160 and count <= 180 or count >= 190 and count <= 210 or count >= 220 and count <= 240 then
        set a = LoadReal(ht, GetHandleId(z), 0)
        call SetUnitX(c, PolarX(GetUnitX(c), 30, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 30, a))
    endif
    if count == 250 then
        set x = GetUnitX(t)
        set y = GetUnitY(t)
        set randomA = randomAngle()
        call SetUnitX(c, PolarX(x, 600, randomA))
        call SetUnitY(c, PolarY(y, 600, randomA))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimationByIndex(c, 9)
    endif
    if count == 290 then
        call SetUnitAnimationByIndex(c, 1)
    endif
    if count == 300 then
        call Effect("war3mapImported\\[A]devilslam.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(50)) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 340 then
        call Effect("war3mapImported\\wind2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255) 
        call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count >= 340 and count <= 370 then
        call SetUnitX(c, PolarX(GetUnitX(c), 10, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 10, a))
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 10, 0)
    endif
    if count == 370 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a)) 
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\fuzzystomp.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(10))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.1)
        call Effect("war3mapImported\\[A]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\slash blue.mdx", GetUnitX(t), GetUnitY(t), 40, a + 45, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\slash blue.mdx", GetUnitX(t), GetUnitY(t), 40, a - 45, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\WindExploreEffect(Bigger).mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.8, 1, 255, 255, 255, PercentTo255(80))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\cleave.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\Slam-1.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(20))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 380 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
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

function Trig_RyougiF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A00G' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_RyougiF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_RyougiF takes nothing returns nothing
    set gg_trg_RyougiF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RyougiF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_RyougiF, function Trig_RyougiF_Actions )
endfunction