//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KirinW_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z) , 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local real x1
    local real y1
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
        call SetUnitAnimationByIndex(c, 1)
        call SetUnitTimeScale(c, 2)
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapimported\\blackblink.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
        call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
    endif
    if count == 5 or count == 35 then
        call SoundStart("war3mapImported\\Kirin_2.mp3")
    endif
    if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 then
        set x = LoadReal(ht, GetHandleId(z), 0)
        set y = LoadReal(ht, GetHandleId(z), 1)
        set x = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
        set y = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(t, x)
            call SetUnitY(t, y)
        endif
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, randomAngle()))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, randomAngle()))
        set a = Angle(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimation(c, "attack")
        call Effect("war3mapimported\\YoooBug_HitFx.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 8, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindWeak2.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(3.5, 4.1), 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        call Effect("war3mapimported\\slashone.mdx", GetUnitX(t), GetUnitY(t), 30, randomAngle(), 0, 0, 0.9, 1, 255, 102, 102, 255)
    endif
    if count == 60 then
        call SetUnitAnimationByIndex(c, 2)
        call SetUnitTimeScale(c, 1.5)
    endif
    if count == 70 then
        call SetUnitX(c, PolarX(GetUnitX(t), 140, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 140, a))
        call Effect("war3mapimported\\FCJX_DG.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\DGDDXZ4.mdx", GetUnitX(t), GetUnitY(t), 200, a, - 45, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapImported\\DGDDXZ4.mdx", GetUnitX(t), GetUnitY(t), 200, a + 180, - 45, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        call Effect("war3mapImported\\DGDDXZ4.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 75 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (1 + GetUnitAbilityLevel(c, 'A0HN')) * GetHeroInt(c, true))
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

function Trig_KirinW_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0HN' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_KirinW_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KirinW takes nothing returns nothing
    set gg_trg_KirinW = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KirinW, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KirinW, function Trig_KirinW_Actions)
endfunction