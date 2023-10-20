scope tsunaspell initializer init
   
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
            call SoundStart("war3mapImported\\Tsuna_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 12)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A031'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\fire-boom-new.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
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
            call SoundStart("war3mapImported\\Tsuna_2.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 17)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count >= 20 and count <= 50 then 
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
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count == 55 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A036')) * GetHeroAgi(u, true))
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tsuna_3.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\BurningAxel.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 10, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 20 and count <= 40 then 
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 20, a)
            set y = PolarY(GetEffectY(e), dist / 20, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
        endif
        if count == 40 then
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\NewDirtEXNofire.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 50 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A032')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Tsuna_4.mp3")
            call SetUnitAnimationByIndex(u, 13)
            call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            set x = PolarX(GetUnitX(u), - 10, a)
            set y = PolarY(GetUnitY(u), - 10, a)
            call Effect("war3mapImported\\SolarBlast2.mdx", x, y, 50, a + 180, 0, 0, 4, 3.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.6)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Tsuna_4-1.mp3")
            call SetUnitAnimationByIndex(u, 16)
        endif
        if count == 140 then
            set x = PolarX(GetUnitX(u), 10, a)
            set y = PolarY(GetUnitY(u), 10, a)
            call Effect("war3mapImported\\PinkRedLaser.mdx", x, y, 50, a, 0, 0, 4, 1.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.6)
            call Effect("war3mapImported\\blazingwind.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 190 then
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\NewDirtEXNofire.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 200 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A035')) * GetHeroAgi(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tsuna_2.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 17)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count >= 20 and count <= 50 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count >= 50 and count <= 70 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Tsuna_1.mp3")
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count >= 70 and count <= 85 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 10, a)
                set y = PolarY(GetUnitY(u), dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 85 then
            set x = PolarX(GetUnitX(t), 120, a)
            set y = PolarY(GetUnitY(t), 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacing(u, a + 180)
        endif
        if count == 95 then
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Abyssal_Impact_Base.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count >= 95 and count <= 115 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 115 then
            call SoundStart("war3mapImported\\Tsuna_1.mp3")
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count >= 115 and count <= 130 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 10, a)
                set y = PolarY(GetUnitY(u), dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
        endif
        if count == 130 then
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
        endif
        if count == 140 then
            call SoundStart("war3mapImported\\Tsuna_5.mp3")
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 600, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Sawada.mdx", GetUnitX(u), GetUnitY(u), 400, a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 18)
            set x = PolarX(GetUnitX(u), - 10, a)
            set y = PolarY(GetUnitY(u), - 10, a)
            call Effect("war3mapImported\\dzxb1.mdx", x, y, 700, a + 180, - 315, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.4)
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Tsuna_5-1.mp3")
            set x = PolarX(GetUnitX(u), 10, a)
            set y = PolarY(GetUnitY(u), 10, a)
            call Effect("war3mapImported\\dzxb2.mdx", x, y, 650, a, - 45, 0, 2, 0.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.2)
        endif
        if count >= 150 and count <= 180 then
            if count <= 170 then
                set x = PolarX(GetUnitX(t), 20, a)
                set y = PolarY(GetUnitY(t), 20, a)
                call SetUnitXY(t, x, y, 2)
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                set i = 1
                loop
                    exitwhen i > 4
                    set x = PolarX(GetUnitX(u), 100 * i, a + 180)
                    set y = PolarY(GetUnitY(u), 100 * i, a + 180)
                    call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx", x, y, 700 + i * 100, a + 180, - 45, 0, 1, 1, 255, 255, 255, 255)
                    set x = PolarX(GetUnitX(u), 100 * i, a)
                    set y = PolarY(GetUnitY(u), 100 * i, a)
                    call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx", x, y, 650 - i * 100, a, - 315, 0, 1, 1, 255, 255, 255, 255)
                    set i = i + 1
                endloop
            endif
        endif
        if count == 170 then
            call Effect("war3mapImported\\RedRing.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Holy_Fire_Slam2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 180 then
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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

    private function period6 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tsuna_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 20)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 400, 400)
        endif
        if count == 50 then
            set x2 = PolarX(GetUnitX(u), - 20, a + 30)
            set y2 = PolarY(GetUnitY(u), - 20, a + 30)
            call Effect("war3mapImported\\SolarBlast2.mdx", x2, y2, 700, a + 30, - 160, 0, 1, 4, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.6)
            set x2 = PolarX(GetUnitX(u), - 20, a - 30)
            set y2 = PolarY(GetUnitY(u), - 20, a - 30)
            call Effect("war3mapImported\\SolarBlast2.mdx", x2, y2, 700, a - 30, - 160, 0, 1, 4, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.6)
        endif
        if count == 50 or count == 100 then
            call Effect("war3mapImported\\XBurnerLight.mdx", GetUnitX(u), GetUnitY(u), 450, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count <= 100 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.1)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 0)
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
            set x2 = PolarX(GetUnitX(u), 20, a)
            set y2 = PolarY(GetUnitY(u), 20, a)
            call Effect("war3mapImported\\SolarBlast2.mdx", x2, y2, 650, a, - 45, 0, 1, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call AnimEffectEx(bj_lastCreatedEffect, "stand", 0.2)
        endif
        if count >= 100 and count <= 250 then
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 11 * GetHeroAgi(u, true) / 150)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Holy_Fire_Slam2.mdx", x, y, 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Asuma-Explosion.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperBigExplosion.mdx", x, y, 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 260 then
            call SetUnitFlyHeight(u, 0, 1000)
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 1.4)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 5 then
            call Effect("war3mapImported\\Icestomp.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 100 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), 140, randomAngle())
                set y = PolarY(GetUnitY(t), 140, randomAngle())
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimation(u, "attack")
                call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Tsuna_7.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 1)
            call Effect("Abilities\\Spells\\Other\\Charm\\CharmTarget.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 5)
            call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count >= 120 and count <= 150 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set i = 0
                loop
                    exitwhen i > 5
                    set x = PolarX(GetUnitX(t), 100 + (count - 120) * 15, i * 60)
                    set y = PolarY(GetUnitY(t), 100 + (count - 120) * 15, i * 60)
                    call Effect("Abilities\\Spells\\Undead\\FrostNova\\FrostNovaTarget.mdx", x, y, 25, i * 60, 0, 0, 1.5, 1, 255, 255, 255, 255)
                    set i = i + 1
                endloop
            endif
        endif
        if count == 160 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
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

        if abilId == 'A031' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A036' then
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

        if abilId == 'A032' then
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

        if abilId == 'A035' then
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

        if abilId == 'A039' then
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

        if abilId == 'A034' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A038' then
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