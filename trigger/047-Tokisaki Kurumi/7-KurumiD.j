//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_KurumiD_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z) , 0)
    local integer count = LoadInteger(ht, GetHandleId(z) , 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
    local real x = LoadReal(ht, GetHandleId(z) , 0)
    local real y = LoadReal(ht, GetHandleId(z) , 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c) , GetUnitY(c) , x, y)
    local real a2
    local integer i = 0
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z) , 0, count)
    if count == 1 then
        call SoundStart("war3mapImported\\Kurumi_7.mp3")
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(c), GetUnitY(c))
        call Effect("war3mapImported\\Black.mdl", x, y, 25, a, 0, 0, 1, 2.2, 255, 255, 255, PercentTo255(30))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        set x1 = PolarX(x, 600, a + 60)
        set y1 = PolarY(y, 600, a + 60)
        set a2 = Angle(x1, y1, x, y)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x1, y1, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x1, y1, 0, a2, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
        set x1 = PolarX(x, 600, a + 120)
        set y1 = PolarY(y, 600, a + 120)
        set a2 = Angle(x1, y1, x, y)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x1, y1, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x1, y1, 0, a2, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
        set x1 = PolarX(x, 600, a)
        set y1 = PolarY(y, 600, a)
        set a2 = Angle(x1, y1, x, y)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x1, y1, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x1, y1, 0, a2, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
        set x1 = PolarX(x, 600, a + 240)
        set y1 = PolarY(y, 600, a + 240)
        set a2 = Angle(x1, y1, x, y)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x1, y1, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x1, y1, 0, a2, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
        set x1 = PolarX(x, 600, a + 300)
        set y1 = PolarY(y, 600, a + 300)
        set a2 = Angle(x1, y1, x, y)
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x1, y1, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x1, y1, 0, a2, 0, 0, 1, 2.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
    endif
    if count == 5 or count == 20 or count == 35 or count == 50 or count == 65 or count == 80 or count == 95 then
        call SoundStart("war3mapImported\\Kurumi_7-1.mp3")
    endif
    if count <= 100 then
        call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
        loop 
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(c, gUnit) then 
                call DamageUnit(c, gUnit, 8 * GetHeroAgi(c, true) / 100)
                if count >= 10 then
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endif 
        endloop
        call GroupClear(gGroup)
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z) , 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            set x1 = PolarX(x, GetRandomReal(- 400, 400), randomAngle())
            set y1 = PolarY(y, GetRandomReal(- 400, 400), randomAngle())
            call Effect("war3mapImported\\[a]bloodex.mdx", x1, y1, GetRandomReal(25, 100), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\QQQQQR.mdx", x1, y1, GetRandomReal(25, 100), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
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

function Trig_KurumiD_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A02Z' then 
        set z = CreateTimer()
        call SaveUnitHandle(ht, GetHandleId(z) , 0, c)
        call SaveInteger(ht, GetHandleId(z) , 0, 0)
        call SaveInteger(ht, GetHandleId(z) , 1, 0)
        call SaveReal(ht, GetHandleId(z) , 0, x)
        call SaveReal(ht, GetHandleId(z) , 1, y)
        call TimerStart(z, 0.02, true, function Trig_KurumiD_Func001)
    endif
    set z = null
    set c = null
endfunction

//===========================================================================
function InitTrig_KurumiD takes nothing returns nothing
    set gg_trg_KurumiD = CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KurumiD, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction(gg_trg_KurumiD, function Trig_KurumiD_Actions)
endfunction