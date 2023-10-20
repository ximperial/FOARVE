scope mikuspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_1.mp3")
            call SoundStart("war3mapImported\\miku_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A092'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\blizzard.mdl", x, y, 0, a + 180, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
                call Effect("war3mapImported\\effect_IRui03.mdl", x, y, 50, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SoundStart("war3mapImported\\miku_1-2.mp3")
            call Effect("war3mapImported\\afbbxks.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_2.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 0)
        endif
        if count == 5 then
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 10 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 30 then
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 35 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 55 then
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 60 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\miku.mdl", x, y, 0, a, 0, 0, 1.05, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 85 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blueaftershock.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 95 then
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\miku_2-1.mp3")
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\miku_2-2.mp3")
            call Effect("war3mapImported\\effect_IRui02.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\62.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 115 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0IZ')) * GetHeroInt(u, true))
            call knockbackUnit(t, 600, a, 0.6)
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

    private function period3_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local integer count = LoadInteger(ht, zid, 0)
        local real dist = LoadReal(ht, zid, 0)
        local real a = GetSpecialEffectYaw(e)
        local real x = PolarX(GetEffectX(e), dist / 20, a)
        local real y = PolarY(GetEffectY(e), dist / 20, a)
        local real h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
        local real dmg

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, h - 30)
        if count == 20 then
            call SetSpecialEffectScale(e, 3)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.6)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B014') > 0) * 2
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, ((dmg + 6 + 2 * GetUnitAbilityLevel(u, 'A0J8')) * GetHeroInt(u, true)) / 50)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period3_1 takes unit u, effect e, real x, real y returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real dist = Distance(GetEffectX(e), GetEffectY(e), x, y)

        call SaveUnitHandle(ht, zid, 0, u)
        call SaveEffectHandle(ht, zid, 100, e)
        call SaveInteger(ht, zid, 0, 0)
        call SaveReal(ht, zid, 0, dist)
        call TimerStart(z, 0.02, true, function period3_2)

        set z = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2
        local real randomDist

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Miku_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 4, GetUnitX(u), GetUnitY(u))
            call ShakeCamera(3, GetOwningPlayer(u), 10)
            call SetUnitAnimationByIndex(u, 10)
            call Effect("war3mapImported\\AOE2m.mdl", x, y, 0, randomAngle(), 0, 0, 5, 3, 128, 128, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call lockUnit(gUnit, 0.6, true)
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 25 or count == 50 or count == 75 or count == 100 or count == 125 then
            call SoundStart("war3mapImported\\Miku_1-2.mp3")
        endif
        if count <= 150 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                set x2 = PolarX(x, GetRandomReal(- 500, 500), randomAngle())
                set y2 = PolarY(y, GetRandomReal(- 500, 500), randomAngle())
                set x = PolarX(GetUnitX(u), - 400, a)
                set y = PolarY(GetUnitY(u), - 400, a)
                set randomDist = GetRandomReal(200, 400)
                set x = PolarX(x, randomDist, a + LoadReal(ht, zid, 10))
                set y = PolarY(y, randomDist, a + LoadReal(ht, zid, 10))
                set a = Angle(x, y, x2, y2)
                call Effect("war3mapImported\\Blizzard II Missile.mdl", x, y, 610, a, - 45, 0, 2, 2, 255, 255, 255, 255)
                call period3_1(u, bj_lastCreatedEffect, x2, y2)
                call SaveReal(ht, zid, 10, - LoadReal(ht, zid, 10))
            endif
        endif
        if count == 150 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x 
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_5.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 6, GetUnitX(u), GetUnitY(u))
            call ShakeCamera(6, GetOwningPlayer(u), 10)
            call SetUnitAnimationByIndex(u, 15)
            call Effect("war3mapImported\\ShadeAura.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 6, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarknessRising2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 6, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            set i = 0
            loop
                exitwhen i > 9
                set x = PolarX(GetUnitX(u), 500, i * 36)
                set y = PolarY(GetUnitY(u), 500, i * 36)
                call Effect("war3mapImported\\SandAura.mdl", x, y, 10, randomAngle(), 0, 0, 2, 6, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                set i = i + 1
            endloop
        endif
        if count <= 300 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 550, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 15 * GetHeroInt(u, true) / 300)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 3), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 2), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 2.5), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            endif
        endif
        if count == 300 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dmg

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\miku_6.mp3")
            call ShakeCamera(6, GetOwningPlayer(u), 10)
            call SetUnitAnimationByIndex(u, 15)
            call SetUnitXY(u, x, y, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 5, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\Absolute Zero.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 6, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call Effect("war3mapImported\\sbss_bingdongxili.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 6, 255, 255, 255, 255)
            call Effect("war3mapImported\\Drop_the_beat.mdl", GetUnitX(u), GetUnitY(u), 10, randomAngle(), 0, 0, 2.5, 6, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count <= 300 then
            set dmg = B2I(GetUnitAbilityLevel(u, 'B014') > 0) * 2
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 700, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (dmg + 11) * GetHeroInt(u, true) / 300)
                    set a = Angle(GetUnitX(gUnit), GetUnitY(gUnit), GetUnitX(u), GetUnitY(u))
                    if Distance(GetUnitX(gUnit), GetUnitY(gUnit), GetUnitX(u), GetUnitY(u)) > 160 then
                        set x = PolarX(GetUnitX(gUnit), 5, a)
                        set y = PolarY(GetUnitY(gUnit), 5, a)
                        call SetUnitPosition(gUnit, x, y) 
                    else
                        set x = PolarX(GetUnitX(u), - 140, a)
                        set y = PolarY(GetUnitY(u), - 140, a)
                        call SetUnitPosition(gUnit, x, y)
                    endif
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 2.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 2.5), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            endif
        endif
        if count == 300 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local real x
        local real y
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 30 then
            call PauseUnit(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Miku_7.mp3")
            if GetOwningPlayer(t) == Player(1) then
                call SetPlayerAllianceStateVisionBJ( Player(2), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(3), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(2) then
                call SetPlayerAllianceStateVisionBJ( Player(1), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(3), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(3) then
                call SetPlayerAllianceStateVisionBJ( Player(1), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(2), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(5) then
                call SetPlayerAllianceStateVisionBJ( Player(6), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(7), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(6) then
                call SetPlayerAllianceStateVisionBJ( Player(5), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(7), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(7) then
                call SetPlayerAllianceStateVisionBJ( Player(5), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(6), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(9) then
                call SetPlayerAllianceStateVisionBJ( Player(10), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(11), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(10) then
                call SetPlayerAllianceStateVisionBJ( Player(9), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(11), GetOwningPlayer(t), false )
            elseif GetOwningPlayer(t) == Player(11) then
                call SetPlayerAllianceStateVisionBJ( Player(9), GetOwningPlayer(t), false )
                call SetPlayerAllianceStateVisionBJ( Player(10), GetOwningPlayer(t), false )
            endif
            call Effect("war3mapImported\\SandAura.mdl", GetUnitX(t), GetUnitY(t), 10, randomAngle(), 0, 0, 2.5, 0, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count <= 440 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
            call SetSpecialEffectZ(e, GetUnitFlyHeight(t) + 10 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
            call DamageUnit(u, t, 0.8 * GetHeroInt(u, true) / 50)
            if GetUnitCurrentSight(t) > 600 then
                call SetUnitCurrentSight(t, 600)
            endif
        endif
        if count == 440 or (not IsUnitAlive(t) and count >= 30) then
            if not IsUnitInGroup(t, locktour[3]) then
                if GetOwningPlayer(t) == Player(1) then
                    call SetPlayerAllianceStateVisionBJ( Player(2), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(3), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(2) then
                    call SetPlayerAllianceStateVisionBJ( Player(1), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(3), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(3) then
                    call SetPlayerAllianceStateVisionBJ( Player(1), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(2), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(5) then
                    call SetPlayerAllianceStateVisionBJ( Player(6), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(7), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(6) then
                    call SetPlayerAllianceStateVisionBJ( Player(5), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(7), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(7) then
                    call SetPlayerAllianceStateVisionBJ( Player(5), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(6), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(9) then
                    call SetPlayerAllianceStateVisionBJ( Player(10), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(11), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(10) then
                    call SetPlayerAllianceStateVisionBJ( Player(9), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(11), GetOwningPlayer(t), true )
                elseif GetOwningPlayer(t) == Player(11) then
                    call SetPlayerAllianceStateVisionBJ( Player(9), GetOwningPlayer(t), true )
                    call SetPlayerAllianceStateVisionBJ( Player(10), GetOwningPlayer(t), true )
                endif
            endif
            if IsUnitAlive(t) then
                if GetUnitCurrentSight(t) == 600 then
                    if GetTimeOfDay() >= bj_TOD_DAWN and GetTimeOfDay() < bj_TOD_DUSK then
                        call SetUnitCurrentSight( t, 1800 )
                    else
                        call SetUnitCurrentSight( t, 1000 )
                    endif
                endif
            endif
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
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

        if abilId == 'A092' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0IZ' then
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

        if abilId == 'A0J7' then
            call SoundStart("war3mapImported\\miku_3.mp3")
        endif

        if abilId == 'A0J8' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveReal(ht, GetHandleId(z), 10, 90)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0J9' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0JA' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0JB' then
            set z = CreateTimer()
            call PauseUnit(t, true)
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