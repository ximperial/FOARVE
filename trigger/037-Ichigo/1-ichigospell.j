scope ichigospell initializer init
   
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
            call SoundStart("war3mapImported\\Ichigo_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapimported\\BlackGetsuga2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 0.6, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0BM'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("Abilities\\Spells\\Undead\\OrbOfDeath\\OrbOfDeathMissile.mdx", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
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
        set e = null
    endfunction

    private function period2 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Ichigo_2.mp3")
            call SetUnitTimeScale(u, 2)
        endif
        if count == 1 or count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then 
            call SetUnitAnimation(u, "attack")
        endif
        if count <= 80 then
            set x = PolarX(GetUnitX(u), 25, a)
            set y = PolarY(GetUnitY(u), 25, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (1 + GetUnitAbilityLevel(u, 'A0DM')) * GetHeroStr(u, true)) 
                    call GroupAddUnit(g, gUnit)
                endif
            endloop 
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Dead Spirit by Deckai3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 80 then
            call SetUnitTimeScale(u, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
            call SoundStart("war3mapImported\\Ichigo_4.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapImported\\bymutou-hongse3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Ichigo_2.mp3")
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 0.4)
        endif
        if count >= 100 and count <= 160 then 
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), 50, a)
                set y = PolarY(GetUnitY(u), 50, a)
                call Effect("war3mapImported\\dash sfx 2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(30))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1.2))
                call Effect("war3mapImported\\wind3.mdx", x, y, 50, a, - 90, 0, GetRandomReal(1.5, 2.25), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            endif
        endif
        if count == 160 then 
            call Effect("war3mapImported\\RedRandomSlash.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\fire-boom-new-red.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2.45, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 165 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0DV')) * GetHeroStr(u, true))
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Ichigo_5.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitFacingEx(u, a, true)
        endif
        if count >= 20 and count <= 180 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, GetRandomReal(1, 1.75), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, GetRandomReal(1, 1.75), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.5, 2))
                set x = PolarX(GetUnitX(u), 50, a)
                set y = PolarY(GetUnitY(u), 50, a)
                call Effect("war3mapImported\\dash sfx 2.mdx", x, y, 50, a, 0, 0, 0.75, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(30))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1.2))
            endif
        endif
        if count == 170 then
            call SoundStart("war3mapImported\\Ichigo_5-1.mp3")
        endif
        if count == 180 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.2)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\fire-boom-new-red.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\bymutou_huozhu_siwang.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 0.6, 1, 255, 255, 255, PercentTo255(10))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 360 then 
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\IchigoGets.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\fire-boom-new-red.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-yumao-zhendi-paoxiao.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\bymutou_huozhu_siwang.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, PercentTo255(10))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Kuroi Getsuga Tenshou Red.mdl", GetUnitX(t), GetUnitY(t), - 400, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.25, 1.5, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 370 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ichigo_6.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 15 or count == 55 or count == 90 or count == 170 or count == 210 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 15 or count == 90 or count == 170 then
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\wind3.mdx", x, y, 50, a, - 90, 0, 1.25, 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
            set x = PolarX(GetUnitX(u), - 100, a)
            set y = PolarY(GetUnitY(u), - 100, a)
            call Effect("war3mapImported\\CF2.mdx", x, y, 0, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\AZ_PA_C.mdx", x, y, 50, a, 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]RedGlow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\AZ_hit-red.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 40 or count == 115 or count == 245 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 55 then
            call Effect("war3mapImported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\qqqqqr.mdx", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 180, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 180, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\rasengan_eff4.mdx", x, y, 50, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 75 or count == 190 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Ichigo_6-1.mp3")
        endif
        if count >= 15 and count <= 40 or count >= 55 and count <= 70 or count >= 90 and count <= 110 or count >= 170 and count <= 190 or count >= 220 and count <= 250 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count >= 30 and count <= 45 or count >= 60 and count <= 75 or count >= 95 and count <= 115 or count >= 200 and count <= 220 then
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
        if count >= 115 and count <= 170 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]SlashCirlce.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(0.25, 0.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
            endif
        endif
        if count == 115 or count == 125 or count == 135 or count == 145 or count == 155 or count == 165 then
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 180 then
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\dash sfx 2.mdl", x, y, 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(30))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\k4.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        endif
        if count == 220 then
            set x = PolarX(GetUnitX(u), - 100, a)
            set y = PolarY(GetUnitY(u), - 100, a)
            call Effect("war3mapImported\\CF2.mdx", x, y, 0, a, 0, 0, 0.35, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(u), - 700, a)
            set y = PolarY(GetUnitY(u), - 700, a)
            call Effect("war3mapImported\\az_yin_q1.mdx", x, y, 50, a, 0, 0, 0.6, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\fire-boom-new-red.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 245 then
            call SoundStart("war3mapImported\\Ichigo_6-2.mp3")
            call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapImported\\bymutou-hongse3.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 280 then
            call Effect("war3mapImported\\TX_White2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.55, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, PercentTo255(40), PercentTo255(40), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 290 then
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\yytc.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 290 and count <= 330 then
            set e = LoadEffectHandle(ht, zid, 100)
            set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            if dist > 140 then
                set x = PolarX(GetEffectX(e), dist / 10, a)
                set y = PolarY(GetEffectY(e), dist / 10, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 100, a)
                set y = PolarY(GetUnitY(t), - 100, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
            endif
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.02)
        endif
        if count == 330 then 
            call Effect("war3mapImported\\fire-boom-new-red.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 4, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.55, 1.5, 255, 255, 255, PercentTo255(20))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 335 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 10 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Ichigo_7.mp3")
            call DisableAbilityEx(u, 'A0FG', true)
            call UnitAddAbility(u, 'A0KN')
            call UnitMakeAbilityPermanent(u, true, 'A0KN')
            call Effect("war3mapImported\\FreezingRing.mdx", GetUnitX(u), GetUnitY(u), 100, 270, 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\DarkNova.mdx", GetUnitX(u), GetUnitY(u), 50, 270, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\Desecrate.mdx", GetUnitX(u), GetUnitY(u), 25, 270, 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\darkblast.mdx", GetUnitX(u), GetUnitY(u), 25, 270, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Dead Spirit by Deckai3.mdx", GetUnitX(u), GetUnitY(u), 25, 270, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\SuperShinyThingy2.mdx", GetUnitX(u), GetUnitY(u), 50, 270, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 then
            call PauseUnit(u, false)
        endif
        if count > 10 and GetUnitAbilityLevel(u, 'B008') == 0 and IsUnitAlive(u) then
            call UnitRemoveAbility(u, 'A0KN')
            call EnableAbilityEx(u, 'A0FG', true)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
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
        local effect e
    
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ichigo_7-1.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\az_red-xuanwo.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapImported\\bymutou-hongse3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(10))
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 20 or count == 260 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 50 then
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            set x = PolarX(GetUnitX(u), 40, a)
            set y = PolarY(GetUnitY(u), 40, a)
            call Effect("war3mapImported\\wind3.mdx", x, y, 150, a, - 90, 0, 2, 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", x, y, 50, a, - 90, 0, 1.3, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\yytc.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 50 and count <= 180 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count <= 80 then
                call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.025)
            endif
            set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            set a = GetSpecialEffectYaw(e)
            if dist > 200 then
                set x = PolarX(GetEffectX(e), dist / 20, a)
                set y = PolarY(GetEffectY(e), dist / 20, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
                set x = PolarX(GetEffectX(e), 30, a)
                set y = PolarY(GetEffectY(e), 30, a)
                call Effect("war3mapImported\\wind3.mdx", x, y, 150, a, - 90, 0, GetRandomReal(1, 2), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 160, a)
                set y = PolarY(GetUnitY(t), - 160, a)
                call SetEffectXY(e, x, y, 0)
                if count == 50 or count == 60 or count == 70 or count == 80 or count == 90 or count == 100 or count == 110 or count == 120 or count == 130 or count == 140 or count == 150 or count == 160 or count == 170 or count == 180 then
                    call Effect("war3mapImported\\qqqqqr.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
                    call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, GetRandomReal(1, 2), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
                    call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2.2, 1, 255, 255, 255, PercentTo255(70))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                endif
            endif
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Ichigo_7-2.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(t), 120, a)
            set y = PolarY(GetUnitY(t), 120, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(30), PercentTo255(30), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 120 and count <= 280 then
            set e = LoadEffectHandle(ht, zid, 100)
            set a = GetSpecialEffectYaw(e)
            set x = PolarX(GetUnitX(t), 120, a)
            set y = PolarY(GetUnitY(t), 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 180 then
            call SoundStart("war3mapImported\\Ichigo_7-3.mp3")
        endif
        if count >= 180 and count <= 280 then
            set e = LoadEffectHandle(ht, zid, 100)
            set a = GetSpecialEffectYaw(e)
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 160, a)
            set y = PolarY(GetUnitY(t), - 160, a)
            call SetEffectXY(e, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), 50, a)
                set y = PolarY(GetUnitY(t), 50, a)
                call Effect("war3mapImported\\qqqqqr.mdx", x, y, 150, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
                call Effect("war3mapImported\\qqqqqr.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.2))
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call Effect("war3mapImported\\wind3.mdx", x, y, 150, a, - 90, 0, GetRandomReal(1, 2), 1, 255, PercentTo255(50), PercentTo255(50), PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1.5))
                call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2.2, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1.2))
            endif
        endif
        if count == 280 then
            set e = LoadEffectHandle(ht, zid, 100)
            set a = GetSpecialEffectYaw(e)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\rasengan_eff4.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 4.45, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\IchigoGets.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\fire-boom-new-red.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, - 90, 0, 4, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\Explotion_red.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, - 90, 0, 0.8, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\bymutou-hongse3.mdx", GetUnitX(t), GetUnitY(t), 100, a + 180, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 290 then 
            call SoundStart("war3mapImported\\Ichigo_7-4.mp3")
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0BM' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0DM' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0DV' then
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

        if abilId == 'A0DW' then
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
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0FF' then
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

        if abilId == 'A0FG' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0KN' then
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