//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NanayaF_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Nanaya_6.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitPathing(c, false)
        call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 100, 0)
        call SetUnitAnimationByIndex(c, 28)
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
        call Effect("war3mapimported\\devilslam.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
    endif
    if count == 1 or count == 20 or count == 40 then
        call Effect("war3mapimported\\wind4.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
        call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(c) , GetUnitY(c) , 25, randomAngle() , 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
    endif
    if count == 30 then
        call Effect("war3mapImported\\shanguangbiubiu.mdl", GetUnitX(c) , GetUnitY(c) , 150, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\cyzblueXT.mdl", GetUnitX(c) , GetUnitY(c) , 200, a, - 40, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 40 then
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", c, "right hand"))
    endif
    if count == 50 then
        call SetUnitAnimationByIndex(c, 30)
        call SoundStart("war3mapImported\\Nanaya_6-1.mp3")
        call SoundStart("war3mapImported\\Nanaya_6-2.mp3")
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, GetRandomReal(2, 3) , 1, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, GetRandomReal(2, 3) , 1, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, GetRandomReal(2, 3) , 1, 255, 255, 255, PercentTo255(90))
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t) , GetUnitY(t) , 40, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
    endif
    if count == 80 then 
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitPathing(c, true)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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

function Trig_NanayaF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07Y' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_NanayaF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_NanayaF takes nothing returns nothing
    set gg_trg_NanayaF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NanayaF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NanayaF, function Trig_NanayaF_Actions)
endfunction