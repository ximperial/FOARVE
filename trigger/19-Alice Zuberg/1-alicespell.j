scope alicespell initializer init
   
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
            call SoundStart("war3mapImported\\Alice_1.mp3")
            call SoundStart("war3mapImported\\Kirito_1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call SetSoundVolume(DummySound, 100)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u) , GetUnitY(u) , 100, a , 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroAgi(u, true) + 90 * GetUnitAbilityLevel(u, 'A0I4'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\effect_alice01.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(1.5, 2.5) , 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\effect_alice08.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\wind3.mdx", GetUnitX(u) , GetUnitY(u) , 100, a , -90, 0, GetRandomReal(1, 1.5) , 1, 255, 204, 153, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
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
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alice_2.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 0.6)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 20 or count == 30 or count == 40 or count == 50 then
            call SetUnitAnimationByIndex(u, GetRandomInt(3, 4))
        endif
        if count == 30 or count == 40 then
            call SoundStart("war3mapImported\\Aya_3-1.mp3")
        endif
        if count >= 20 and count <= 60 then
            set x = PolarX(GetUnitX(t) , 10, a)
            set y = PolarY(GetUnitY(t) , 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1.3, 1.7) , 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, GetRandomReal(1.5, 2.5) , 1, 255, 178, 102, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , GetRandomReal(-30, -20) , 0, GetRandomReal(1.5, 2.5) , 1, 255, 178, 102, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                call Effect("war3mapimported\\[A]blue-qiliu-daoguang_2.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , GetRandomReal(20, 30) , 0, GetRandomReal(1.5, 2.5) , 1, 255, 178, 102, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
        endif
        if count == 65 then
            call SoundStart("war3mapImported\\Aya_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapimported\\Tanziro_Skill.mdx", GetUnitX(u) , GetUnitY(u) , 100, a + 220, 0, 0, 2.5, 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\lb_hdg.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1, 1, 255, 178, 102, 255)
            call Effect("war3mapimported\\BloodEX-Special-2.mdx", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 75 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0I5')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alice_3.mp3")
            call SoundStart("war3mapImported\\Anos_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call Effect("war3mapimported\\blackblink.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t) , -600, a)
            set y = PolarY(GetUnitY(t) , -600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.75)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\a_new_k3.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count <= 30 then
            set dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 20, a)
                set y = PolarY(GetUnitY(u) , dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
            endif
        endif
        if count == 25 then
            call Effect("war3mapimported\\[a]zoroef.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 1.8, 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\[a]zoroef.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 1.6, 1, 255, 178, 102, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[DoFT]az_pafeathermoon_b-orange.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Alice_3-1.mp3")
            call SoundStart("war3mapImported\\Escanor_3-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetSoundVolume(DummySound, 100)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\[Plagiat]Effect249.mdx", GetUnitX(t) , GetUnitY(t) , 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 35 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0I6')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a2
        local real x
        local real y
        local real x2 
        local real y2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 100 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Alice_4.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call ShakeCamera(2, GetOwningPlayer(u) , 10)
            call ShakeCamera(2, GetOwningPlayer(t) , 10)
            call CinematicFilterGenericEx(GetOwningPlayer(u) , 3, BLEND_MODE_BLEND, "war3mapImported\\AliceR.tga", 255, 255, 255, 255, 255, 255, 255, 0)
            call CinematicFilterGenericEx(GetOwningPlayer(t) , 3, BLEND_MODE_BLEND, "war3mapImported\\AliceR.tga", 255, 255, 255, 255, 255, 255, 255, 0)
            call SetUnitAnimationByIndex(u, 10)
            call Effect("war3mapimported\\zygz.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 3, 4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.25)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 4, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6) 
            call Effect("war3mapimported\\reimuLS-yellow.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 4, 255, 255, 255, 255)
            call SaveReal(ht, zid , 0, GetUnitX(t))
            call SaveReal(ht, zid , 1, GetUnitY(t))
        endif
        if count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                call Effect("war3mapimported\\effect_alice08.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
                call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(u) , GetUnitY(u) , 150 , randomAngle() , 0, 0, GetRandomReal(0.6, 1) , 1, 255, 178, 102, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(u) , GetUnitY(u) , 100 , randomAngle() , 0, 0, GetRandomReal(0.6, 1) , 1, 255, 178, 102, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count == 120 or count == 150 or count == 180 then
            call SoundStart("war3mapImported\\Aya_5-2.mp3")
        endif
        if count >= 120 and count <= 200 then
            set x = LoadReal(ht, zid , 0)
            set y = LoadReal(ht, zid , 1)
            call GroupEnumUnitsInRange(gGroup, x , y , 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, ((5 + 2 * GetUnitAbilityLevel(u, 'A0I7')) * GetHeroAgi(u, true)) / 80)
                    call stunUnit(gUnit, 0.05)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid , 1, 0)
                set a2 = randomAngle()
                set x2 = PolarX(x, GetRandomReal(-300, 300) , a2)
                set y2 = PolarY(y, GetRandomReal(-300, 300) , a2)
                call Effect("war3mapimported\\effect_alice04.mdx", x2, y2, 250, randomAngle() , 0, 0, 0.6, 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 200 then 
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local integer i
        local group g2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alice_5.mp3")
            call VisionArea(GetOwningPlayer(u) , 1500, 3, GetUnitX(u) , GetUnitY(u))
            call ShakeCamera(1.5, GetOwningPlayer(u) , 15)
            call CinematicFilterGenericEx(GetOwningPlayer(u) , 3, BLEND_MODE_BLEND, "war3mapImported\\AliceT.tga", 255, 255, 255, 255, 255, 255, 255, 0)
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 6, 255, 255, 255, PercentTo255(70))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\moonwrath-yellow.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(u) , 20, a)
            set y = PolarY(GetUnitY(u) , 20, a)
            call Effect("war3mapImported\\AliceBurstSFXbyvalk.mdx", x , y , 200, a, 0, 0, 2.5, 7, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call AnimEffect(bj_lastCreatedEffect, 1, 1)
            call TimeScaleEffect(bj_lastCreatedEffect, 1, 1)
            call AnimEffect(bj_lastCreatedEffect, 2, 6)
            set i = 0
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(u) , 300, i * 45)
                set y = PolarY(GetUnitY(u) , 300, i * 45)
                call Effect("war3mapImported\\SFXBreakGround.mdx", x , y , GetRandomReal(25, 50) , randomAngle() , 0, 0, 0.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(2, 4))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
                set i = i + 1
            endloop
        endif
        if count == 10 then
            call Effect("war3mapImported\\zxd2.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , -90, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\zxd2.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , -90, 0, 5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 15 then
            call Effect("war3mapImported\\XZDL.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 1 or count == 20 or count == 30 or count == 50 then
            call Effect("war3mapImported\\AliceSpinDustYellow.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1.2, 1.5) , 1.5, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
        if count == 50 then
            set x = PolarX(GetUnitX(u) , 20, a)
            set y = PolarY(GetUnitY(u) , 20, a)
            call Effect("war3mapImported\\AliceKameSFX3.mdx", x , y , 200, a , 0, 0, 0.9, 5.4, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
        endif
        if count >= 60 and count <= 300 then
            set g2 = CreateGroup()
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            set i = 1
            loop
                exitwhen i > 10
                set x = PolarX(GetUnitX(u) , 140 * i, a)
                set y = PolarY(GetUnitY(u) , 140 * i, a)
                call GroupEnumUnitsInRange(g2, x , y , 300, null)
                loop
                    set gUnit = GroupForEachUnit(g2)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) then
                        if not IsUnitInGroup(gUnit, g) then
                            call DamageUnit(u, gUnit, 14 * GetHeroAgi(u, true) / 240)
                            call GroupAddUnit(g, gUnit)
                        endif
                        call stunUnit(gUnit, 0.05)
                    endif
                endloop
                if count == 60 or iterator == 20 then
                    call Effect("war3mapImported\\valkexp2.mdx", x , y , 0, randomAngle() , 0, 0, GetRandomReal(0.85, 1.25) , 1.5, 255, 255, 255, PercentTo255(GetRandomReal(70, 90)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 0.9))
                endif
                
                set i = i + 1
            endloop
            call GroupClear(g)
            call DestroyGroup(g2)
            
            if iterator >= 20 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\effect_alice05.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, GetRandomReal(1, 2) , 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.7))
            endif
        endif
        if count == 305 then
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
        set g2 = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local integer count = LoadInteger(ht, zid , 0)

        if not IsUnitInvulnerable(u) then 
            set count = count + 1
            call SaveInteger(ht, zid , 0, count)
        endif

        if count >= 50 or not IsUnitAlive(u) or GetUnitAbilityLevel(u, 'B00U') == 0 then 
            if not HaveSavedBoolean(ht, StringHash("AliceF") , GetHandleId(u)) then
                call StopSound(LoadSoundHandle(ht, zid , 1) , true, false)
            else
                call RemoveSavedBoolean(ht, StringHash("AliceF") , GetHandleId(u))
            endif
            call UnitRemoveAbility(u, 'A0IA')
            call UnitRemoveAbility(u, 'B00U')
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real x
        local real y
        local real x2
        local real y2
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alice_7.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.5, 3, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapimported\\oxgz-alice.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 0.1, 3, 255, 255, 255, PercentTo255(90))
            call SaveEffectHandle(ht, zid , 100, bj_lastCreatedEffect)
        endif
        if count <= 50 then
            set e = LoadEffectHandle(ht, zid , 100)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.07)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , count * 14, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call lockUnit(gUnit, 2 - count * 0.02, false)
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Alice_7-1.mp3")
        endif
        if count == 60 then
            set e = LoadEffectHandle(ht, zid , 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.8)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 700, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 8 * GetHeroAgi(u, true))
                endif
            endloop
            call GroupClear(gGroup)
            call Effect("war3mapimported\\AliceFSFX1.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 105 then 
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
        set e = null
    endfunction

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0I4' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0I5' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0I6' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0I7' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0I8' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0I9' then
            set z = CreateTimer()
            call SoundStart("war3mapImported\\Alice_6.mp3")
            call SaveSoundHandle(ht, GetHandleId(z) , 1, DummySound)
            call UnitAddAbility(u, 'A0IA')
            call UnitMakeAbilityPermanent(u, true, 'A0IA')
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveBoolean(ht, StringHash("AliceF") , GetHandleId(u) , true)
            call TimerStart(z, 0.1, true, function period6)
        endif

        if abilId == 'A0IB' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
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