//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_IkkiD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\KuroIkki_7.mp3")
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 0.9)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call SetUnitFlyHeight(c, 800, 0)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , 800, a , 0, 0, 1, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 20 then
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) - 80, 0)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 2 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\icytouch.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c) + 50, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
    endif
    if count == 15 then
        call SoundStart("war3mapImported\\Sasuke_5-1.mp3")
    endif
    if count == 20 then
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\Gukuboom.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\File00005630.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
        call Effect("war3mapImported\\File00002085.mdx", GetUnitX(c) , GetUnitY(c) , 150, a , 0, 0, 1.5, 1.5, PercentTo255(60), 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\FawEffects (3).mdx", GetUnitX(c) , GetUnitY(c) , 50, a , 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\RasenganImpact.mdx", GetUnitX(c) , GetUnitY(c) , 200, a , 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then
                call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        if GroupGetCount(g) == 0 then
            call DisableAbility(GetUnitAbility(c, 'A0H1'), true, true)
            call EnableAbility(GetUnitAbility(c, 'A0H2'), true, true)
        endif
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_IkkiD_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SaveUnitHandle(ht, GetHandleId(z), 2, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 120, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 120, a))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitTimeScale(c, 1.5)
        call Effect("war3mapimported\\Black.mdx", GetUnitX(t) , GetUnitY(t) , 25, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4) 
        call SaveReal(ht, GetHandleId(z), 0, a)
    endif
    if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 then
        if count == 10 then
            set a = LoadReal(ht, GetHandleId(z), 0) + 40
        elseif count == 20 then
            set a = LoadReal(ht, GetHandleId(z), 0) - 120
        elseif count == 30 then
            set a = LoadReal(ht, GetHandleId(z), 0) - 10
        elseif count == 40 then
            set a = LoadReal(ht, GetHandleId(z), 0) - 10
        endif
        call SoundStart("war3mapImported\\KuroIkki_7-1.mp3")
        call SetUnitX(c, PolarX(GetUnitX(t), 400, a))
        call SetUnitY(c, PolarY(GetUnitY(t), 400, a))
        set a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
        call SetUnitFacingEx(c, a, true)
        call SetUnitAnimation(c, "attack")
        call SetUnitFlyHeight(c, GetUnitFlyHeight(c) + 180, 0)
        call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c), randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\File00009632.mdx", GetUnitX(c) , GetUnitY(c) , GetUnitFlyHeight(c), randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 60 then
        call SoundStart("war3mapImported\\KuroIkki_7-2.mp3")
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.2)
        call SetUnitX(c, GetUnitX(t))
        call SetUnitY(c, GetUnitY(t))
        call SetUnitFlyHeight(c, 0, 3000)
    endif
    if count == 75 then
        call SoundStart("war3mapImported\\Hassan_2-1.mp3")
        call DisableAbility(GetUnitAbility(c, 'A0H2'), true, true)
        call EnableAbility(GetUnitAbility(c, 'A0H1'), true, true)
        call StartAbilityCooldown(GetUnitAbility(c, 'A0H1'), 60)
        call SetUnitTimeScale(c, 1)
        call SetUnitFlyHeight(c, 0, 0)
        call Effect("war3mapImported\\Gukuboom.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("war3mapImported\\File00005630.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 3, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
        call Effect("war3mapImported\\File00002085.mdx", GetUnitX(c) , GetUnitY(c) , 150, a , 0, 0, 1.5, 1.5, PercentTo255(60), 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\FawEffects (3).mdx", GetUnitX(c) , GetUnitY(c) , 50, a , 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\RasenganImpact.mdx", GetUnitX(c) , GetUnitY(c) , 200, a , 0, 0, 5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)        
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, 8 * GetHeroAgi(c, true))
        call IssueImmediateOrderById(c, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 2))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
endfunction

function Trig_IkkiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0H1' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_IkkiD_Func001)
    endif
    if GetSpellAbilityId() == 'A0H2' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call TimerStart(z, 0.02, true, function Trig_IkkiD_Func002)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_IkkiD takes nothing returns nothing
    set gg_trg_IkkiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_IkkiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_IkkiD, function Trig_IkkiD_Actions)
endfunction