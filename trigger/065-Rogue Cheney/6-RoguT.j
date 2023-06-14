//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_RoguT_Func001 takes nothing returns nothing
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
        call SoundStart("war3mapImported\\Rogue_5.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call SetUnitAnimationByIndex(c, 8)
        call Effect("war3mapimported\\brs 1.mdx", GetUnitX(c), GetUnitY(c), 40, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dead spirit by deckai3.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\dargonfoce.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\shadowdragonforce.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
    endif
    if count == 10 or count == 30 or count == 50 or count == 80 or count == 100 or count == 125 or count == 150 then
        call Effect("war3mapimported\\DTBlueNoRingBlend.mdx", x, y, 150, a, 0, 0, 4, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\DarkBlast.mdx", x, y, 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        call Effect("war3mapimported\\WRing.mdx", x, y, 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call Effect("war3mapimported\\62.mdx", x, y, 25, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count >= 10 and count <= 150 then
        call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 15 * GetHeroAgi(c, true) / 130)
                call IssueImmediateOrderById(gUnit, 851972)
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 3 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
            set y = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
            call Effect("war3mapimported\\bule-dark-salsh.mdx", x, y, GetRandomReal(50, 250), randomAngle(), 0, 0, GetRandomReal(0.3, 0.4), 1, 0, 0, 0, 255)
            set x = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
            set y = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
            call Effect("war3mapimported\\zhanji-pink-lizi.mdx", x, y, GetRandomReal(50, 250), randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
        endif
    endif
    if count == 150 then
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

function Trig_RoguT_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    local real x1 = GetUnitX(c)
    local real y1 = GetUnitY(c)
    if GetSpellAbilityId() == 'A0CP' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_RoguT_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_RoguT takes nothing returns nothing
    set gg_trg_RoguT = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_RoguT, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_RoguT, function Trig_RoguT_Actions)
endfunction