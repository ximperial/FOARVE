//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_MonkeQ_Func001 takes nothing returns nothing
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
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Monke_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 12)
        call Effect("war3mapimported\\blackblink1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c) , GetUnitY(c) , 100, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count == 10 then
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call Effect("war3mapimported\\File00001833.mdx", GetUnitX(c) , GetUnitY(c) , 200, a, 0, 0, 4, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\az_slb.mdx", GetUnitX(c) , GetUnitY(c) , 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(c) , GetUnitY(c) , 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A085'))
            endif 
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_MonkeQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A085' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_MonkeQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_MonkeQ takes nothing returns nothing
    set gg_trg_MonkeQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MonkeQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_MonkeQ, function Trig_MonkeQ_Actions)
endfunction