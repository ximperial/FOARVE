//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_AlibabaE_Func001 takes nothing returns nothing
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
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Alibaba_6-2.mp3")
        call SoundStart("war3mapImported\\Alibaba_3.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
    endif
    if count == 10 then 
        if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
            call SetUnitX(c, x)
            call SetUnitY(c, y)
        endif
        loop
            exitwhen i > 11
            set x = GetUnitX(c) + 400 * Cos((i * 30) * bj_DEGTORAD)
            set y = GetUnitY(c) + 400 * Sin((i * 30) * bj_DEGTORAD)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdx", x, y, 25, i * 30, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(75))
            call SetUnitTimeScale(bj_lastCreatedUnit, .3)
            set i = i + 1
        endloop
        call Effect("war3mapimported\\shuozhu2.mdx", GetUnitX(c) , GetUnitY(c) , 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\AlibabaMagicCircle.mdx", GetUnitX(c) , GetUnitY(c) , 150, a, 0, 0, 5.5, 1, 255, 255, 255, 255)
        call GroupEnumUnitsInRange(gGroup, GetUnitX(c) , GetUnitY(c) , 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, (1 + 0.5 * GetUnitAbilityLevel(c, 'A045')) * GetHeroAgi(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
endfunction

function Trig_AlibabaE_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A045' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_AlibabaE_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_AlibabaE takes nothing returns nothing
    set gg_trg_AlibabaE = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_AlibabaE, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_AlibabaE, function Trig_AlibabaE_Actions)
endfunction