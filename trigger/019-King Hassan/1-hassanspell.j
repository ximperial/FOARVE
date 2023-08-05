scope hassanspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local effect e

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call SoundStart("war3mapImported\\Hassan_1.mp3")
            call SoundStart("war3mapImported\\Hassan_1-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A07G'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\shunyihuoyan.mdl", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(80))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Hassan_2.mp3")
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Hassan_2-1.mp3")
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\huoyantuci.mdl", GetUnitX(t), GetUnitY(t), 50, a + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\shunyihuoyan.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 25 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A09X')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 2, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            call SoundStart("war3mapImported\\Hassan_3.mp3")
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\huoyantuci.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\shunyihuoyan.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A09Y')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hassan_4.mp3")
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitAnimationByIndex(u, 9)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 600, 0)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(50))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call SetUnitFlyHeight(u, 0, 1500)
        endif
        if count == 30 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SoundStart("war3mapImported\\Hassan_4-1.mp3")
            call Effect("war3mapImported\\huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(t), 300, i * 60)
                set y = PolarY(GetUnitY(t), 300, i * 60)
                call Effect("war3mapImported\\huozhu.mdl", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 50 then
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(t), 500, i * 60)
                set y = PolarY(GetUnitY(t), 500, i * 60)
                call Effect("war3mapImported\\huozhu.mdl", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 60 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A09Z')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Hassan_5.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 2, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\KHFIRE3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\KHFIRE3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 101, bj_lastCreatedEffect)
        endif
        if count <= 200 then
            set x = PolarX(GetUnitX(u), 4, a)
            set y = PolarY(GetUnitY(u), 4, a)
            call SetUnitXY(u, x, y, 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = GetUnitModelObjectPositionX(u, "bone_new30")
            set y = GetUnitModelObjectPositionY(u, "bone_new30")
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, GetHandleId(z), 101)
            set x = GetUnitModelObjectPositionX(u, "bone_new34")
            set y = GetUnitModelObjectPositionY(u, "bone_new34")
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
        endif
        if count == 200 then
            call ShakeCamera(3, GetOwningPlayer(u), 15)
            call ShakeCamera(3, GetOwningPlayer(t), 15)
            call SoundStart("war3mapImported\\Hassan_5-1.mp3")
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 210 then
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, - 270, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\lightcircle.mdl", GetUnitX(t), GetUnitY(t), 0, 270, 0, 0, 1.25, 4, 255, 255, 255, 255)
            call Effect("war3mapImported\\shunyihuoyan.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 4, 255, 255, 255, 255)
        endif
        if count == 230 then
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count == 240 or count == 290 then
            call Effect("war3mapImported\\effectother1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 380 then
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 400 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i
        local effect e
        local real aRandom

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
        if count == 1 then
            call ShakeCamera(7, GetOwningPlayer(u), 5)
            call ShakeCamera(7, GetOwningPlayer(t), 5)
            call SoundStart("war3mapImported\\Hassan_6-2.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimation(u, "attack")
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\KHFIRE3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\KHFIRE3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 101, bj_lastCreatedEffect)
        endif
        if count <= 390 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = GetUnitModelObjectPositionX(u, "bone_new30")
            set y = GetUnitModelObjectPositionY(u, "bone_new30")
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, GetHandleId(z), 101)
            set x = GetUnitModelObjectPositionX(u, "bone_new34")
            set y = GetUnitModelObjectPositionY(u, "bone_new34")
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
        endif
        if count <= 300 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set aRandom = GetRandomReal(- 15, 15)
                set x = PolarX(GetUnitX(t), - 120, a + aRandom)
                set y = PolarY(GetUnitY(t), - 120, a + aRandom)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
            endif
        endif
        if count == 300 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.85)
        endif
        if count >= 301 and count <= 341 then
            set x = PolarX(GetUnitX(u), - 10, a)
            set y = PolarY(GetUnitY(u), - 10, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count >= 342 and count <= 382 then
            set x = PolarX(GetUnitX(u), 10, a)
            set y = PolarY(GetUnitY(u), 10, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 or count == 50 or count == 90 or count == 130 or count == 170 or count == 200 or count == 240 or count == 280 then
            call SetUnitAnimation(u, "attack")
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, - 225, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 20 or count == 60 or count == 100 or count == 140 or count == 180 or count == 210 or count == 250 or count == 285 then
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 30 or count == 70 or count == 110 or count == 150 or count == 190 or count == 220 or count == 260 or count == 290 then
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, - 315, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 370 then
            call Effect("war3mapImported\\huoyantuci.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 390 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 400 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hassan_6.mp3")
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            call SoundStart("war3mapImported\\Hassan_6-1.mp3")
            call Effect("war3mapImported\\huoyandaoguang_1_1.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\jxpx.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\xjbz.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\huoyantuci.mdl", GetUnitX(t), GetUnitY(t), 50, a + 20, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
        endif
        if count >= 20 and count <= 50 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SoundStart("war3mapImported\\Hassan_4.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 60 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
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

        if abilId == 'A07G' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A09X' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A09Y' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A09Z' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0A0' then
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
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0A1' then
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

        if abilId == 'A0A2' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period7)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope