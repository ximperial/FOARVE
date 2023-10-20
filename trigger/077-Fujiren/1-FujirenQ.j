//TESH.scrollpos=33
//TESH.alwaysfold=0
function Trig_FujirenQ_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local real x
    local real y
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Fujiren_1.mp3")
        call SoundStart("war3mapImported\\Fujiren_1-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 7)
        call SetUnitTimeScale(c, 1.25)
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Fujiren_1-2.mp3")
    endif
    if count <= 15 then
        set x = PolarX(GetUnitX(c) , 80, a)
        set y = PolarY(GetUnitY(c) , 80, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0FV'))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call Effect("war3mapImported\\az_luanzhan_b.mdx", GetUnitX(c) , GetUnitY(c) , 150, a , - 90, 0, 1, 1, 255, 0, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
    endif
    if count == 15 then
        call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 1.3, 1, 255, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\zxd3.mdx", GetUnitX(c) , GetUnitY(c) , 25, a , 0, 0, 3.5, 1, 255, 0, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(c) , GetUnitY(c) , 50, a , 0, 0, 1.3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapImported\\kdls3.mdx", GetUnitX(c) , GetUnitY(c) , 300, a , 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
endfunction

function Trig_FujirenQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0FV' then
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_FujirenQ_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_FujirenQ takes nothing returns nothing
    set gg_trg_FujirenQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_FujirenQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_FujirenQ, function Trig_FujirenQ_Actions)
endfunction