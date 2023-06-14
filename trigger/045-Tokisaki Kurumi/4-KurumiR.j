//TESH.scrollpos=72
//TESH.alwaysfold=0
function Trig_KurumiR_Func003 takes nothing returns nothing
    call SetUnitTimeScale(GetEnumUnit(), 1)
    call PauseUnit(GetEnumUnit(), false)
endfunction

function Trig_KurumiR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real a2
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 2)
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Kurumi_4.mp3")
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call SaveUnitHandle(ht, GetHandleId(z), 3, CreateUnit(Player(12), 'H00D', GetUnitX(c), GetUnitY(c), 0))
        call SetUnitX(c, PolarX(GetUnitX(t), - 600, a))
        call SetUnitY(c, PolarY(GetUnitY(t), - 600, a))
        call SetUnitAnimationByIndex(c, 6)
        call SetUnitTimeScale(c, 1.2)
        call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(c), GetUnitY(c), 25, a, 0, 0, 2, 8.6, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
    endif
    if count == 100 then
        call SoundStart("war3mapImported\\Kurumi_4-1.mp3")
        call Effect("war3mapImported\\Kurumi Field.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2.35, 6.6, 255, 255, 255, 255)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 10.6, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
    endif
    if count >= 100 and count <= 430 then
        call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 900, null)
        call GroupRemoveUnit(gGroup, c)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                call PauseUnit(gUnit, true)
                if not IsUnitInGroup(gUnit, g) then
                    call SetUnitTimeScale(gUnit, 0)
                    call GroupAddUnit(g, gUnit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
    endif
    if count == 180 then
        set x = PolarX(GetUnitX(t), 400, a + 60)
        set y = PolarY(GetUnitY(t), 400, a + 60)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call AnimEffect(bj_lastCreatedEffect, 8, 2)
        set x = PolarX(GetUnitX(t), 400, a + 120)
        set y = PolarY(GetUnitY(t), 400, a + 120)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call AnimEffect(bj_lastCreatedEffect, 8, 2)
        set x = PolarX(GetUnitX(t), 400, a)
        set y = PolarY(GetUnitY(t), 400, a)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call AnimEffect(bj_lastCreatedEffect, 8, 2)
        set x = PolarX(GetUnitX(t), 400, a + 240)
        set y = PolarY(GetUnitY(t), 400, a + 240)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call AnimEffect(bj_lastCreatedEffect, 8, 2)
        set x = PolarX(GetUnitX(t), 400, a + 300)
        set y = PolarY(GetUnitY(t), 400, a + 300)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call AnimEffect(bj_lastCreatedEffect, 8, 2)
    endif
    if count >= 280 and count <= 430 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
            set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
            call Effect("war3mapImported\\[a]bloodex.mdx", x, y, GetRandomReal(25, 100), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\QQQQQR.mdx", x, y, GetRandomReal(25, 100), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
    endif
    if count == 430 then
        call ForGroup(g, function Trig_KurumiR_Func003)
        call DestroyGroup(g)
        set x = PolarX(GetUnitX(t), 400, a + 60)
        set y = PolarY(GetUnitY(t), 400, a + 60)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a + 120)
        set y = PolarY(GetUnitY(t), 400, a + 120)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a)
        set y = PolarY(GetUnitY(t), 400, a)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a + 240)
        set y = PolarY(GetUnitY(t), 400, a + 240)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        set x = PolarX(GetUnitX(t), 400, a + 300)
        set y = PolarY(GetUnitY(t), 400, a + 300)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 25, a2, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count >= 430 and count <= 470 then
        call SetUnitX(c, PolarX(GetUnitX(c), 10, a))
        call SetUnitY(c, PolarY(GetUnitY(c), 10, a))
    endif
    if count == 470 then
        call CinematicFilterGenericEx(GetOwningPlayer(c), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir2.tga", 255, 255, 255, 0, 255, 255, 255, PercentTo255(90))
        call SetUnitAnimationByIndex(c, 4)
        call SetUnitTimeScale(c, 0.5)
    endif
    if count == 510 then
        call SetUnitTimeScale(c, 0)
    endif
    if count == 520 then
        call SoundStart("war3mapImported\\Kurumi_4-2.mp3")
    endif
    if count == 620 then
        call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 40, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
    endif
    if count == 630 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (6 + 2 * GetUnitAbilityLevel(c, 'A02D')) * GetHeroAgi(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call RemoveUnit(LoadUnitHandle(ht, GetHandleId(z), 3))
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set g = null
endfunction

function Trig_KurumiR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    if GetSpellAbilityId() == 'A02D' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function Trig_KurumiR_Func001)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_KurumiR takes nothing returns nothing
    set gg_trg_KurumiR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_KurumiR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_KurumiR, function Trig_KurumiR_Actions )
endfunction