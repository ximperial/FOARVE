//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_IkkiT_Func001 takes nothing returns nothing
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
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z) , - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z) , - 1) then
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z) , - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\KuroIkki_5.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\tesgigi.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\tesgigi.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 1000, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 1000, a))
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitFacingEx(c, a, true)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 11, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapimported\\az_airfloww11.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 11, 255, 255, 255, PercentTo255(90))
    endif
    if count <= 550 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\uissb.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\windcirclefaster2.mdx", GetUnitX(c), GetUnitY(c), 100, randomAngle(), 0, 0, GetRandomReal(0.85, 1.5), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif
    endif
    if count == 540 then
        call SetUnitAnimationByIndex(c, 8)
    endif
    if count == 550 then
        call CinematicFilterGenericEx(GetOwningPlayer(c), 2, BLEND_MODE_BLEND, "war3mapImported\\tesgigi2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\tesgigi2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
    endif
    if count >= 550 and count <= 600 then
        set x = PolarX(GetUnitX(c), 30, GetUnitFacing(c))
        set y = PolarY(GetUnitY(c), 30, GetUnitFacing(c))
        if count >= 580 then
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitX(c, x)
                call SetUnitY(c, y)
            endif
        else
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapimported\\YFtex1.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
    endif
    if count == 570 then
        call Effect("war3mapimported\\eros.mdx", GetUnitX(t) , GetUnitY(t) , 25, a + 30, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapimported\\eros.mdx", GetUnitX(t) , GetUnitY(t) , 25, a - 30, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 580 then
        call SoundStart("war3mapImported\\OkitaAlter_7-2.mp3")
        call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 10, 2, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 600 then
        call Effect("war3mapimported\\zm (280).mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
    endif
    if count == 605 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 15 * GetHeroAgi(c, true))
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

function Trig_IkkiT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A0GZ' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_IkkiT_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_IkkiT takes nothing returns nothing
    set gg_trg_IkkiT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_IkkiT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_IkkiT, function Trig_IkkiT_Actions)
endfunction