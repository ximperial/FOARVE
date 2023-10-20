//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NanayaR_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Nanaya_4.mp3")
        call SaveUnitHandle(ht, GetHandleId(z) , 2, CreateUnit(Player(12) , 'H00D', GetUnitX(c) , GetUnitY(c) , a)) 
        call SetUnitX(c, PolarX(GetUnitX(t) , - 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t) , - 400, a))
        call SetUnitAnimationByIndex(c, 21)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
        call SaveReal(ht, GetHandleId(z) , 0, a)
    endif
    if count <= 30 then
        set a = LoadReal(ht, GetHandleId(z) , 0)
        call SetUnitX(c, PolarX(GetUnitX(c) , 20, a))
        call SetUnitY(c, PolarY(GetUnitY(c) , 20, a))
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapimported\\Nanaya.mdx", GetUnitX(c) , GetUnitY(c) , 0, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
        endif
    endif
    if count == 20 then 
        call SoundStart("war3mapImported\\Nanaya_4-1.mp3")
        call SetUnitAnimationByIndex(c, 22)
        call Effect("war3mapimported\\eros.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 1.2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\arcdirve02b.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 4.5, 1.2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
    endif
    if count == 30 then
        call Effect("war3mapimported\\BloodP1.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\zhanji-blue.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\wind2.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
        call Effect("war3mapimported\\UltiZoro.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A06X')) * GetHeroAgi(c, true))
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

function Trig_NanayaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A06X' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NanayaR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NanayaR takes nothing returns nothing
    set gg_trg_NanayaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NanayaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NanayaR, function Trig_NanayaR_Actions)
endfunction