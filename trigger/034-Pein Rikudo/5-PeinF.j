//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_PeinF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local real a = LoadReal(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x
    local real y
    local effect e = LoadEffectHandle(ht, GetHandleId(z) , 2)
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Pain_6.mp3")
        call SoundStart("war3mapImported\\Pain_6-1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapImported\\peincsdniao.mdx", GetUnitX(c) , GetUnitY(c) , 300, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z) , 2, bj_lastCreatedEffect)
        set e = bj_lastCreatedEffect
    endif
    if count <= 100 then
        set x = PolarX(GetEffectX(e) , 30, a)
        set y = PolarY(GetEffectY(e) , 30, a)
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then 
            call SetEffectX(e, x)
            call SetEffectY(e, y)
        endif
        call VisionArea(GetOwningPlayer(c), 800, 2, GetEffectX(e) , GetEffectY(e))
        call GroupEnumUnitsInRange(gGroup, GetEffectX(e) , GetEffectY(e) , 350, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then
                call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true))
                call GroupAddUnit(g, gUnit)
            endif
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 4 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(GetEffectX(e), GetRandomReal(-150, 150), randomAngle())
            set y = PolarY(GetEffectY(e), GetRandomReal(-150, 150), randomAngle())
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Elp_XiaoQiDan_BaoZha_1.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(2, 4), 1, 255, 255, 255, 255)
            set x = PolarX(GetEffectX(e), GetRandomReal(-150, 150), randomAngle())
            set y = PolarY(GetEffectY(e), GetRandomReal(-150, 150), randomAngle())
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Elp_XiaoQiDan_BaoZha_1.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(2, 4), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 100 then
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set e = null
    set g = null
endfunction

function Trig_PeinF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , GetSpellTargetX() , GetSpellTargetY())
    if GetSpellAbilityId() == 'A0E9' then
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveReal(ht, GetHandleId(z) , 0, a)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_PeinF_Func001)
    endif
    set z = null
    set c = null
endfunction
    
//===========================================================================
function InitTrig_PeinF takes nothing returns nothing
    set gg_trg_PeinF = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_PeinF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_PeinF, function Trig_PeinF_Actions)
endfunction