//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_JellalQ_Func001 takes nothing returns nothing
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
    if count == 1 then
        call SoundStart("war3mapImported\\Jellal_1.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call SetUnitTimeScale(c, 2)
    endif
    if count == 10 then
        loop
            exitwhen i > 6
            set x1 = x + 400 * Cos((i * 60) * bj_DEGTORAD)
            set y1 = y + 400 * Sin((i * 60) * bj_DEGTORAD)
            set a = Angle(x1, y1, x, y)
            call Effect("war3mapimported\\zygz.mdx", x1, y1, 60, a, - 40, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]BY_Wood_FenShenDaBaoPo_2.mdx", x1, y1, 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 100 * GetUnitAbilityLevel(c, 'A076'))
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

function Trig_JellalQ_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A076' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call TimerStart(z, 0.02, true, function Trig_JellalQ_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_JellalQ takes nothing returns nothing
    set gg_trg_JellalQ = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_JellalQ, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_JellalQ, function Trig_JellalQ_Actions )
endfunction