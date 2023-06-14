//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_PeinT_Func001 takes nothing returns nothing
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
    local unit v
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Pain_5.mp3")
        set x = PolarX(GetUnitX(t), 700, 60)
        set y = PolarY(GetUnitY(t), 700, 60)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 2, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN1Tendo.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 8, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, 120)
        set y = PolarY(GetUnitY(t), 700, 120)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 3, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN2Chikushido.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 9, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, 180)
        set y = PolarY(GetUnitY(t), 700, 180)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 4, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN3Ningendo.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, 240)
        set y = PolarY(GetUnitY(t), 700, 240)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 5, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN4Gakido.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, 300)
        set y = PolarY(GetUnitY(t), 700, 300)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 6, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN5Jigokudo.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 12, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, 360)
        set y = PolarY(GetUnitY(t), 700, 360)
        set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
        set v = CreateUnit(GetOwningPlayer(c), 'h00A', x, y, a)
        call SetUnitAnimationByIndex(v, 14)
        call SaveUnitHandle(ht, GetHandleId(z), 7, v)
        set bj_lastCreatedEffect = AddSpecialEffectTarget("war3mapImported\\PainPathsN6Asura.mdx", v, "head")
        call SaveEffectHandle(ht, GetHandleId(z), 13, bj_lastCreatedEffect)
    endif
    if count <= 25 then 
        loop
            exitwhen i > 5
            set v = LoadUnitHandle(ht, GetHandleId(z), 2 + i)
            set dist = Distance(GetUnitX(v), GetUnitY(v), GetUnitX(t), GetUnitY(t))
            set a = Angle(GetUnitX(v), GetUnitY(v), GetUnitX(t), GetUnitY(t))
            if dist > 140 then 
                call SetUnitX(v, PolarX(GetUnitX(v), dist / 15, a))
                call SetUnitY(v, PolarY(GetUnitY(v), dist / 15, a))
            else
                call SetUnitX(v, PolarX(GetUnitX(t), - 120, a))
                call SetUnitY(v, PolarY(GetUnitY(t), - 120, a))
            endif
            if count > 15 then
                call SetUnitFlyHeight(v, GetUnitFlyHeight(v) - 45, 0)
            else
                call SetUnitFlyHeight(v, GetUnitFlyHeight(v) + 30, 0)
            endif
            set i = i + 1
        endloop
    endif
    if count == 20 then
        call SoundStart("war3mapImported\\Pain_5-1.mp3")
    endif
    if count == 25 then 
        call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
    endif
    if count == 35 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroStr(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueImmediateOrderById(t, 851972)
        loop
            exitwhen i > 5
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 8 + i))
            set i = i + 1
        endloop
        set i = 0 
        loop
            exitwhen i > 5
            call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2 + i))
            set i = i + 1
        endloop
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set v = null
endfunction

function Trig_PeinT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0E8' then 
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_PeinT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_PeinT takes nothing returns nothing
    set gg_trg_PeinT = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_PeinT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_PeinT, function Trig_PeinT_Actions )
endfunction