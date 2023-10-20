scope vegetaspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count == 1 or count == 5 or count == 10 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u), 80, a)
            set y = PolarY(GetUnitY(u), 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A04F'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = PolarX(GetUnitX(u), 50, a + 90)
                set y = PolarY(GetUnitY(u), 50, a + 90)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", x, y, 0, a - 90, 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                set x = PolarX(GetUnitX(u), 50, a - 90)
                set y = PolarY(GetUnitY(u), 50, a - 90)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", x, y, 0, a + 90, 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                call Effect("war3mapImported\\[DoFT]az-zise-toushewu.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\glchj.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_2.mp3")
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count == 1 or count == 10 then
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call ShakeCamera(3, GetOwningPlayer(u), 10)
            call ShakeCamera(3, GetOwningPlayer(t), 10)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 or count == 100 or count == 120 or count == 140 then
            call SetUnitAnimationByIndex(u, 16)
        endif
        if count <= 150 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                if count >= 20 then
                    set x = PolarX(GetUnitX(t), 5, a)
                    set y = PolarY(GetUnitY(t), 5, a)
                    call SetUnitXY(t, x, y, 2)
                endif
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if count >= 20 then
                    call Effect("war3mapImported\\!AttackWounds.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
                    call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call Effect("war3mapImported\\blue-toushewu.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(3, 4), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                    call Effect("war3mapImported\\hiteffect07bluea.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 21)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 170 then
            call Effect("war3mapImported\\OrbitalRay.mdl", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count == 180 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A04H')) * GetHeroStr(u, true))
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real randomA
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_4-3.mp3")
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 15)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count == 5 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 40, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 5 and count <= 25 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Vegeta_4.mp3")
            call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
            call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 25 or count == 35 or count == 45 or count == 55 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call SoundStart("war3mapImported\\Vegeta_4-1.mp3")
        endif
        if count >= 25 and count <= 60 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = LoadReal(ht, GetHandleId(z), 0)
                set y = LoadReal(ht, GetHandleId(z), 1)
                set randomA = randomAngle()
                set x = PolarX(x, GetRandomReal(- 500, 500), randomA)
                set y = PolarY(y, GetRandomReal(- 500, 500), randomA)
                call SetUnitXY(t, x, y, 1)
                set randomA = randomAngle()
                set x = PolarX(GetUnitX(t), - 120, randomA)
                set y = PolarY(GetUnitY(t), - 120, randomA)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimationByIndex(u, GetRandomInt(9, 10))
                call Effect("war3mapImported\\!AttackWounds.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(2, 3), 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\BlinkCaster3.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                call Effect("war3mapImported\\BlinkNew2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                call Effect("war3mapImported\\blue-toushewu.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(3.5, 4), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            endif
        endif
        if count == 60 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
        if count == 60 or count == 65 or count == 70 or count == 75 then
            call Effect("war3mapImported\\SuperShinyThingy.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Vegeta_4-2.mp3")
            call SoundStart("war3mapImported\\Vegeta_4-3.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count >= 70 and count <= 80 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 40, 0)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 40, 0)
        endif
        if count == 80 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.6, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count == 85 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A01Z')) * GetHeroStr(u, true))
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
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_5.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 300, 500)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 0)
            call Effect("war3mapImported\\VegetaEff1.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 0.7, 1.5, 255, 255, 255, 255)
        endif
        if count <= 35 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 1000, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup) 
        endif
        if count == 35 then
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
        endif
        if count == 40 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call Effect("war3mapImported\\krk (1849).mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 205, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\krk (1849).mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 180, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\krk (1849).mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 155, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\FinalKamehameha2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 205, 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\FinalKamehameha2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 180, 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\FinalKamehameha2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a + 155, 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 900, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and IsUnitInConeEx(gUnit, GetUnitX(u), GetUnitY(u), a, 130) then
                    call DamageUnit(u, gUnit, 15 * GetHeroStr(u, true))
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 60 then
            call SetUnitFlyHeight(u, 0, 0)
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
    endfunction

    private function period5 takes nothing returns nothing
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
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_6.mp3")
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 20 or count == 40 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            if count == 40 then
                call SetUnitFlyHeight(u, 450, 0)
            endif
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 15)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Vegeta_4-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\freezingring.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 25 and count <= 40 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Vegeta_4-1.mp3")
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\freezingring.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u), a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u), a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 40 and count <= 60 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Vegeta_6-1.mp3")
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 500, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 70 then
            call ShakeCamera(1.5, GetOwningPlayer(u), 10)
            call ShakeCamera(1.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\VegetaEff1.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\VegetaEff2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, - 45, 0, 1, 1.5, 255, 255, 255, 255)
            call SetUnitFlyHeight(t, 0, 1250)
        endif
        if count >= 70 and count <= 90 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 80 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 85 then
            call SoundStart("war3mapImported\\Vegeta_4-3.mp3")
            call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.8, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        endif
        if count == 95 then
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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
    endfunction

    private function period6_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local integer count = LoadInteger(ht, zid, 0) + 1
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y) + LoadReal(ht, zid, 2)
        local real dist = LoadReal(ht, zid, 3)
        local real h = LoadReal(ht, zid, 4) + GetRandomReal(20, 25)
        local real x2 = PolarX(GetEffectX(e), dist / 20, a)
        local real y2 = PolarY(GetEffectY(e), dist / 20, a)

        call SaveInteger(ht, zid, 0, count)
        call SaveReal(ht, zid, 4, h)
        call SetEffectXY(e, x2, y2, 1)
        call SetSpecialEffectZ(e, h + GetAxisZ(x2, y2))
        call SetSpecialEffectYaw(e, a)
        if count >= 20 then
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.6)
            call Effect("war3mapimported\\by_wood_bashenan_juqi_1_4.mdx", GetEffectX(e), GetEffectY(e), h, randomAngle(), 0, 0, 1, 1, 233, 221, 44, 255)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period6_1 takes unit u, real x, real y returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)

        call SaveUnitHandle(ht, zid, 0, u)
        call SaveInteger(ht, zid, 0, 0)
        call SaveInteger(ht, zid, 1, 0)
        call SaveReal(ht, zid, 0, x)
        call SaveReal(ht, zid, 1, y)
        call SaveReal(ht, zid, 2, GetRandomReal(- 40, 40))
        call SaveReal(ht, zid, 3, dist)
        call SaveReal(ht, zid, 4, 50)
        call Effect("war3mapimported\\by_wood_effect_qigongbo_lan.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 2, 233, 221, 44, 255)
        call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        call TimerStart(z, 0.02, true, function period6_2)

        set z = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real randomA
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local effect e
        local real z1

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Vegeta_4-3.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 6)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\freezingring.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Vegeta_7.mp3")
            call SetUnitTimeScale(u, 2)
        endif
        if count == 25 then
            call ShakeCamera(2, GetOwningPlayer(u), 5)
            call ShakeCamera(2, GetOwningPlayer(t), 5)
        endif
        if count >= 20 and count <= 120 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SetUnitAnimation(u, "attack")
                set randomA = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomA)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomA)
                call period6_1(u, x, y)
            endif
        endif
        if count == 130 then
            call Effect("war3mapImported\\VegetaEff1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 2.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SetUnitAnimationByIndex(u, 21)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 160 then
            call Effect("war3mapImported\\utsuhoredsun.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            call Effect("Abilities\\Spells\\Orc\\Purge\\PurgeBuffTarget.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
        if count >= 160 and count <= 190 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), dist / 30, a)
            set y = PolarY(GetEffectY(e), dist / 30, a)
            set z1 = GetEffectZ(e) + GetAxisZ(x + 0.01, y) - GetAxisZ(x, y)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, z1 + 15)
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            set x = PolarX(GetEffectX(e), dist / 30, a)
            set y = PolarY(GetEffectY(e), dist / 30, a)
            set z1 = GetEffectZ(e) + GetAxisZ(x + 0.01, y) - GetAxisZ(x, y)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, z1 + 15)
        endif
        if count == 190 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetSpecialEffectAnimation(e, "death")
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapImported\\VegetaEff3.mdl", GetUnitX(t), GetUnitY(t), 400, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdl", GetUnitX(t), GetUnitY(t), 400, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdl", GetUnitX(t), GetUnitY(t), 400, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 200 then
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (8 + 0.4 * GetUnitAbilityLevel(u, 'A04I')) * GetHeroStr(u, true))
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

        if abilId == 'A04F' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A04H' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A01Z' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A04L' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A029' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A04N' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
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