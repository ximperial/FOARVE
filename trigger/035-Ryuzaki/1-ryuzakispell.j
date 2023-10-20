scope ryuzakispell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ryuzaki_1.mp3")
            call SoundStart("war3mapImported\\Ryuzaki_1-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then 
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
            call Effect("war3mapImported\\[a]sandpoff123.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\[a]t_icesparks.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0G5'))
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
            call SoundStart("war3mapImported\\Ryuzaki_2.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 5 or count == 15 then
            call Effect("war3mapImported\\Chongfengnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
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
        if count == 20 then
            call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 30 then 
            call SoundStart("war3mapImported\\Ryuzaki_2-1.mp3")
            call Effect("war3mapImported\\hit.mdx", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\djcjb.mdx", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\zxd2.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[a]t_icesparks.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 35 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0G6')) * GetHeroStr(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 then
            call SoundStart( "war3mapImported\\Ryuzaki_3.mp3" )
            call SoundStart( "war3mapImported\\Ryuzaki_3-1.mp3" )
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.6, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 10 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 800, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlly(gUnit, GetOwningPlayer(u)) and IsUnitHero(gUnit) and IsUnitAlive(gUnit) then
                    call SaveInteger(ht, StringHash("RyuzakiE"), GetHandleId(gUnit), GetUnitAbilityLevel(u, 'A0G7'))
                    call UnitAddAbility(gUnit, 'A0G8')
                    call UnitMakeAbilityPermanent(gUnit, true, 'A0G8')
                    call LinkSpell(gUnit, 'A0G8', 15, true)
                    call LinkSpell(gUnit, 'B00L', 15, true)
                endif
            endloop
            call GroupClear(gGroup)
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
            call SoundStart("war3mapImported\\Ryuzaki_4.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.5)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 15 or count == 35 or count == 50 or count == 80 then
            call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.25), 2, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.45, 0.65))
        endif
        if count == 10 or count == 25 or count == 40 or count == 55 or count == 70 or count == 90 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Ryuzaki_4-1.mp3")
            else
                call SoundStart("war3mapImported\\Ryuzaki_4-2.mp3")
            endif
        endif
        if count >= 5 and count <= 105 then 
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call SetUnitAnimation(u, "attack")
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\hit.mdx", x, y, GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
                call Effect("war3mapImported\\hitwave.mdx", x, y, GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            endif
        endif
        if count == 110 then 
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 120 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0G9')) * GetHeroStr(u, true))
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ryuzaki_5.mp3")
            call SoundStart("war3mapImported\\Ryuzaki_5-1.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\devilslam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 80 then
            call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.9, 1.3), 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.6))
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count == 35 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 25 or count == 35 or count == 50 or count == 65 then
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Fgo_SuiPian_1_2.mdx", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.35)
        endif
        if count >= 20 and count <= 80 then 
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
                call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, GetRandomReal(1.5, 2.25), 1.5, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 80 then 
            call SoundStart("war3mapImported\\Ryuzaki_3-1.mp3")
            call Effect("war3mapImported\\pltx.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\djcjb.mdx", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Ryuzaki_5-2.mp3") 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ryuzaki_6.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then
            call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u) + 50, randomAngle(), 0, 0, GetRandomReal(1, 1.45), 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.35, 0.6))
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Ryuzaki_4-1.mp3")
            set i = 0
            loop
                exitwhen i > 1
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
                call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                set i = i + 1
            endloop
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Ryuzaki_6-1.mp3")
            set i = 0
            loop
                exitwhen i > 1
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
                call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                set i = i + 1
            endloop
        endif
        if count == 65 then
            call SoundStart("war3mapImported\\Ryuzaki_4-2.mp3")
            set i = 0
            loop
                exitwhen i > 1
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\hit.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 350), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 100, 100), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 100, 100), randomAngle())
                call Effect("war3mapImported\\hitwave.mdx", x, y, GetUnitFlyHeight(u) + GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(1.75, 2.65), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                set i = i + 1
            endloop
        endif
        if count <= 70 then 
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            if count <= 40 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 3, 0)
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 3, 0)
            endif
            if count >= 40 and count <= 60 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 4, 0)
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 4, 0)
            endif
            if count >= 60 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            endif
        endif
        if count == 75 then
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
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
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 70 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Ryuzaki_7.mp3")
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count <= 70 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", u, "head"))
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.65), 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count == 70 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call IssueImmediateOrderById(u, 851972)
            call IssueImmediateOrderById(t, 851972)
            call UnitAddAbility(t, 'A0GD')
            call UnitMakeAbilityPermanent(t, true, 'A0GD')
            call LinkSpell(t, 'A0GD', 7, true)
            call LinkSpell(t, 'B018', 7, true)
        endif
        if (count > 70 and GetUnitAbilityLevel(t, 'B018') == 0) or (count > 70 and not IsUnitAlive(t)) then 
            call SoundStart("war3mapImported\\Ryuzaki_7-1.mp3")
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

        if abilId == 'A0G5' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0G6' then
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

        if abilId == 'A0G7' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0G9' then
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

        if abilId == 'A0GA' then
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

        if abilId == 'A0GB' then
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

        if abilId == 'A0GC' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
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

    private function buffperiod1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer lvl = LoadInteger(ht, zid, 0)

        if GetUnitAbilityLevel(u, 'B00L') == 0 then
            call UnitAddBonus(u, BONUS_HEALTH_REGEN, - 5 * lvl)
            call UnitAddBonus(u, BONUS_MOVESPEED, - 0.03 * lvl)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function action2 takes nothing returns nothing
        local timer z
        local unit u = GetTriggerBuffSourceUnit()
        local integer buffid = GetBuffTypeId(GetTriggerBuff())
        local integer lvl = LoadInteger(ht, StringHash("RyuzakiE"), GetHandleId(u))

        if buffid == 'B00L' then
            set z = CreateTimer()
            call UnitAddBonus(u, BONUS_HEALTH_REGEN, 5 * lvl)
            call UnitAddBonus(u, BONUS_MOVESPEED, 0.03 * lvl)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, lvl)
            call TimerStart(z, 0.1, true, function buffperiod1)
        endif

        set z = null
        set u = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_BUFF_RECEIVED, function action2)
    endfunction
endscope