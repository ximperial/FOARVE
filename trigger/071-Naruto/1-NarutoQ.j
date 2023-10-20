//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_NarutoQ_Func001 takes nothing returns nothing
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
    local real dist
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    call PauseUnit(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Naruto_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 2)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3_2.mdx", GetUnitX(c) , GetUnitY(c) , 200, a, 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\RasenganImpact.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, 0, 0, 4, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        call SaveEffectHandle(ht, GetHandleId(z), 1, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(c) , GetUnitY(c) , x, y))
    endif
    if count <= 10 then
        set e = LoadEffectHandle(ht, GetHandleId(z), 1)
        set dist = LoadReal(ht, GetHandleId(z), 2)
        set x = PolarX(GetUnitX(c), dist / 10, a)
        set y = PolarY(GetUnitY(c), dist / 10, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        set x = PolarX(GetUnitX(c), 30, a)
        set y = PolarY(GetUnitY(c), 30, a) 
        call SetSpecialEffectPositionEx(e, x, y, 150 + GetAxisZ(x, y))
    endif
    if count == 10 then
        call SoundStart("war3mapImported\\Naruto_1-1.mp3")
        set e = LoadEffectHandle(ht, GetHandleId(z), 1)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(c) , GetUnitY(c) , 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call Effect("war3mapimported\\zxd1.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A0DD'))
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
    set e = null
endfunction

function Trig_NarutoQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0DD' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_NarutoQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_NarutoQ takes nothing returns nothing
    set gg_trg_NarutoQ = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_NarutoQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_NarutoQ, function Trig_NarutoQ_Actions)
endfunction