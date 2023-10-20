scope borsalinospell initializer init
   
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
            call SoundStart("war3mapImported\\Kizaru_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapimported\\Kizaru Magic.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A033'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\LaserMissile.mdx", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
                call Effect("war3mapimported\\wind2.mdx", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapimported\\DustExplosion.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\DustWaveNew.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Asuma-Explosion3.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\EarthDetonation.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
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
            call SoundStart("war3mapImported\\Kizaru_2.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.2)
        endif
        if count == 60 then 
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 75 then
            call Effect("war3mapImported\\Asuma-Explosion.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DivineRage.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A03A')) * GetHeroAgi(u, true))
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

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0) + LoadInteger(ht, zid, 10)
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kizaru_3.mp3")
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(u), 75, a)
            set y = PolarY(GetUnitY(u), 75, a)
            call SetUnitXY(u, x, y, 1)
            call SetUnitFacing(u, a)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A03H')) * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 2 or iterator == 4 then
                if iterator == 4 then
                    call SaveInteger(ht, zid, 1, 0)
                    call SaveInteger(ht, zid, 10, - LoadInteger(ht, zid, 10))
                endif
                call Effect("war3mapimported\\Kizaru.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.2, 255, 255, 0, 100)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
                call Effect("war3mapimported\\HolySmiteMissileNew.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
            endif
        endif
        if count == 20 then
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
            call SoundStart("war3mapImported\\Kizaru_5.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count == 10 then
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetUnitFlyHeight(t, 600, 1000)
        endif
        if count >= 10 and count <= 40 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 40 then 
            call SoundStart("war3mapImported\\Kizaru_5-1.mp3")
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kizaru Magic.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FairyLawLight.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SetUnitFlyHeight(u, 0, 1500)
            call SetUnitFlyHeight(t, 0, 1500)
        endif
        if count == 70 then
            call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\NuclearExplosion.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ValkDust.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A03E')) * GetHeroAgi(u, true))
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

    private function period5_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local integer count = LoadInteger(ht, zid, 0)
        local real a = GetSpecialEffectYaw(e)
        local real dist = LoadReal(ht, zid, 0)
        local real x = PolarX(GetEffectX(e), dist / 20, a)
        local real y = PolarY(GetEffectY(e), dist / 20, a)
        local real h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y) 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, h - 37.5)
        if count == 20 then 
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapimported\\NewDirtEXNofire.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 15 * GetHeroAgi(u, true) / 50)
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
    
    private function period5_1 takes unit u, real x1, real y1, real x2, real y2 returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real a = Angle(x1, y1, x2, y2)
        local real dist = Distance(x1, y1, x2, y2)

        call SaveUnitHandle(ht, zid, 0, u)
        call Effect("war3mapimported\\!ylaser!2.mdx", x1, y1, 760, a, - 45, 0, 0.6, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        call SaveInteger(ht, zid, 0, 0)
        call SaveReal(ht, zid, 0, dist)
        call TimerStart(z, 0.02, true, function period5_2)

        set z = null
    endfunction

    private function period5 takes nothing returns nothing
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
        local real x3 
        local real y3

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kizaru_5-2.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            set x2 = PolarX(x, - 1000, a)
            set y2 = PolarY(y, - 1000, a)
            call Effect("war3mapImported\\Kizaru.mdx", x2, y2, 700, a, 0, 0, 1, 4, 255, 255, PercentTo255(40), 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 14)
            call Effect("war3mapimported\\!guang small.mdx", x2, y2, 550, a, 0, 0, 2, 4, 255, 255, 255, 255)
        endif
        if count <= 200 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.2) 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                set x2 = PolarX(x, - 1000, a)
                set y2 = PolarY(y, - 1000, a)
                set x3 = PolarX(x, GetRandomReal(- 700, 700), a + GetRandomReal(- 70, 70))
                set y3 = PolarY(y, GetRandomReal(- 700, 700), a + GetRandomReal(- 70, 70))
                call period5_1(u, x2, y2, x3, y3)
            endif
        endif
        if count == 205 then
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
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
        set g = null
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
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kizaru_6.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 20 then
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 0.8)
            call SetUnitFlyHeight(u, 400, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kizaru Magic.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\laseryellow.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u) + 10, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 20 and count <= 40 then
            set e = LoadEffectHandle(ht, zid, 100)
            set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetEffectX(e), dist / 20, a)
            set y = PolarY(GetEffectY(e), dist / 20, a)
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, h - 20)
        endif
        if count == 40 then 
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death") 
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DivineRage.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ValkDust.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then 
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kizaru_7.mp3")
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\BlinkCaster.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 0)
        endif
        if count >= 20 and count <= 160 then 
            if count >= 130 then 
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
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\FairyLawLight.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255) 
            endif
        endif
        if count == 160 then 
            call Effect("war3mapImported\\Asuma-Explosion.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DivineRage.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ValkDust.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\NewDirtEXNofire.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 170 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A033' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A03A' then
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

        if abilId == 'A03H' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 10, 30)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A03E' then
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

        if abilId == 'A03B' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A01A' then
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

        if abilId == 'A03D' then
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