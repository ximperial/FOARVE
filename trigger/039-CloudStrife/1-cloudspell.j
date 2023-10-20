scope cloudspell initializer init
   
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
            call SoundStart("war3mapImported\\Cloud_1.mp3")
            call SoundStart("war3mapImported\\Anos_1-1.mp3")
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\[a]devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0IC'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\glchj.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\hakensaber2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(80))
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
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
            call SoundStart("war3mapImported\\Cloud_2.mp3")
            set x = PolarX(GetUnitX(t), - 600, a)
            set y = PolarY(GetUnitY(t), - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 17)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 5 or count == 15 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count <= 25 then 
            set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
        if count == 20 then
            call SetUnitAnimationByIndex(u, 18)
            call Effect("war3mapImported\\daoguang.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 25 then 
            call SoundStart("war3mapImported\\Akame_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\Dead Spirit by Deckai2.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\shunyihuoyan.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blue-slash-more.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]ZoroEf6.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]slashdigital.mdx", GetUnitX(t), GetUnitY(t), 50, a + 60, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 30 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0ID')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveUnit(LoadUnitHandle(ht, zid, 2))
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
        local real a = LoadReal(ht, zid, 0)
        local real x 
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Cloud_3.mp3")
            call SoundStart("war3mapImported\\Cloud_3-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\DarkLightningAura.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("", GetUnitX(u) , GetUnitY(u) , 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0IE')) * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\bowen1.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\SZBYAFB2.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Cloud_4.mp3")
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 10 or count == 25 or count == 40 or count == 55 or count == 70 or count == 85 then
            set a = randomAngle()
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimation(u, "attack")
            call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\daoguang-blue-hengsao.mdx", x, y, 50, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\blue-blink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blue-toushewu.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
        endif
        if count >= 10 and count <= 120 then 
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 110 or count == 120 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 17)
        endif
        if count >= 100 and count <= 130 then 
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
        if count == 125 then
            call SetUnitAnimationByIndex(u, 18)
        endif
        if count == 130 then 
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\BluefireBolt.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\HelGate1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\by_wood_effect_yuanbanlin_sand2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set i = 0
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(t), 350, i * 40)
                set y = PolarY(GetUnitY(t), 350, i * 40)
                call Effect("war3mapImported\\blue-blink.mdx", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 140 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0IF')) * GetHeroStr(u, true))
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
        local integer iterator2 = LoadInteger(ht, zid, 2)
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
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Cloud_5.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 2)
            call SetUnitFlyHeight(t, 500, 0)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 50 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 500, 0)
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count >= 50 and count <= 120 then
            set x = PolarX(GetUnitX(u), - 5, a)
            set y = PolarY(GetUnitY(u), - 5, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\HakenSaber2.mdx", GetUnitX(u), GetUnitY(u), 520, randomAngle(), 0, 0, GetRandomReal(0.85, 1.25), 1, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 510, randomAngle(), 0, 0, GetRandomReal(0.75, 1.35), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 510, randomAngle(), 0, 0, GetRandomReal(1.2, 1.9), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Cloud_5-1.mp3")
        endif
        if count >= 110 and count <= 380 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set a = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(100, 350), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(100, 350), a)
                call Effect("war3mapImported\\zhanji-blueX-shu2.mdx", x, y, GetRandomReal(550, 650), randomAngle(), GetRandomReal(- 45, - 30), 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DT112.mdx", x, y, GetRandomReal(450, 550), randomAngle(), GetRandomReal(- 45, - 30), 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\uissb.mdx", x, y, GetRandomReal(500, 550), randomAngle(), GetRandomReal(- 45, - 30), 0, GetRandomReal(2.5, 3.5), 1, 255, 255, 255, 255)
            endif
            set iterator2 = iterator2 + 1
            call SaveInteger(ht, zid, 2, iterator2)
            if iterator2 >= 10 then
                call SaveInteger(ht, zid, 2, 0)
                set a = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(150, 350), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(150, 350), a)
                call SetUnitXY(u, x, y, 0)
                call SetUnitFlyHeight(u, GetRandomReal(450, 600), 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimation(u, "attack")
                call ShakeCamera(0.5, GetOwningPlayer(u), 10)
                call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            endif
        endif
        if count == 390 then
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitFlyHeight(u, 1000, 0)
            call SetUnitAnimationByIndex(u, 20)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 400 then
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx", GetUnitX(t), GetUnitY(t), 500, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count >= 390 and count <= 410 then 
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 50, 0)
            if count >= 400 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 50, 0)
            endif
        endif
        if count == 410 then 
            call SoundStart("war3mapImported\\Cloud_5-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\cleave.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 420 then 
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
    
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_4.mp3")
            set x = PolarX(GetUnitX(t), - 600, a)
            set y = PolarY(GetUnitY(t), - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.85)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 5 or count == 15 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\ChargeBlue1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif
        if count <= 20 then 
            set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
        if count == 15 then
            call SoundStart("war3mapImported\\Cloud_6.mp3")
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Cloud_6-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call Effect("war3mapImported\\blueslash.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call Effect("war3mapImported\\uissb.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\uissb.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 20 and count <= 40 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Cloud_6-2.mp3")
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Cloud_6-3.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 600, 0)
            call SetUnitAnimationByIndex(u, 16)
        endif
        if count == 55 then
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdx", GetUnitX(t), GetUnitY(t), 600, a, - 315, 0, 1.35, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\DT112.mdx", GetUnitX(t), GetUnitY(t), 600, a, - 315, 0, 1.35, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 60 then 
            call SoundStart("war3mapImported\\Cloud_6-4.mp3")
            set x = PolarX(GetUnitX(t), 300, a)
            set y = PolarY(GetUnitY(t), 300, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 70 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveUnit(LoadUnitHandle(ht, zid, 2))
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
            call SoundStart("war3mapImported\\Cloud_7.mp3")
            set x = PolarX(GetUnitX(t), - 600, a)
            set y = PolarY(GetUnitY(t), - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 10 then
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 4, 4, 109, 130, 213, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapImported\\AFBWendyfeng.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 3, 255, 255, 255, 255)
        endif
        if count == 15 or count == 35 or count == 55 or count == 75 or count == 95 or count == 115 then
            call Effect("war3mapImported\\[A]RinRfire2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(0.9, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 125 or count == 135 or count == 145 or count == 155 or count == 165 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.45), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.85, 1))
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(1.2, 1.65), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 0.85))
            call Effect("war3mapImported\\[Plagiat]Effect392.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Cloud_7-1.mp3")
        endif
        if count >= 115 and count <= 135 or count >= 145 and count <= 170 then 
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
        if count == 130 or count == 165 then
            call SetUnitAnimation(u, "attack")
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 135 or count == 170 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\animeslashfinal.mdx", GetUnitX(u), GetUnitY(u), 120, a, 0, 0, 3, 1, 109, 130, 213, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\AFB_hudie2.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\afb214zj.mdx", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\afbzd.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 135 and count <= 155 or count >= 170 and count <= 200 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 180 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.8)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 180 or count == 190 or count == 200 or count == 210 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(80))
        endif
        if count >= 180 and count <= 215 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count < 195 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 16, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 12, 0)
            endif
        endif
        if count == 215 then 
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\ChuShou_Effect_Earth1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[a]sand3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]bloodex.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 230 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveUnit(LoadUnitHandle(ht, zid, 2))
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

        if abilId == 'A0IC' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0ID' then
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

        if abilId == 'A0IE' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0IF' then
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

        if abilId == 'A0IG' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0IH' then
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

        if abilId == 'A0II' then
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