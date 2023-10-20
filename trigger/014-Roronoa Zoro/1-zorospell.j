scope zorospell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 22)
            call Effect("war3mapImported\\ZoroWave.mdl", GetUnitX(u), GetUnitY(u), 0, a + 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ZoroWave.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ZoroWave.mdl", GetUnitX(u), GetUnitY(u), 0, a - 20, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 12, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, GetHandleId(z), 10 + i)
                set a = GetSpecialEffectYaw(e)
                set x = PolarX(GetEffectX(e), 80, a)
                set y = PolarY(GetEffectY(e), 80, a)
                call SetEffectXY(e, x, y, 1)
                set x = GetEffectX(e)
                set y = GetEffectY(e)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                call GroupEnumUnitsInRange(gGroup, x, y, 250, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A01U'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                if iterator >= 3 then
                    call Effect("war3mapImported\\SkyNeutralBuildingExplosion.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                endif
                set i = i + 1
            endloop
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
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
        local effect e
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x 
        local real y 
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_2.mp3")
            call SetUnitAnimationByIndex(u, 12)
            set x = PolarX(GetUnitX(u), 75, a)
            set y = PolarY(GetUnitY(u), 75, a)
            call Effect("war3mapImported\\wake.mdl", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 200, a)
            set y = PolarY(GetUnitY(u), 200, a)
            call Effect("war3mapImported\\wake.mdl", x, y, 100, a, - 90, 0, 0.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\nitu.mdl", GetUnitX(u), GetUnitY(u), 0, a + 15, 0, 0, 1.25, 1.5, 255, 255, 255, 125)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\nitu.mdl", GetUnitX(u), GetUnitY(u), 0, a - 15, 0, 0, 1.25, 1.5, 255, 255, 255, 125)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\nitu.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.25, 1.5, 255, 255, 255, 125)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\nitu.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.25, 1.5, 255, 255, 255, 125)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\fuzzystomp2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, 26)
            call Effect("war3mapImported\\[DoFT]az_pa_c.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 220, - 270, 1.5, 1.5, 200, 50, 50, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.33)
        endif
        if count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Zoro_2-1.mp3")
            call ShakeCamera(1.5, GetOwningPlayer(u), 10)
            call ShakeCamera(1.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\[DoFT]az_hit-red-blade.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3.5, 1.5, 255, 50, 50, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
            call Effect("war3mapImported\\[DoFT]SandNew.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Zoro_2-2.mp3")
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count >= 40 and count <= 70 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 25, a)
            set y = PolarY(GetEffectY(e), 25, a)
            call SetEffectXY(e, x, y, 1)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = GetEffectX(e)
                set y = GetEffectY(e)
                call Effect("war3mapImported\\valkrock.mdl", x, y, 0, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                call Effect("war3mapImported\\[DoFT]SandNew.mdl", x, y, 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 70 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A01V')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_4.mp3")
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4) 
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call SetUnitAnimationByIndex(u, 14)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
        if count >= 25 and count <= 50 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Zoro_4-1.mp3")
        endif
        if count == 60 then
            call SetUnitAnimationByIndex(u, 31)
            call SetUnitTimeScale(u, 0.4)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
        if count == 100 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
        if count == 120 then
            call SetUnitTimeScale(u, 1)
        endif
        if count == 140 then
            call Effect("war3mapImported\\zhendi-sand.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2.6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Sand3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]ZoroEf6.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 150 then
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A08O')) * GetHeroStr(u, true))
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

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_5.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 4.2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\az_red-xuanwo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 3.2, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]RedGlow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 4.5, 1.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\PredatorMark.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.9, 1.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\AZ_Slark_N2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 6, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 45 then
            call SoundStart("war3mapImported\\Zoro_5-1.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\t_hit_p.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 4, 1.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\AZ_Axe_E1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.1, 1, 255, 255, 255, 255)
        endif
        if count == 75 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\AZ_Slark_N2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 6, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 115 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\AZ_Slark_N2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 6, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 155 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\AZ_Slark_N2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 6, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 175 then
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.5)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.6, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, PercentTo255(50), PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(50), PercentTo255(50), 255)
        endif
        if count >= 175 and count <= 215 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 185 then
            call SetUnitTimeScale(u, 1)
        endif
        if count == 205 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.4, 1.6, 255, PercentTo255(50), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\[A]ZoroEf0.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.6, 1.2, 255, 255, 255, 255)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.1, 1.2, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 150, a - 90)
            set y = PolarY(GetUnitY(t), 150, a - 90)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", x, y, 50, a, 0, 0, 1.1, 1.2, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 150, a + 90)
            set y = PolarY(GetUnitY(t), 150, a + 90)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", x, y, 50, a, 0, 0, 1.1, 1.2, 255, 255, 255, 255)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.1, 1.2, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 150, a - 90)
            set y = PolarY(GetUnitY(t), 150, a - 90)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", x, y, 100, a, - 90, 0, 1.1, 1.2, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 150, a + 90)
            set y = PolarY(GetUnitY(t), 150, a + 90)
            call Effect("war3mapImported\\slash_red_glow1a.mdl", x, y, 100, a, - 90, 0, 1.1, 1.2, 255, 255, 255, 255)
        endif
        if count == 225 then
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

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit d
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 11)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call SaveUnitHandle(ht, GetHandleId(z), 10, d)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 2)
            if GetLocalPlayer() == GetOwningPlayer(u) then 
                call ClearSelection()
                call SelectUnit(d, true)
            endif
        endif
        if count == 40 then
            call SetUnitAnimationByIndex(u, 33)
        endif
        if count == 90 then
            call SetUnitAnimationByIndex(u, 33)
        endif
        if count == 160 then
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 then
            set d = LoadUnitHandle(ht, GetHandleId(z), 10)
            if GetLocalPlayer() == GetOwningPlayer(u) then 
                call ClearSelection()
                call SelectUnit(d, true)
            endif
        endif
        if count <= 90 then
            set d = LoadUnitHandle(ht, GetHandleId(z), 10)
            call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(d))
            call SetUnitFacing(u, GetUnitFacing(d))
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(1, 1.5), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(0.5, 1), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                set x = PolarX(GetUnitX(u), 50, a)
                set y = PolarY(GetUnitY(u), 50, a)
                call Effect("war3mapImported\\lb_hdg.mdl", x, y, 100, a, - 90, 0, GetRandomReal(0.5, 1), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                set x = PolarX(GetUnitX(u), 100, a)
                set y = PolarY(GetUnitY(u), 100, a)
                call Effect("war3mapImported\\lb_hdg.mdl", x, y, 100, a, - 90, 0, GetRandomReal(0.5, 1), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                call Effect("war3mapImported\\wind4.mdl", x, y, 0, a, 0, 0, GetRandomReal(1, 1.5), 1, PercentTo255(40), 255, PercentTo255(40), 255)
            endif
        endif
        if count == 90 then
            call ForGroup(g, function ResetMoveSpeed)
            call GroupClear(g)
        endif
        if count >= 90 and count <= 200 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\AZ_Goods_Phase Shoes(Green).mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(0.75, 1.25), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                set x = PolarX(GetUnitX(u), 50, a)
                set y = PolarY(GetUnitY(u), 50, a)
                call Effect("war3mapImported\\lb_hdg.mdl", x, y, 100, a, - 90, 0, GetRandomReal(0.75, 1.25), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                set x = PolarX(GetUnitX(u), 100, a)
                set y = PolarY(GetUnitY(u), 100, a)
                call Effect("war3mapImported\\lb_hdg.mdl", x, y, 100, a, - 90, 0, GetRandomReal(0.75, 1.25), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, PercentTo255(40), 255, PercentTo255(40), 255)
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, PercentTo255(40), 255, PercentTo255(40), 255)
            endif
        endif
        if count >= 90 and count <= 170 then
            set x = PolarX(GetUnitX(u), 25, a)
            set y = PolarY(GetUnitY(u), 25, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                call PauseUnit(gUnit, true)
                call SetUnitInvulnerable(gUnit, true)
                set x = PolarX(GetUnitX(u), 140, GetUnitFacing(u))
                set y = PolarY(GetUnitY(u), 140, GetUnitFacing(u))
                call SetUnitXY(gUnit, x, y, 1)
            endloop
        endif
        if count >= 170 and count <= 200 then
            set x = PolarX(GetUnitX(u), 20, a)
            set y = PolarY(GetUnitY(u), 20, a)
            call SetUnitXY(u, x, y, 1)
        endif
        if count == 200 then
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                call PauseUnit(gUnit, false)
                call SetUnitInvulnerable(gUnit, false)
                call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true))
            endloop
            set x = PolarX(GetUnitX(u), - 350, a)
            set y = PolarY(GetUnitY(u), - 350, a)
            call Effect("war3mapImported\\az_alleria_w2.mdl", x, y, 25, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AZ_HYSBD.mdl", x, y, 25, a, 0, 0, 3, 1, PercentTo255(20), 255, PercentTo255(20), 255)
            call Effect("war3mapImported\\[DoFT]ZoroGreenSlashold.mdl", x, y, 25, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", x, y, 25, a, 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 150, a - 90)
            set y = PolarY(GetUnitY(u), 150, a - 90)
            call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 25, a - 90, 0, 0, 2, 1, PercentTo255(20), 255, PercentTo255(20), 255)
            set x = PolarX(GetUnitX(u), 150, a + 90)
            set y = PolarY(GetUnitY(u), 150, a + 90)
            call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 25, a + 90, - 180, 0, 2, 1, PercentTo255(20), 255, PercentTo255(20), 255)
            set x = PolarX(GetUnitX(u), - 100, a)
            set y = PolarY(GetUnitY(u), - 100, a)
            call Effect("war3mapImported\\[A]ZoroEf.mdl", x, y, 25, a, 0, 0, 3, 1, PercentTo255(20), 255, PercentTo255(20), 255)
        endif
        if count == 205 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set d = null
        set g = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zoro_7.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\blue-blink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.8, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\blue-zise-shousuo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 30 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 60 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 70 then
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\blue-blink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.8, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\blue-zise-shousuo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 90 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 110 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Zoro_7-1.mp3")
        endif
        if count == 140 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 27)
        endif
        if count == 160 then
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 170 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 180 then
            call SetUnitAnimationByIndex(u, 26)
            call SetUnitTimeScale(u, 0.4)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 2.1, 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2.1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count >= 180 and count <= 220 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(u), 15, a)
            set y = PolarY(GetUnitY(u), 15, a)
            call SetUnitXY(u, x, y, 1)
        endif
        if count == 190 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call Effect("war3mapImported\\[DoFT]e_slashred.mdl", x, y, 50, a, 0, 0, 3.1, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 200 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 210 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            call Effect("war3mapImported\\DashKirei.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3.5, 1, PercentTo255(40), 255, PercentTo255(40), 255)
            call Effect("war3mapImported\\az_fireringblue.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 5.5, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 220 then
            call SoundStart("war3mapImported\\Zoro_7-2.mp3")
            set a = LoadReal(ht, GetHandleId(z), 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3.3, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 50, a - 90, 0, 0, 3.5, 1, PercentTo255(50), 255, PercentTo255(50), 255)
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 50, a + 90, 0, 0, 3.5, 1, PercentTo255(50), 255, PercentTo255(50), 255)
        endif
        if count == 230 then
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (8 + 0.4 * GetUnitAbilityLevel(u, 'A037')) * GetHeroStr(u, true))
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

        if abilId == 'A01U' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A01V' then
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

        if abilId == 'A08O' then
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

        if abilId == 'A01T' then
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

        if abilId == 'A01N' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A01O' then
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

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope