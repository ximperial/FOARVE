scope zancrowspell initializer init

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

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zancrow_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 13)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call SetUnitTimeScale(u, 0)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetUnitAbilityLevel(u, 'A01Y') * 100)
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", x, y, 50 + count * 7, a, - 90, 0, 1 + count * 0.075, 1, 255, 255, 255, 255)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\DTPurpleNoRing.mdl", x, y, 50 + count * 8, a, - 90, 0, 1 + count * 0.07, 1, 255, 255, 255, 255)
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
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zancrow_2.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 20 and count <= 40 then
            if dist >= 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\MiniExplode.mp3")
            call Effect("war3mapImported\\SuperBigExplosion4_2.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 45 then
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A026')) * GetHeroStr(u, true))
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
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zancrow_4-1.mp3")
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count <= 20 then
            if dist >= 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count >= 20 and count <= 50 then
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count >= 40 and count <= 60 then
            if dist >= 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count >= 60 and count <= 80 then
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 2)
        endif
        if count >= 100 and count <= 200 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 210 then
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 10 or count == 50 or count == 110 or count == 130 or count == 150 or count == 170 or count == 190 or count == 210 then
            call SetUnitAnimation(u, "attack")
        endif
        if count == 20 or count == 60 or count == 100 or count == 110 or count == 120 or count == 140 or count == 150 or count == 160 or count == 170 or count == 180 then
            if count >= 100 then
                call Effect("war3mapImported\\ShadowSlash.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            endif
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 230 then
            call SoundStart("war3mapImported\\MiniExplode.mp3")
            call Effect("war3mapImported\\SuperBigExplosion4_2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Explode.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.25, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            loop
                exitwhen i > 11
                call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", GetUnitX(t), GetUnitY(t), 130 * i, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set i = i + 1
            endloop
        endif
        if count == 240 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A027')) * GetHeroStr(u, true))
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
        local effect e
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
            call SoundStart("war3mapImported\\Zancrow_5.mp3")
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call SetUnitXY(u, x, y, 1)
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 15 then
            set x = PolarX(GetUnitX(u), 150, a + 90)
            set y = PolarY(GetUnitY(u), 150, a + 90)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set dist = Distance(x, y, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, GetHandleId(z), 0, dist)
            call Effect("war3mapImported\\DarknessSphere.mdl", x, y, 100, a, 0, 0, 1, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(u), 150, a - 90)
            set y = PolarY(GetUnitY(u), 150, a - 90)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set dist = Distance(x, y, GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, GetHandleId(z), 1, dist)
            call Effect("war3mapImported\\DarknessSphere.mdl", x, y, 100, a, 0, 0, 1, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 12)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count >= 30 and count <= 50 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set dist = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetEffectX(e), dist / 20, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), dist / 20, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 0)
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            set dist = LoadReal(ht, GetHandleId(z), 1)
            set x = PolarX(GetEffectX(e), dist / 20, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), dist / 20, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 0)
        endif
        if count >= 50 and count <= 100 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 6, 0)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetEffectXY(e, x, y, 0)
            call SetEffectZ(e, GetUnitFlyHeight(t) + GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            call SetEffectXY(e, x, y, 0)
            call SetEffectZ(e, GetUnitFlyHeight(t) + GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\MiniExplode.mp3")
            call Effect("war3mapImported\\SuperBigExplosion4_2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 110 then
            call SetUnitFlyHeight(t, 0, 0)
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
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local effect e
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
            call SoundStart("war3mapImported\\Zancrow_6.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitX(u, x)
            call SetUnitY(u, y)
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
            call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
        endif
        if count <= 120 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = LoadReal(ht, GetHandleId(z), 0)
                set y = LoadReal(ht, GetHandleId(z), 1)
                set randomA = randomAngle()
                set x = PolarX(x, GetRandomReal(- 400, 400), randomA)
                set y = PolarY(y, GetRandomReal(- 400, 400), randomA)
                call SetUnitXY(t, x, y, 1)
                set randomA = randomAngle()
                set x = PolarX(GetUnitX(t), - 120, randomA)
                set y = PolarY(GetUnitY(t), - 120, randomA)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimation(u, "attack")
                call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 130 then
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarknessSphere.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count >= 130 and count <= 160 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
        endif
        if count == 160 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion4_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 165 then
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
        set e = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real a = GetUnitFacing(u)
        local real x1 = LoadReal(ht, GetHandleId(z), 0)
        local real y1 = LoadReal(ht, GetHandleId(z), 1)
        local real x2 
        local real y2
        local real dmg
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer i = 0

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zancrow_7.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 15 then
            call SetUnitXY(u, x1, y1, 1)
            loop
                exitwhen i > 8
                set x2 = PolarX(GetUnitX(u), 300, i * 40)
                set y2 = PolarY(GetUnitY(u), 300, i * 40)
                call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", x2, y2, 40, i * 40, 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                set x2 = PolarX(GetUnitX(u), 250, i * 40)
                set y2 = PolarY(GetUnitY(u), 250, i * 40)
                call Effect("war3mapImported\\ZancrowAura(Black)4.mdl", x2, y2, 0, i * 40, 0, 0, 2, 1.5, 255, 255, 255, 255)
                call MoveEffect3(bj_lastCreatedEffect, 12, 8, 1, i * 40)
                set i = i + 1
            endloop
            call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ShockwavePurple.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            set dmg = 8 + 0.4 * GetUnitAbilityLevel(u, 'A01W')
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, dmg * GetHeroStr(u, true))
                    set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(gUnit), GetUnitY(gUnit))
                    call knockbackUnit(gUnit, 600, a, 0.6)
                endif
            endloop
            call GroupClear(gGroup)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A01Y' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A026' then
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

        if abilId == 'A027' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A01L' then
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

        if abilId == 'A01P' then
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

        if abilId == 'A028' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
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