//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_YugiT_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local real dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
    local integer i = 1
    local effect e = LoadEffectHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Yugi_5.mp3")
        call SetUnitAnimationByIndex(c, 5)
        set x = PolarX(GetUnitX(c), 400, a + 180)
        set y = PolarY(GetUnitY(c), 400, a + 180)
        call Effect("war3mapimported\\SkyDragon.mdx", x, y, 200, a, 0, 0, 1, 9.2, 255, 255, 255, 0)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
        call Effect("war3mapimported\\oxgz.mdx", x, y, 25, a, 0, 0, 4, 9.2, 255, 0, 0, 255)
        call Effect("war3mapimported\\Black.mdx", x, y, 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Yugi_5-1.mp3")
    endif
    if count >= 100 and count <= 200 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
            set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
            call Effect("war3mapimported\\misaka light a.mdx", x, y, 25, a, 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\misaka light a.mdx", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\plasma+zanber+lightning.mdx", GetEffectX(e), GetEffectY(e), GetRandomReal(0, 600), randomAngle(), - 230, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
        call SoundStart("war3mapImported\\Yugi_5-2.mp3")
    endif
    if count <= 200 then
        call SaveInteger(ht, GetHandleId(z), 2, LoadInteger(ht, GetHandleId(z), 2) + R2I(255/200) )
        call SetSpecialEffectVertexColour(e, 255, 255, 255, LoadInteger(ht, GetHandleId(z), 2))
    endif
    if count == 300 then
        call SetUnitAnimationByIndex(c, 6)
        call SetSpecialEffectAnimationByIndex(e, 2)
        call SetSpecialEffectTimeScale(e, 1.6)
    endif
    if count == 350 then
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count >= 350 and count <= 450 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 20 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            loop
                exitwhen i > 10
                set a = LoadReal(ht, GetHandleId(z), 0)
                set x = PolarX(GetEffectX(e), 200 * i, a)
                set y = PolarY(GetEffectY(e), 200 * i, a)
                call Effect("war3mapimported\\hhzy123.mdx", x, y, 300, a, -90, 0, GetRandomReal(2, 3), 1, 255, 255, 255, PercentTo255(10))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set i = i + 1
            endloop
        endif
    endif
    if count == 400 then
        call SoundStart("war3mapImported\\Yugi_5-3.mp3")
    endif
    if count == 450 then 
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroInt(c, true))
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
    set e = null
endfunction

function Trig_YugiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A07N' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveInteger(ht, GetHandleId(z) , 2, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_YugiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_YugiT takes nothing returns nothing
    set gg_trg_YugiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_YugiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_YugiT, function Trig_YugiT_Actions)
endfunction