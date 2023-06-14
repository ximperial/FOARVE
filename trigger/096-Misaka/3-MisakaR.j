//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MisakaR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Misaka_4.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
    endif
    if count <= 100 then
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, ((6 + 2 * GetUnitAbilityLevel(c, 'A0EE')) * GetHeroInt(c, true)) / 100)
                if count > 10 then
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 8 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\Cyclone.mdx", x, y, 25, randomAngle() , 0, 0, GetRandomReal(1.2, 1.7) , 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\shadowtornado2.mdx", x, y, 25, randomAngle() , 0, 0, GetRandomReal(1.2, 1.7), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", x, y, 25, randomAngle() , 0, 0, GetRandomReal(0.65, 1), 1, 0, 0, 0, PercentTo255(50))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", x, y, 25, randomAngle() , 0, 0, GetRandomReal(1.65, 2), 1, 0, 0, 0, PercentTo255(50))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
    endif
    if count == 100 then
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_MisakaR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0EE' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_MisakaR_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MisakaR takes nothing returns nothing
    set gg_trg_MisakaR = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MisakaR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MisakaR, function Trig_MisakaR_Actions)
endfunction