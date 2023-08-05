//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_SasukeW_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Sasuke_2.mp3")
        call SetUnitAnimationByIndex(c, 10)
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call Effect("war3mapimported\\hiteffect07bluea.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\daoguang-blue-hengsao.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 30 or count >= 30 and count <= 50 or count >= 50 and count <= 70 then
        set x = PolarX(GetUnitX(t), 10, a)
        set y = PolarY(GetUnitY(t), 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count >= 20 and count <= 30 or count >= 40 and count <= 50 or count >= 60 and count <= 70 then
        if dist > 140 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 5, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 5, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        endif
    endif
    if count == 20 then
        call SetUnitAnimationByIndex(c, 11)
    endif
    if count == 30 then
        call Effect("war3mapimported\\QQQQQR.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 25, a + 180, - 90, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\zhendi-yellow-qiquan-stone.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 40 then
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 50 then
        call Effect("war3mapimported\\hiteffect07bluea.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, .8, 1, 255, 255, 255, 255)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 10)
    endif
    if count == 70 then
        call Effect("war3mapimported\\hiteffect07bluea.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, .8, 1, 255, 255, 255, 255)
    endif
    if count >= 70 and count <= 90 then
        set x = PolarX(GetUnitX(t), 15, a)
        set y = PolarY(GetUnitY(t), 15, a)
        if IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) == false then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
    endif
    if count == 90 then
        call SoundStart("war3mapImported\\Sasuke_2-1.mp3")
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, .5)
        call SaveEffectHandle(ht, GetHandleId(z), 2, AddSpecialEffectTarget("war3mapImported\\EffecktChidori.mdx", c, "right hand")) 
        call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\SuperShinyThingy2.mdx", c, "right hand"))
        call Effect("war3mapimported\\cronosphere.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
    endif
    if count >= 90 and count <= 120 then
        if dist > 140 then
            call SetUnitX(t, PolarX(GetUnitX(t), dist / 15, a + 180))
            call SetUnitY(t, PolarY(GetUnitY(t), dist / 15, a + 180))
        else
            call SetUnitX(t, PolarX(GetUnitX(c), 120, a))
            call SetUnitY(t, PolarY(GetUnitY(c), 120, a))
        endif
    endif
    if count == 120 then
        call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\CF2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, .5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\chongfeng2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 130 then
        call Effect("war3mapimported\\star-magic.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\blue-toushewu.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call Effect("war3mapimported\\shandian-xiaoshi-man-2.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\[A]blue--zhendi3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 140 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A06W')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c) , 1200, 3, GetUnitX(t) , GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_SasukeW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06W' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_SasukeW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_SasukeW takes nothing returns nothing
    set gg_trg_SasukeW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SasukeW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_SasukeW, function Trig_SasukeW_Actions)
endfunction