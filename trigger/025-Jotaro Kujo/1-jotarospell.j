scope jotarospell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2
        local real y2
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set x2 = PolarX(GetUnitX(u), 70, GetUnitFacing(u) - 120)
            set y2 = PolarY(GetUnitY(u), 70, GetUnitFacing(u) - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x2, y2, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\blackblink.mdx", x2, y2, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x2, y2, 0, GetUnitFacing(u), 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Jotaro_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectAnimationByIndex(e, 10)
            call SetSpecialEffectTimeScale(e, 2)
            call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Stoneslam_new9.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\[a]sandpoff123.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\[a]t_icesparks.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A02P'))
                endif
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
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
        local effect e
        
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_1.mp3")
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 1.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 1)
            call SetSpecialEffectTimeScale(e, 0.3)
        endif
        if count == 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 2)
            call SetSpecialEffectTimeScale(e, 0.5)
        endif
        if count == 40 then
            set e = LoadEffectHandle(ht, zid, 100)
            if dist > 400 then
                call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), 140, a)
                set y = PolarY(GetUnitY(t), 140, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                call SetSpecialEffectYaw(e, a + 180)
                call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            else
                call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                call Effect("war3mapimported\\blackblink.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Jotaro_2.mp3")
            else
                call SoundStart("war3mapImported\\Jotaro_2-1.mp3")
            endif
            if dist > 400 then
                set a = a + 180
            endif
            call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\flashaura.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 60 then
            if dist > 400 then
                set a = a + 180
            endif
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A02Q')) * GetHeroStr(u, true))
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
        set e = null
    endfunction

    private function period3_1 takes nothing returns nothing
        local unit u = GetEnumUnit()

        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)

        set u = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 100 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_6.mp3")
            call ShakeCamera(2, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set x = PolarX(GetUnitX(u), 70, GetUnitFacing(u) - 120)
            set y = PolarY(GetUnitY(u), 70, GetUnitFacing(u) - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\wind2.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, GetUnitFacing(u), 0, 0, 1, 7, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 100 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 5)
            call SetSpecialEffectTimeScale(e, 1.5)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 3.2, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.1, 1.8, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.9, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
        endif
        if count == 140 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectVertexColour(e, 255, 255, 255, 0)
            set e = LoadEffectHandle(ht, zid, 104)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 160 then
            set e = LoadEffectHandle(ht, zid, 103)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 180 then
            set e = LoadEffectHandle(ht, zid, 102)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 300 then
            call SoundStart("war3mapImported\\Jotaro_6-2.mp3")
        endif
        if count == 330 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count >= 100 and count <= 350 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count <= 140 then
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), (count - 100) * 30, null)
                call GroupRemoveUnit(gGroup, u)
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
                set i = 1
                loop
                    exitwhen i > 4
                    set e = LoadEffectHandle(ht, zid, 100 + i)
                    call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
                    set i = i + 1
                endloop
            else
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1200, null)
                call GroupRemoveUnit(gGroup, u)
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
        endif
        if count == 350 then
            call ForGroup(g, function period3_1)
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

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call SaveReal(ht, zid, 10, dist)
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Jotaro_4-1.mp3")
            call ShakeCamera(4, GetOwningPlayer(u), 10)
            call ShakeCamera(4, GetOwningPlayer(t), 10)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 3)
        endif
        if count >= 30 and count <= 230 then
            set dist = LoadReal(ht, zid, 10)
            if dist > 400 then
                set a = a + 180
            endif
            set x = PolarX(GetUnitX(t), 2, a)
            set y = PolarY(GetUnitY(t), 2, a)
            call SetUnitXY(t, x, y, 2)
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\shockwave big.mdx", GetUnitX(t), GetUnitY(t), 50, a + GetRandomReal(- 45, 45), 0, 0, GetRandomReal(.8, 1.2), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 100, a + GetRandomReal(- 45, 45), - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\windexploreeffect(bigger).mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, GetRandomReal(1.3, 1.8), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 100, a + GetRandomReal(- 45, 45), - 90, 0, GetRandomReal(10, 15), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 220 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 4)
        endif
        if count == 240 then
            set dist = LoadReal(ht, GetHandleId(z), 10)
            if dist > 400 then
                set a = a + 180
            endif
            call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\windexploreeffect(bigger).mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 15, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 250 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A02S')) * GetHeroStr(u, true))
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
        local effect e
        
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_5.mp3")
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\wind2.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\DevilSlam.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\kaizokusfxbyvalk4.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 9.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 40 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 5)
        endif
        if count == 120 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 0)
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.6)
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapimported\\wavejojo.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\wind2.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 230 then
            call ShakeCamera(4, GetOwningPlayer(u), 10)
            call ShakeCamera(4, GetOwningPlayer(t), 10)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 3)
        endif
        if count >= 230 and count <= 430 then
            set x = PolarX(GetUnitX(t), 2, a)
            set y = PolarY(GetUnitY(t), 2, a)
            call SetUnitXY(t, x, y, 2)
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
                call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 50, a + randomAngle(), - 45, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
                call Effect("war3mapimported\\[a]t_icesparks.mdx", GetUnitX(t), GetUnitY(t), 100, a + GetRandomReal(- 45, 45), - 90, 0, GetRandomReal(2, 2.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 100, a + GetRandomReal(- 45, 45), - 90, 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 430 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 8)
        endif
        if count == 450 then
            call Effect("war3mapimported\\BrokenGlass.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapimported\\[a]t_icesparks.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 15, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\shockwave big.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 460 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
            call knockbackUnit(t, 400, a, 0.6)
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
        local group g = LoadGroupHandle(ht, zid, 2)
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
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_6.mp3")
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind2.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 9.2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 100 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 5)
            call SetSpecialEffectTimeScale(e, 1.5)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 3.2, 6.7, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.1, 1.8, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.9, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
        endif
        if count == 140 then
            call SoundStart("war3mapImported\\Jotaro_6-1.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectAnimationByIndex(e, 7)
            call SetSpecialEffectTimeScale(e, 1)
            set e = LoadEffectHandle(ht, zid, 104)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 160 then
            set e = LoadEffectHandle(ht, zid, 103)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 180 then
            set e = LoadEffectHandle(ht, zid, 102)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count == 380 then
            call SoundStart("war3mapImported\\Jotaro_6-2.mp3")
        endif
        if count == 410 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAnimation(e, "death")
        endif
        if count >= 100 and count <= 450 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count <= 140 then
                call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), (count - 100) * 30, null)
                call GroupRemoveUnit(gGroup, u)
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
                set i = 1
                loop
                    exitwhen i > 4
                    set e = LoadEffectHandle(ht, zid, 100 + i)
                    call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
                    set i = i + 1
                endloop
            else
                call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1200, null)
                call GroupRemoveUnit(gGroup, u)
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
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 5 then
                    call SaveInteger(ht, zid, 1, 0)
                    set a2 = randomAngle()
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 150, 150), a2)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 150, 150), a2)
                    call Effect("war3mapimported\\Hit.mdx", x, y, 100, randomAngle(), - 90, 0, 1.5, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                    call Effect("war3mapimported\\wavejojo.mdx", x, y, 100, randomAngle(), - 45, 0, 1, 1, 255, 255, 255, 255)
                    call Effect("war3mapimported\\Ikadt1white.mdx", x, y, 100, randomAngle(), - 45, 0, 1, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                endif
            endif
        endif
        if count == 450 then
            call ForGroup(g, function period3_1)
            call DestroyGroup(g)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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
        set e = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 110 then
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Jotaro_7.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]effect_Howling_SFX.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StarPlatinumJ.mdx", x, y, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 70 then
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]effect_Howling_SFX.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 90 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectAnimationByIndex(e, 9)
        endif
        if count == 100 then
            call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\BrokenGlass.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 4, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\Ikadt1white.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[a]shockwave big.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 100, a, 45, 0, 8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 110 then 
            call SetUnitFlyHeight(t, 400, 400 / 0.4)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
            call knockbackUnit(t, 700, a, 0.8)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call SaveReal(ht, zid, 10, a)
        endif
        if count == 130 then
            call SetUnitFlyHeight(t, 0, 400 / 0.4)
        endif
        if count == 150 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\fuzzystomp.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[a]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\zhendi-sand.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
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

        if abilId == 'A02P' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A02Q' then
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

        if abilId == 'A02R' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A02S' then
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

        if abilId == 'A02T' then
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

        if abilId == 'A02U' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A02V' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
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