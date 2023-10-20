scope yaraispell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_1-1.mp3")
            call SoundStart("war3mapImported\\Miu_1-2.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0GK'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 50, a, 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapImported\\26.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set e = null
    endfunction

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 45 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_2-1.mp3")
            call SoundStart("war3mapImported\\Miu_2-2.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Miu_1-2.mp3")
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SaveReal(ht, zid, 0, a)
        endif
        if count >= 10 and count <= 40 then 
            set a = LoadReal(ht, zid, 0)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), - 100, a)
                set y = PolarY(GetUnitY(t), - 100, a)
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
        endif
        if count == 40 then
            call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 45 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0GL')) * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            if not HaveSavedBoolean(ht, StringHash("MiuW"), GetHandleId(u)) then
                call SaveBoolean(ht, StringHash("MiuW"), GetHandleId(u), true)
                call StartAbilityCooldown(GetUnitAbility(u, 'A0GL'), 0)
            endif
            if not HaveSavedHandle(ht, StringHash("MiuR"), GetHandleId(u)) and IsUnitAlive(t) then
                call SaveUnitHandle(ht, StringHash("MiuR"), GetHandleId(u), t)
                call DisableAbilityEx(u, 'A0GN', true)
                call EnableAbilityEx(u, 'A0I2', true)
            endif
        endif
        if count == 220 then
            if HaveSavedHandle(ht, StringHash("MiuR"), GetHandleId(u)) then
                call DisableAbilityEx(u, 'A0I2', true)
                call EnableAbilityEx(u, 'A0GN', true)
                call RemoveSavedHandle(ht, StringHash("MiuR"), GetHandleId(u))
            endif
            if LoadBoolean(ht, StringHash("MiuW"), GetHandleId(u)) then
                call StartAbilityCooldown(GetUnitAbility(u, 'A0GL'), GetAbilityCooldown(GetUnitAbility(u, 'A0GL')))
                call RemoveSavedBoolean(ht, StringHash("MiuW"), GetHandleId(u))
            endif
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_2.mp3")
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count <= 15 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(t), dist / 10, a + 180)
                set y = PolarY(GetUnitY(t), dist / 10, a + 180)
                call SetUnitXY(t, x, y, 0)
            else
                set x = PolarX(GetUnitX(u), 120, a)
                set y = PolarY(GetUnitY(u), 120, a)
                call SetUnitXY(t, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 20 then 
            call StartAbilityCooldown(GetUnitAbility(u, 'A0GL'), GetAbilityCooldown(GetUnitAbility(u, 'A0GL')))
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0GL')) * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2
        local effect e
        local integer i
        local integer j

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_4-2.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call VisionArea(GetOwningPlayer(u), 1500, 3, x, y)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set x2 = PolarX(x, 600, a + 315)
            set y2 = PolarY(y, 600, a + 315)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            set x2 = PolarX(x, 600, a + 225)
            set y2 = PolarY(y, 600, a + 225)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            set x2 = PolarX(x, 600, a + 135)
            set y2 = PolarY(y, 600, a + 135)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            set x2 = PolarX(x, 600, a + 45)
            set y2 = PolarY(y, 600, a + 45)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x2, y2, 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
            call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            set i = 0
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call Effect("war3mapImported\\Ethereal Lightning.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                set i = i + 1
            endloop
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Miu_1-2.mp3")
            set i = 0
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set j = 0
                loop
                    exitwhen j > 7
                    call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetEffectX(e), GetEffectY(e), 50 + 150 * j, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                    set j = j + 1
                endloop
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                        call DamageUnit(u, gUnit, (3 + GetUnitAbilityLevel(u, 'A0GN')) * GetHeroInt(u, true))
                        call GroupAddUnit(g, gUnit)
                    endif 
                endloop
                call GroupClear(gGroup)
                set i = i + 1 
            endloop
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
        set g = null
        set e = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real x2
        local real y2
        local real a2
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_4-3.mp3")
            call SetUnitAnimationByIndex(u, 5)
            set x = PolarX(GetUnitX(t), 800, a + 45)
            set y = PolarY(GetUnitY(t), 800, a + 45)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
            set x2 = PolarX(x, - 100, a2)
            set y2 = PolarY(y, - 100, a2)
            set a2 = Angle(x2, y2, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 100, a2)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x2, y2, 100, a2, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 800, a + 135)
            set y = PolarY(GetUnitY(t), 800, a + 135)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
            set x2 = PolarX(x, - 100, a2)
            set y2 = PolarY(y, - 100, a2)
            set a2 = Angle(x2, y2, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 101, a2)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x2, y2, 100, a2, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 800, a + 225)
            set y = PolarY(GetUnitY(t), 800, a + 225)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
            set x2 = PolarX(x, - 100, a2)
            set y2 = PolarY(y, - 100, a2)
            set a2 = Angle(x2, y2, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 102, a2)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x2, y2, 100, a2, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(t), 800, a + 315)
            set y = PolarY(GetUnitY(t), 800, a + 315)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", x, y, 150, a2, - 90, 0, 1.5, 2, 255, 255, 255, 255)
            set x2 = PolarX(x, - 100, a2)
            set y2 = PolarY(y, - 100, a2)
            set a2 = Angle(x2, y2, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 103, a2)
            call Effect("war3mapImported\\AZ_Slark_D2.mdx", x2, y2, 100, a2, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 10 or count == 20 then
            call SoundStart("war3mapImported\\Miu_4-1.mp3")
        endif
        if count <= 30 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            set i = 0
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set a2 = LoadReal(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e), 25, a2)
                set y = PolarY(GetEffectY(e), 25, a2)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
                if iterator >= 5 then
                    set x2 = PolarX(x, - 100, a2)
                    set y2 = PolarY(y, - 100, a2)
                    call Effect("war3mapImported\\AZ_Slark_D2.mdx", x2, y2, 100, a2, - 90, 0, 2.5, 1, 255, 255, 255, 255)
                endif
                set i = i + 1
            endloop
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
            endif
        endif
        if count == 30 then
            call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 40 then 
            call DisableAbilityEx(u, 'A0I2', true)
            call EnableAbilityEx(u, 'A0GN', true)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (3 + GetUnitAbilityLevel(u, 'A0I2')) * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 60 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_5.mp3")
            set x = PolarX(GetUnitX(t), - 600, a)
            set y = PolarY(GetUnitY(t), - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 0.65)
        endif
        if count <= 50 then
            set x = PolarX(GetUnitX(u), 10, a)
            set y = PolarY(GetUnitY(u), 10, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.9, 1.15), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.2), 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
            endif
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Miu_1-2.mp3")
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call SaveReal(ht, zid, 0, a)
        endif
        if count >= 60 and count <= 100 then
            set a = LoadReal(ht, zid, 0)
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), - 100, a)
                set y = PolarY(GetUnitY(t), - 100, a)
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", x, y, 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
        endif
        if count == 100 then 
            call SoundStart("war3mapImported\\Miu_4-1.mp3")
            call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real a2
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_6.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\flames&smoke.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 10, 255, 255, 255, 255)
        endif
        if count == 10 or count == 15 or count == 20 or count == 25 or count == 30 or count == 35 or count == 40 or count == 45 or count == 50 or count == 55 or count == 60 or count == 65 or count == 70 or count == 75 or count == 80 or count == 85 or count == 90 or count == 95 or count == 100 then
            set i = LoadInteger(ht, zid, 10)
            set x = PolarX(GetUnitX(t), 800, i * 20)
            set y = PolarY(GetUnitY(t), 800, i * 20)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\flames&smoke.mdx", x, y, 0, a2, 0, 0, 1, 10.2 - count * 0.02, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
            call SaveEffectHandle(ht, zid, 100 + i, bj_lastCreatedEffect)
            call SaveInteger(ht, zid, 10, i + 1)
        endif
        if count >= 290 and count <= 490 then
            set i = 0
            loop
                exitwhen i > LoadInteger(ht, zid, 10) - 1
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set a = GetSpecialEffectYaw(e)
                set x = PolarX(GetEffectX(e), 4, a)
                set y = PolarY(GetEffectY(e), 4, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                set i = i + 1
            endloop
        endif
        if count == 490 then
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 500 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period8 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real h
        local real a2
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Miu_7.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 6, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 700, a)
            set y = PolarY(GetUnitY(t), - 700, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 then
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), 700, a2)
            set y = PolarY(GetUnitY(t), 700, a2)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 20 or count >= 30 and count <= 50 or count >= 60 and count <= 80 or count >= 90 and count <= 110 or count >= 120 and count <= 140 then
            set e = LoadEffectHandle(ht, zid, 100)
            set a2 = GetSpecialEffectYaw(e)
            set x = PolarX(GetEffectX(e), 35, a2)
            set y = PolarY(GetEffectY(e), 35, a2)
            call SetEffectXY(e, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, GetRandomReal(1.4, 2.25), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 20 or count == 50 or count == 80 or count == 110 or count == 140 then
            call SoundStart("war3mapImported\\Miu_4-1.mp3")
            call Effect("war3mapImported\\26.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif
        if count == 150 then
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), 820, a2)
            set y = PolarY(GetUnitY(t), 820, a2)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count >= 200 and count <= 250 then
            set x = PolarX(GetUnitX(u), 14, a)
            set y = PolarY(GetUnitY(u), 14, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 250 then
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count == 280 then
            call SoundStart("war3mapImported\\Miu_1-2.mp3")
            call Effect("war3mapImported\\AZ_LCDark_W1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Ethereal Lightning.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 300 then
            set i = 0
            loop
                exitwhen i > 7
                call Effect("war3mapImported\\AZ_Slark_D2.mdx", GetUnitX(t), GetUnitY(t), 50 + 150 * i, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set i = i + 1
            endloop
        endif
        if count == 310 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroInt(u, true))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0GK' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0GL' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if LoadBoolean(ht, StringHash("MiuW"), GetHandleId(u)) then
                call RemoveSavedBoolean(ht, StringHash("MiuW"), GetHandleId(u))
                call TimerStart(z, 0.02, true, function period3)
            else
                call TimerStart(z, 0.02, true, function period2)
            endif
        endif

        if abilId == 'A0GN' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0I2' then
            set z = CreateTimer()
            set t = LoadUnitHandle(ht, StringHash("MiuR"), GetHandleId(u))
            call RemoveSavedHandle(ht, StringHash("MiuR"), GetHandleId(u))
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0GO' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0GP' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period7)
        endif

        if abilId == 'A0GQ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period8)
        endif
        
        set z = null
        set u = null
        set t = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope