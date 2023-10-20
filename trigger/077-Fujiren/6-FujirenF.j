//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_FujirenF_Func001 takes nothing returns nothing
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
    local real pitch
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Fujiren_6.mp3")
        call SetUnitAnimationByIndex(c, 12)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
    endif
    if count <= 30 then
        if dist < 900 then
            set x = PolarX(GetUnitX(c), - 30, a)
            set y = PolarY(GetUnitY(c), - 30, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x)
                call SetUnitY(c, y)
            endif
        endif
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 30, 0)
    endif
    if count == 30 then
        call SetUnitAnimationByIndex(c, 13)
    endif
    if count >= 30 and count <= 50 then
        set dist = Distance(GetUnitX(c) , GetUnitY(c) , GetUnitX(t) , GetUnitY(t))
        if dist > 100 then
            call SetUnitX(c, PolarX(GetUnitX(c), dist / 10, a))
            call SetUnitY(c, PolarY(GetUnitY(c), dist / 10, a))
        else
            call SetUnitX(c, PolarX(GetUnitX(t), - 50, a))
            call SetUnitY(c, PolarY(GetUnitY(t), - 50, a))
        endif
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 40, 0)
    endif
    if count == 34 or count == 39 or count == 44 then
        set pitch = Slope(GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), GetUnitX(t), GetUnitY(t), 0)
        call Effect("war3mapimported\\zxd3.mdx", GetUnitX(c), GetUnitY(c), GetUnitFlyHeight(c), a, pitch, 0, 3, 1, 51, 153, 255, PercentTo255(90))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Kirito_6-2.mp3")
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
    endif
    if count == 55 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 11 * GetHeroAgi(c, true))
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

function Trig_FujirenF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0G0' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_FujirenF_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_FujirenF takes nothing returns nothing
    set gg_trg_FujirenF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FujirenF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_FujirenF, function Trig_FujirenF_Actions)
endfunction