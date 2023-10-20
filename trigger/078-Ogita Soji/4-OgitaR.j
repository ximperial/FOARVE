//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_OgitaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = GetUnitFacing(c)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    local effect e
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Ogita_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call UnitAddAbility(c, 'Amrf')
        call UnitRemoveAbility(c, 'Amrf')
        call SetUnitFlyHeight(c, 3000, 0)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(70))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count == 20 then
        call Effect("war3mapimported\\sxcf2.mdx", GetUnitX(c), GetUnitY(c) , 30, randomAngle() , 0, 0, 5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        loop
            exitwhen i > 5
            set x = PolarX(GetUnitX(c), 300, i * 60)
            set y = PolarY(GetUnitY(c), 300, i * 60)
            call Effect("war3mapimported\\[A]WhiteSlash.mdx", x, y, 25, i * 60 , 0, 0, 1.2, 1, PercentTo255(85), 255, 255, PercentTo255(90))
            call Effect("war3mapimported\\ogitasoji.mdx", x, y, 0, i * 60 , 0, 0, 1, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, GetHandleId(z), 2 + i, bj_lastCreatedEffect)
            set i = i + 1
        endloop
    endif
    if count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then
        call SoundStart("war3mapImported\\Ogita_4-1.mp3")
    endif
    if count >= 30 and count <= 70 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 600, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, (6 + 2 * GetUnitAbilityLevel(c, 'A0GG')) * GetHeroAgi(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        loop
            exitwhen i > 5
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            if iterator == 3 or iterator == 6 then
                set x = PolarX(GetUnitX(c), GetRandomReal(50, 600), randomAngle())
                set y = PolarY(GetUnitY(c), GetRandomReal(50, 600), randomAngle())
                call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y , GetRandomReal(100, 350), randomAngle() , 0, 0, GetRandomReal(2, 3.5), 1.5, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
            if iterator >= 6 then
                call SetSpecialEffectAnimationByIndex(e, GetRandomInt(11, 13))
            endif
            set i = i + 1
        endloop
        if iterator >= 6 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count == 70 then
        call SetUnitFlyHeight(c, 0, 0)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
endfunction

function Trig_OgitaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    if GetSpellAbilityId() == 'A0GG' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_OgitaR_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_OgitaR takes nothing returns nothing
    set gg_trg_OgitaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_OgitaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_OgitaR, function Trig_OgitaR_Actions)
endfunction