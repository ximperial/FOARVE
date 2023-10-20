scope gonspell initializer init

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
            call SoundStart("war3mapImported\\Gon_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\MeteorGlow.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]ymjfireball.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A02G'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\dash sfx 2.mdl", x, y, 50, a, 0, 0, 0.65, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
                call Effect("war3mapImported\\wind2.mdl", x, y, 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapimported\\[a]explodeorange.mdx", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]asuma-explosion3.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Gon_2.mp3")
            call ShakeCamera(2, GetOwningPlayer(u), 5)
            call ShakeCamera(2, GetOwningPlayer(t), 5)
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 100 then
            set x = PolarX(GetUnitX(u), - 30, a + 120)
            set y = PolarY(GetUnitY(u), - 30, a + 120)
            call Effect("war3mapImported\\MeteorGlow.mdl", x, y, 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\WindNewFaw3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Gon_2-1.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count == 120 then
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a) 
            call Effect("war3mapimported\\File0000 (85).mdx", x, y, 100, a - 20, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\File0000 (85).mdx", x, y, 100, a - 20, 0, 0, 2.25, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count >= 110 and count <= 130 then
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
        if count == 130 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 135 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A02J')) * GetHeroStr(u, true))
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Gon_4.mp3")
            call ShakeCamera(7, GetOwningPlayer(u), 10)
            call ShakeCamera(7, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, 3)
            set x = PolarX(GetUnitX(u), - 30, a + 120)
            set y = PolarY(GetUnitY(u), - 30, a + 120)
            call Effect("war3mapimported\\[A]ymjfireball.mdx", x, y, 100, a, 0, 0, 1, 6.2, 255, 255, 255, 255)
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Gon_4-1.mp3")
        endif
        if count <= 370 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), - 30, a + 120)
                set y = PolarY(GetUnitY(u), - 30, a + 120)
                call Effect("war3mapImported\\MeteorGlow.mdl", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                if count <= 320 then
                    call Effect("war3mapImported\\WindExploreEffect(Bigger).mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(1.25, 1.75), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
                    call Effect("war3mapImported\\kaizokusfxbyvalk4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(70, 90)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                endif
            endif
        endif
        if count >= 320 and count <= 360 then
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
        if count == 350 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count == 360 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\[A]fire-zhendi-guangzhu.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion2.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]GonFef.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 365 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A02K')) * GetHeroStr(u, true))
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Gon_5.mp3")
            call ShakeCamera(16, GetOwningPlayer(u), 5)
            call ShakeCamera(16, GetOwningPlayer(t), 5)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapimported\\Adult Gohan (Piccolo's Clothing).mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 17.1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 9)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call Effect("war3mapimported\\62.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 40 then 
            call SoundStart("war3mapImported\\Gon_5-1.mp3")
            call SoundStart("war3mapImported\\Gon_5-8.mp3")
        endif
        if count == 70 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 3)
            call SetSpecialEffectTimeScale(e, 0.3)
        endif
        if count == 150 then
            set x = PolarX(GetUnitX(u), - 30, a + 120)
            set y = PolarY(GetUnitY(u), - 30, a + 120)
            call Effect("war3mapimported\\[A]AceBall.mdx", x, y, 100, a, 0, 0, 1, 11, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count == 170 then
            call SoundStart("war3mapImported\\Gon_5-2.mp3")
        endif
        if count == 330 then
            call SoundStart("war3mapImported\\Gon_5-3.mp3")
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 4.2)
            call SetSpecialEffectZ(e, GetEffectZ(e) + 120)
        endif
        if count >= 330 and count <= 390 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) - 0.07)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 2) 
        endif
        if count == 400 then
            call SoundStart("war3mapImported\\Gon_5-4.mp3")
        endif
        if count >= 40 and count <= 780 then
            if count <= 400 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 5, 0)
            endif
            if count >= 420 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 5, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.45, 2.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
                set e = LoadEffectHandle(ht, zid, 100)
                set x = PolarX(GetUnitX(u), - 30, a + 120)
                set y = PolarY(GetUnitY(u), - 30, a + 120)
                if count >= 330 and count <= 390 then
                    call Effect("war3mapimported\\[A]supershinythingyGon.mdx", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1.75, 2.25), 1.5, 255, 255, 255, 255)
                else
                    call Effect("war3mapimported\\[A]supershinythingyGon.mdx", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 560 then 
            call SoundStart("war3mapImported\\Gon_5-5.mp3")
        endif
        if count == 630 then
            call SoundStart("war3mapImported\\Gon_5-6.mp3")
        endif
        if count == 690 then 
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 6)
            call SetSpecialEffectTimeScale(e, 0.4)
        endif
        if count == 750 then
            call SoundStart("war3mapImported\\Gon_5-7.mp3")
        endif
        if count == 780 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\[A]fire-zhendi-guangzhu.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\SuperBigExplosion2.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]GonFef.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]boom-blue-zhendi_orange.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 820 and count <= 860 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            endif
        endif
        if count == 860 then
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
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
        set e = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2
        local real y2
        local real dist = LoadReal(ht, zid, 2)
        local real a = LoadReal(ht, zid, 3)
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e
        local unit d

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Gon_6.mp3")
            call ShakeCamera(5, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1500, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            set x2 = PolarX(GetUnitX(u), - 30, a + 120)
            set y2 = PolarY(GetUnitY(u), - 30, a + 120)
            call Effect("war3mapImported\\[A]ymjfireball.mdl", x2, y2, 100, a, 0, 0, 1.5, 5.6, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), 0)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 5)
            call SaveUnitHandle(ht, zid, 101, d)
            call SaveBoolean(ht, StringHash("GonF"), GetHandleId(d), true)
            call SaveReal(ht, StringHash("GonF_X"), GetHandleId(d), x)
            call SaveReal(ht, StringHash("GonF_Y"), GetHandleId(d), y)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 20 or count == 60 or count == 100 or count == 140 or count == 180 or count == 220 then
            set d = LoadUnitHandle(ht, zid, 101)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Gon_6-1.mp3")
        endif
        if count <= 240 then
            set e = LoadEffectHandle(ht, zid, 100)
            set d = LoadUnitHandle(ht, zid, 101)
            if x != LoadReal(ht, StringHash("GonF_X"), GetHandleId(d)) or y != LoadReal(ht, StringHash("GonF_Y"), GetHandleId(d)) then
                set x = LoadReal(ht, StringHash("GonF_X"), GetHandleId(d))
                set y = LoadReal(ht, StringHash("GonF_Y"), GetHandleId(d))
                set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
                set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
                if dist <= 1000 then
                    call SaveReal(ht, zid, 0, x)
                    call SaveReal(ht, zid, 1, y)
                    call SaveReal(ht, zid, 2, dist)
                    call SaveReal(ht, zid, 3, a)
                else
                    set x = PolarX(GetUnitX(u), 1000, a)
                    set y = PolarY(GetUnitY(u), 1000, a)
                    set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
                    set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
                    call SaveReal(ht, zid, 0, x)
                    call SaveReal(ht, zid, 1, y)
                    call SaveReal(ht, zid, 2, dist)
                    call SaveReal(ht, zid, 3, a)
                endif
            endif
            call SetUnitFacing(u, a)
            call SetSpecialEffectYaw(e, a)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
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
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.45, 2.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
                set x2 = PolarX(GetUnitX(u), - 30, a + 120)
                set y2 = PolarY(GetUnitY(u), - 30, a + 120)
                call Effect("war3mapImported\\MeteorGlow.mdl", x2, y2, 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
            endif
        endif
        if count == 240 then
            call ForGroup(g, function ResetMoveSpeed)
            call GroupClear(g)
        endif
        if count >= 240 and count <= 270 then
            set x2 = PolarX(GetUnitX(u), dist / 30, a)
            set y2 = PolarY(GetUnitY(u), dist / 30, a)
            call SetUnitXY(u, x2, y2, 1)
            set e = LoadEffectHandle(ht, zid, 100)
            set x2 = PolarX(GetUnitX(u), - 30, a + 120)
            set y2 = PolarY(GetUnitY(u), - 30, a + 120)
            call SetEffectXY(e, x2, y2, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x2, y2))
        endif
        if count == 260 then
            call SoundStart("war3mapImported\\Gon_6-2.mp3")
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 270 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\[a]explodeorange.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\AceRef.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectMatrixScale(bj_lastCreatedEffect, 1.5, 1.5, 1)
            call Effect("war3mapimported\\AceRef.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectMatrixScale(bj_lastCreatedEffect, 3, 3, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\[A]GonFef.mdx", GetUnitX(u), GetUnitY(u), 200, randomAngle(), 0, 0, 3.5, 1.5, 255, 255, 255, 255)
        endif
        if count >= 270 and count <= 280 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true))
                    set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(gUnit), GetUnitY(gUnit))
                    call knockbackUnit(gUnit, 600, a, 0.6)
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 280 then
            call SelectUnitForPlayerSingle(u, GetOwningPlayer(u))
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
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
        set d = null
    endfunction

    private function period6 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Gon_7.mp3")
            call ShakeCamera(4, GetOwningPlayer(u), 5)
            call ShakeCamera(4, GetOwningPlayer(t), 5)
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count <= 160 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapimported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.45, 2.75), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
                set x = PolarX(GetUnitX(u), - 30, a + 120)
                set y = PolarY(GetUnitY(u), - 30, a + 120)
                call Effect("war3mapimported\\[A]LotusStar.mdx", x, y, 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(u), - 30, a + 120)
                set y = PolarY(GetUnitY(u), - 30, a + 120)
                call Effect("war3mapimported\\A(BlackPurple).mdx", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 190 then 
            call SoundStart("war3mapImported\\Gon_7-1.mp3")
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count >= 170 and count <= 200 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif 
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = PolarX(GetUnitX(u), - 30, a + 120)
                set y = PolarY(GetUnitY(u), - 30, a + 120)
                call Effect("war3mapimported\\A(BlackPurple).mdx", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 200 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapimported\\[A]SuperBigExpPurpleLow1.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]AsumaEXP4.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]TohkaExp.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\[A]ExpPurple.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 210 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
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

        if abilId == 'A02G' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A02J' then
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

        if abilId == 'A02K' then
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
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A02M' then
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

        if abilId == 'A02N' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call SaveReal(ht, GetHandleId(z), 2, Distance(GetUnitX(u), GetUnitY(u), x, y))
            call SaveReal(ht, GetHandleId(z), 3, Angle(GetUnitX(u), GetUnitY(u), x, y))
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A02O' then
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

    private function action2 takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local real x = GetOrderPointX()
        local real y = GetOrderPointY()
        if LoadBoolean(ht, StringHash("GonF"), GetHandleId(u)) then 
            if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
                call SaveReal(ht, StringHash("GonF_X"), GetHandleId(u), x)
                call SaveReal(ht, StringHash("GonF_Y"), GetHandleId(u), y)
            endif
        endif
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, function action2)
    endfunction
endscope