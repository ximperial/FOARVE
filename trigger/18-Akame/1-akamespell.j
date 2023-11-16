scope akamespell initializer init
   
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Akame_1.mp3")
            call SoundStart("war3mapImported\\Akame_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1.75)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Akame_1-2.mp3")
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u), 80, a)
            set y = PolarY(GetUnitY(u), 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroAgi(u, true) + 90 * GetUnitAbilityLevel(u, 'A0FO'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z) , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                set x = PolarX(GetUnitX(u), - 50, a)
                set y = PolarY(GetUnitY(u), - 50, a)
                call Effect("war3mapImported\\dtred.mdx", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Akame_2.mp3")
            call SoundStart("war3mapImported\\Akame_2-1.mp3")
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            set i = 1
            loop
                exitwhen i > 4
                set x = PolarX(GetUnitX(t), GetRandomReal(- 150, 150), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 150, 150), randomAngle())
                call Effect("war3mapimported\\DGDDXZ4.mdx", x, y, 200, randomAngle(), GetRandomReal(- 60, - 45), 0, GetRandomReal(0.7, 1.2), 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 150, 150), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 150, 150), randomAngle())
                call Effect("war3mapimported\\bloodhit1.mdx", x, y, GetRandomReal(150, 300), randomAngle(), GetRandomReal(- 60, - 45), 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255) 
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set i = i + 1
            endloop
        endif
        if count == 30 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0FP')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real a2
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Akame_3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set x = PolarX(GetUnitX(u), 500, a)
            set y = PolarY(GetUnitY(u), 500, a)
            call Effect("war3mapimported\\Black.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            set x = PolarX(GetUnitX(u), 1200, a)
            set y = PolarY(GetUnitY(u), 1200, a)
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLYABILITY) then
                call SetUnitXY(u, x, y, 0)
                set a = a + 180
                call SaveReal(ht, GetHandleId(z), 0, a)
            endif
            call SetUnitAnimationByIndex(u, 10)
            call SaveReal(ht, GetHandleId(z), 1, 25)
        endif
        if count == 2 or count == 7 or count == 12 or count == 17 then
            set a2 = a + LoadReal(ht, GetHandleId(z), 1)
            call Effect("war3mapimported\\akamerdash.mdx", GetUnitX(u), GetUnitY(u), 100, a2, 0, 0, 0.6, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(u), GetUnitY(u), 0, a2, 0, 0, 0.9, 1, 255, 255, 255, 255)
        endif
        if count == 5 or count == 10 or count == 15 then
            call SaveReal(ht, GetHandleId(z), 1, - LoadReal(ht, GetHandleId(z), 1))
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Akame_3-1.mp3")
        endif
        if count <= 20 then
            set a2 = a + LoadReal(ht, GetHandleId(z), 1)
            set x = PolarX(GetUnitX(u), 70, a2)
            set y = PolarY(GetUnitY(u), 70, a2)
            call SetUnitXY(u, x, y, 1)
            call SetUnitFacingEx(u, a2, true)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0FQ')) * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\TZJQ5.mdx", GetUnitX(u), GetUnitY(u), 100, a2, 0, 0, 1.2, 1, 255, 255, 255, 0)
                call Effect("war3mapimported\\AZ_PA_B2.mdx", GetUnitX(u), GetUnitY(u), 0, a2, 0, 0, 3, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\Akame.mdx", GetUnitX(u), GetUnitY(u), 0, a2, 0, 0, 0.9, 0.8 - count * 0.02, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
    endfunction

    private function period4 takes nothing returns nothing
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
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Akame_4.mp3")
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 then
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.9, 1.15), 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\HakenSaber2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1.2), 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
        endif
        if count >= 10 and count <= 50 then
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\QQQQQR.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 11)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Rogue_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0FR')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a2
        local real x
        local real y
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Akame_5.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 2, BLEND_MODE_BLEND, "war3mapImported\\akameT.tga", 255, 255, 255, 255, 255, 255, 255, 0)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\akameT.tga", 255, 255, 255, 255, 255, 255, 255, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(80))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapimported\\Akame.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 0.9, 3.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Akame.mdx", GetUnitX(t), GetUnitY(t), 0, a + 180, 0, 0, 0.9, 3.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
            call SaveEffectHandle(ht, GetHandleId(z), 101, bj_lastCreatedEffect)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveReal(ht, GetHandleId(z), 1, a + 180)
        endif
        if count <= 140 then
            call SaveReal(ht, GetHandleId(z), 0, LoadReal(ht, GetHandleId(z), 0) + 4 )
            call SaveReal(ht, GetHandleId(z), 1, LoadReal(ht, GetHandleId(z), 1) + 4 )
            set a2 = LoadReal(ht, GetHandleId(z), 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = PolarX(GetUnitX(t), count * 5, a2)
            set y = PolarY(GetUnitY(t), count * 5, a2)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 0)
            call SetSpecialEffectYaw(e, a2 + 90)
            set a2 = LoadReal(ht, GetHandleId(z), 1)
            set e = LoadEffectHandle(ht, GetHandleId(z), 101)
            set x = PolarX(GetUnitX(t), count * 5, a2)
            set y = PolarY(GetUnitY(t), count * 5, a2)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 0)
            call SetSpecialEffectYaw(e, a2 + 90)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set i = 0
                loop
                    exitwhen i > 1
                    set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                    call Effect("war3mapimported\\BlackBlink.mdx", GetEffectX(e), GetEffectY(e), 0, GetSpecialEffectYaw(e), 0, 0, 1, 1, 255, 255, 255, 255)
                    set i = i + 1
                endloop
            endif
        endif
        if count == 140 then
            call SoundStart("war3mapImported\\Akame_5-1.mp3")
            set i = 0
            loop
                exitwhen i > 1
                set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                set a2 = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
                call SetSpecialEffectAnimationByIndex(e, 3)
                call SetSpecialEffectYaw(e, a2)
                set i = i + 1
            endloop
        endif
        if count == 155 then
            set i = 0
            loop
                exitwhen i > 1
                set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                set a2 = Angle(GetEffectX(e), GetEffectY(e) , GetUnitX(t) , GetUnitY(t))
                call Effect("war3mapimported\\a_new_k3.mdx", GetEffectX(e), GetEffectY(e), 0, a2, 0, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), 140, a2)
                set y = PolarY(GetUnitY(t), 140, a2)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectHeight(e, 0)
                call SetSpecialEffectYaw(e, a2 + 180)
                call SetSpecialEffectAnimationByIndex(e, 11)
                set i = i + 1
            endloop
        endif
        if count == 175 then
            call SoundStart("war3mapImported\\Rogue_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 185 then 
            if GetRandomInt(1, 2) == 1 then
                set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            else
                set e = LoadEffectHandle(ht, GetHandleId(z), 101)
            endif
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitX(u, GetEffectX(e))
            call SetUnitY(u, GetEffectY(e))
            call SetUnitFacingEx(u, GetSpecialEffectYaw(e), true)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Akame_6.mp3")
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 12)
            call SetUnitTimeScale(u, 1.1)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Akame_6-1.mp3")
            call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call Effect("war3mapImported\\[A]Sand3.mdl", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 40 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Akame_6-2.mp3")
        endif
        if count >= 20 and count <= 50 then
            set dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            if dist > 50 then
                call SetUnitX(u, PolarX(GetUnitX(u), dist / 15, a))
                call SetUnitY(u, PolarY(GetUnitY(u), dist / 15, a))
            else
                call SetUnitX(u, PolarX(GetUnitX(u), - 30, a))
                call SetUnitY(u, PolarY(GetUnitY(u), - 30, a))
            endif
            if count > 35 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
            endif
        endif
        if count == 50 then
            call SetUnitFlyHeight(u, 0, 0)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Akame_6-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            set i = 1
            loop
                exitwhen i > 3
                set x = PolarX(GetUnitX(t), GetRandomReal(- 250, 250), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 250, 250), randomAngle())
                call Effect("war3mapimported\\blood-rou.mdx", x, y, 100, a, 0, 0, 1.25, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapimported\\File00003933.mdx", x, y, 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), randomAngle())
                call Effect("war3mapimported\\bloodex1.mdx", x, y, 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set i = i + 1
            endloop
        endif
        if count == 65 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t) , GetUnitY(t))
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
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a2
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Akame_7.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 15)
        endif
        if count <= 30 then
            if dist < 600 then
                set x = PolarX(GetUnitX(u), - 20, a)
                set y = PolarY(GetUnitY(u), - 20, a)
                call SetUnitXY(u, x, y, 1)
            endif
            if count > 15 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 6, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 6, 0)
            endif
        endif
        if count == 30 then
            call SetUnitFlyHeight(u, 0, 0)
            set i = 1
            loop
                exitwhen i > 18
                set x = PolarX(GetUnitX(u), 250, i * 20)
                set y = PolarY(GetUnitY(u), 250, i * 20)
                set a2 = Angle(x, y, GetUnitX(u) , GetUnitY(u))
                call Effect("war3mapImported\\nitu.mdl", x, y, 50, a2, 0, 0, 1.5, 1.5, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                set i = i + 1
            endloop
        endif
        if count == 40 then
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\OkitaAlter_2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 0, a + 180, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a, - 90, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 180, - 90, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a, - 45, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 90, - 45, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 180, - 45, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Ephemeral Slash Orange.mdx", GetUnitX(t), GetUnitY(t), 500, a + 270, - 45, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 70 then 
            call SoundStart("war3mapImported\\Akame_7-1.mp3")
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

        if abilId == 'A0FO' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0FP' then
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

        if abilId == 'A0FQ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0FR' then
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

        if abilId == 'A0FS' then
            set z = CreateTimer()
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

        if abilId == 'A0FT' then
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

        if abilId == 'A0FU' then
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