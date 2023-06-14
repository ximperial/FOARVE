//TESH.scrollpos=51
//TESH.alwaysfold=0
function Trig_SaboF_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Sabo_6.mp3")
        call SetUnitAnimationByIndex(c, 5)
    endif
    if count == 30 then 
        call SoundStart("war3mapImported\\Sabo_6-1.mp3")
        call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", x, y, 25, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", x, y, 25, a, 0, 0, 4, 1.5, 255, 255, 255, 255)
        loop
            exitwhen i > 11
            set x1 = x + GetRandomReal(- 600, 600) * Cos(randomAngle() * bj_DEGTORAD)
            set y1 = y + GetRandomReal(- 600, 600) * Sin(randomAngle() * bj_DEGTORAD)
            call Effect("war3mapimported\\fireleaf.mdx", x1, y1, 75, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\firebbic.mdx", x1, y1, 75, a, 0, 0, 2, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 11 * GetHeroStr(c, true))
            endif 
        endloop
        call GroupClear(gGroup)
        call VisionArea(GetOwningPlayer(c), 1200, 3, x, y)
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

function Trig_SaboF_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A07W' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_SaboF_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_SaboF takes nothing returns nothing
    set gg_trg_SaboF = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_SaboF, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_SaboF, function Trig_SaboF_Actions )
endfunction