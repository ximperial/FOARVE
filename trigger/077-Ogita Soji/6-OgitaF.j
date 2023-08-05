//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Ogita_6.mp3")
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t) , - 1400, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 1400, a))
        call SetUnitAnimationByIndex(c, 14)
        call SetUnitTimeScale(c, 0.85)
        call SetUnitFacingEx(c, a, true)
    endif
    if count == 20 or count == 50 then
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 5, 2, 51, 153, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 10 or count == 25 or count == 40 or count == 60 then
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(c), GetUnitY(c), 120, a, - 90, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 10 or count == 30 then
        call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count <= 70 then
        call SetUnitX(c, PolarX(GetUnitX(c), 10, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 10, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 1.5, PercentTo255(90), 255, 255, 255)
        endif
    endif
    if count == 60 then
        call SetUnitVertexColor(c, 255, 255, 255, 0)
        call Effect("war3mapimported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, 0.9, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Ogita_6-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), - 200, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 200, a))
        call SetUnitVertexColor(c, 255, 255, 255, 255)
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1)
        call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(c), GetUnitY(c), 50, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(50))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Ogita_6-2.mp3")
    endif
    if count == 120 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call SetUnitAnimationByIndex(c, 8)
        loop
            exitwhen i > 11
            set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(200, 600), randomAngle(), 0, 0, GetRandomReal(4, 6), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set i = i + 1
        endloop
    endif
    if count == 140 then
        call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\jin xia.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3.3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(60))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
    endif
    if count == 150 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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

function Trig_OgitaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GI' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_OgitaF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_OgitaF takes nothing returns nothing
    set gg_trg_OgitaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaF, function Trig_OgitaF_Actions)
endfunction