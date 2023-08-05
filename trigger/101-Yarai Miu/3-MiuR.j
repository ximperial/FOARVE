//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_MiuR_Func001 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x = LoadReal(ht, GetHandleId(z), 0)
    local real y = LoadReal(ht, GetHandleId(z), 1)
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), x, y)
    local real dist = Distance(GetUnitX(c), GetUnitY(c), x, y)
    local integer i = 0
    local integer i2 = 0
    local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Miu_4-2.mp3")
        call SetUnitAnimationByIndex(c, 8)
        call VisionArea(GetOwningPlayer(c), 600, 2, x, y)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 25, a, 0, 0, 1.3, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        if dist < 400 then
            set x1 = PolarX(x, 600, a + 72)
            set y1 = PolarY(y, 600, a + 72)
        else
            set x1 = PolarX(x, 600, a + 315)
            set y1 = PolarY(y, 600, a + 315)
        endif
        call VisionArea(GetOwningPlayer(c), 600, 2, x1, y1)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x1, y1, 25, a, 0, 0, 1.3, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        if dist < 400 then
            set x1 = PolarX(x, 600, a + 144)
            set y1 = PolarY(y, 600, a + 144)
        else
            set x1 = PolarX(x, 600, a + 225)
            set y1 = PolarY(y, 600, a + 225)
        endif
        call VisionArea(GetOwningPlayer(c), 600, 2, x1, y1)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x1, y1, 25, a, 0, 0, 1.3, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        if dist < 400 then
            set x1 = PolarX(x, 600, a + 216)
            set y1 = PolarY(y, 600, a + 216)
        else
            set x1 = PolarX(x, 600, a + 135)
            set y1 = PolarY(y, 600, a + 135)
        endif
        call VisionArea(GetOwningPlayer(c), 600, 2, x1, y1)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x1, y1, 25, a, 0, 0, 1.3, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        if dist < 400 then
            set x1 = PolarX(x, 600, a + 288)
            set y1 = PolarY(y, 600, a + 288)
        else
            set x1 = PolarX(x, 600, a + 45)
            set y1 = PolarY(y, 600, a + 45)
        endif
        call VisionArea(GetOwningPlayer(c), 600, 2, x1, y1)
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x1, y1, 25, a, 0, 0, 1.3, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        call SaveEffectHandle(ht, GetHandleId(z), 6, bj_lastCreatedEffect)
        call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
    endif
    if count == 20 then
        loop
            exitwhen i > 4
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            call Effect("war3mapImported\\Ethereal Lightning.mdl", GetEffectX(e), GetEffectY(e), 25, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set i = i + 1
        endloop
    endif
    if count == 30 then
        call SoundStart("war3mapImported\\Miu_1-2.mp3")
        loop
            exitwhen i > 4
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            loop
                exitwhen i2 > 7
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetEffectX(e), GetEffectY(e), 50 + 150 * i2, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                set i2 = i2 + 1
            endloop
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 350, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(c, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(c, gUnit, (4 + GetUnitAbilityLevel(c, 'A0GN')) * GetHeroInt(c, true))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set i = i + 1 
            set i2 = 0
        endloop
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call SetUnitInvulnerable(c, false)
        call IssueImmediateOrderById(c, 851972)
        call DestroyGroup(g)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set g = null
    set e = null
endfunction

function Trig_MiuR_Func002 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit c = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local integer count = LoadInteger(ht, GetHandleId(z), 0)
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local real x
    local real y
    local real x1
    local real y1
    local real a = Angle(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local real a2
    local real dist = Distance(GetUnitX(c), GetUnitY(c), GetUnitX(t), GetUnitY(t))
    local integer i = 0
    local effect e
    set count = count + 1
    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(c, true)
    call SetUnitInvulnerable(c, true)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Miu_4-3.mp3")
        call SetUnitAnimationByIndex(c, 5)
        set x = PolarX(GetUnitX(t), 800, a + 45)
        set y = PolarY(GetUnitY(t), 800, a + 45)
        call VisionArea(GetOwningPlayer(c), 600, 2, x, y)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        set x1 = PolarX(x, - 100, a2)
        set y1 = PolarY(y, - 100, a2)
        set a2 = Angle(x1, y1, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x1, y1, 100, a2, - 90, 0, 2.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 2, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), GetHandleId(bj_lastCreatedEffect), a2)

        set x = PolarX(GetUnitX(t), 800, a + 135)
        set y = PolarY(GetUnitY(t), 800, a + 135)
        call VisionArea(GetOwningPlayer(c), 600, 2, x, y)
        set a2 = Angle(x1, y1, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        set x1 = PolarX(x, - 100, a2)
        set y1 = PolarY(y, - 100, a2)
        set a2 = Angle(x1, y1, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x1, y1, 100, a2, - 90, 0, 2.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 3, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), GetHandleId(bj_lastCreatedEffect), a2)

        set x = PolarX(GetUnitX(t), 800, a + 225)
        set y = PolarY(GetUnitY(t), 800, a + 225)
        call VisionArea(GetOwningPlayer(c), 600, 2, x, y)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        set x1 = PolarX(x, - 100, a2)
        set y1 = PolarY(y, - 100, a2)
        set a2 = Angle(x1, y1, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x1, y1, 100, a2, - 90, 0, 2.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 4, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), GetHandleId(bj_lastCreatedEffect), a2)

        set x = PolarX(GetUnitX(t), 800, a + 315)
        set y = PolarY(GetUnitY(t), 800, a + 315)
        call VisionArea(GetOwningPlayer(c), 600, 2, x, y)
        set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        set x1 = PolarX(x, - 100, a2)
        set y1 = PolarY(y, - 100, a2)
        set a2 = Angle(x1, y1, GetUnitX(t), GetUnitY(t))
        call Effect("war3mapImported\\AZ_Slark_D2.mdx", x1, y1, 100, a2, - 90, 0, 2.3, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, GetHandleId(z), 5, bj_lastCreatedEffect)
        call SaveReal(ht, GetHandleId(z), GetHandleId(bj_lastCreatedEffect), a2)

        call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(c), GetUnitY(c), 25, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
    endif
    if count == 10 or count == 20 then
        call SoundStart("war3mapImported\\Miu_4-1.mp3")
    endif
    if count <= 30 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        loop
            exitwhen i > 3
            set e = LoadEffectHandle(ht, GetHandleId(z), 2 + i)
            set a2 = LoadReal(ht, GetHandleId(z), GetHandleId(e))
            set x = PolarX(GetEffectX(e), 25, a2)
            set y = PolarY(GetEffectY(e), 25, a2)
            call SetEffectX(e, x)
            call SetEffectY(e, y)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            if iterator >= 5 then
                set x1 = PolarX(x, - 100, a2)
                set y1 = PolarY(y, - 100, a2)
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", x1, y1, 100, a2, - 90, 0, 2.3, 1, 255, 255, 255, 255)
            endif
            set i = i + 1
        endloop
        if iterator >= 5 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
    endif
    if count == 30 then
        call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
    endif
    if count == 40 then 
        call SetUnitTimeScale(c, 1)
        call PauseUnit(c, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(c, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(c, t, (4 + GetUnitAbilityLevel(c, 'A0I2')) * GetHeroInt(c, true))
        call VisionArea(GetOwningPlayer(c), 1200, 3, GetUnitX(t), GetUnitY(t))
        call IssueTargetOrderById(c, 851983, t)
        call IssueImmediateOrderById(t, 851972)
        call FlushChildHashtable(ht, GetHandleId(z))
        call PauseTimer(z)
        call DestroyTimer(z)
    endif
    set z = null
    set c = null
    set t = null
    set e = null
endfunction

function Trig_MiuR_Actions takes nothing returns nothing
    local timer z
    local unit c = GetTriggerUnit()
    local unit t = GetSpellTargetUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
    if GetSpellAbilityId() == 'A0GN' then 
        set z = CreateTimer()
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, x)
        call SaveReal(ht, GetHandleId(z), 1, y)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function Trig_MiuR_Func001)
    endif
    if GetSpellAbilityId() == 'A0I2' then 
        set z = CreateTimer()
        set t = LoadUnitHandle(ht, MiuRHash, GetHandleId(c))
        call DisableAbility(GetUnitAbility(c, 'A0I2'), true, true)
        call EnableAbility(GetUnitAbility(c, 'A0GN'), true, true)
        call RemoveSavedHandle(ht, MiuRHash, GetHandleId(c))
        if LoadBoolean(ht, MiuWHash, GetHandleId(c)) then
            call StartAbilityCooldown(GetUnitAbility(c, 'A0GL'), GetAbilityCooldown(GetUnitAbility(c, 'A0GL')))
            call RemoveSavedBoolean(ht, MiuWHash, GetHandleId(c))
        endif
        call PauseUnit(c, true)
        call SetUnitInvulnerable(c, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, c)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function Trig_MiuR_Func002)
    endif
    set z = null
    set c = null
    set t = null
endfunction

//===========================================================================
function InitTrig_MiuR takes nothing returns nothing
    set gg_trg_MiuR = CreateTrigger(  )
    call TriggerRegisterAnyUnitEventBJ(gg_trg_MiuR, EVENT_PLAYER_UNIT_SPELL_EFFECT)
    call TriggerAddAction( gg_trg_MiuR, function Trig_MiuR_Actions )
endfunction