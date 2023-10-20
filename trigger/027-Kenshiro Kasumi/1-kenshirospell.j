scope kenshirospell initializer init

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
            call SoundStart("war3mapImported\\Kenshiro_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 2.5)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
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
                    call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A065'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(1.15, 1.35), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.35))
                call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.9, 1.35))
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
            call SoundStart("war3mapImported\\Kenshiro_2.mp3")
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 110 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 0.7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindWeak(Thicker).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count <= 80 then
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
        endif
        if count == 80 then
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), - 90, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\az_hit-red-blade.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 80 and count <= 110 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 110 then
            set x = PolarX(GetUnitX(t), 100, a)
            set y = PolarY(GetUnitY(t), 100, a)
            call Effect("war3mapImported\\AZ_Jugg_E1.mdl", x, y, 100, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 180, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.75, 1.5, 255, 255, 255, PercentTo255(50))
        endif
        if count >= 100 and count <= 120 then
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
        if count >= 120 and count <= 160 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Kenshiro_2-1.mp3")
        endif
        if count == 130 or count == 160 or count == 180 or count == 210 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
        endif
        if count == 220 then
            call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        endif
        if count == 230 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A066')) * GetHeroStr(u, true))
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

    globals
        private unit RUnit = null
    endglobals

    private function period3_1 takes nothing returns nothing
        local unit t = GetEnumUnit()

        call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255) 
        call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(RUnit, t, (6 + 2 * GetUnitAbilityLevel(RUnit, 'A068')) * GetHeroStr(RUnit, true))
        call IssueImmediateOrderById(t, 851972)

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
        local unit d

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kenshiro_4-1.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 5)
            call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 4)
            call SaveUnitHandle(ht, zid, 10, d)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
            call SaveReal(ht, zid, 10, GetUnitFacing(u))
        endif
        if count == 1 or count == 50 or count == 100 or count == 150 or count == 200 then
            call VisionArea(GetOwningPlayer(u), 800, 3, GetUnitX(u), GetUnitY(u))
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 or count == 150 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count <= 180 then 
            set d = LoadUnitHandle(ht, zid, 10)
            set x = PolarX(GetUnitX(u), 13, a)
            set y = PolarY(GetUnitY(u), 13, a)
            call SetUnitXY(u, x, y, 1)
            call SetUnitXY(d, GetUnitX(u), GetUnitY(u), 0)
            set a = LoadReal(ht, zid, 10)
            call SetUnitFacing(u, a + count * 6)
            call SaveReal(ht, zid, 0, GetUnitFacing(d))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.35, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.25, 1.75))
                call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            endif
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    if not IsUnitInGroup(gUnit, g) then
                        call PauseUnit(gUnit, true)
                        call SetUnitInvulnerable(gUnit, true)
                        call GroupAddUnit(g, gUnit) 
                    endif
                endif
            endloop
            call GroupClear(gGroup)
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                call PauseUnit(gUnit, true)
                call SetUnitInvulnerable(gUnit, true)
            endloop
        endif
        if count == 180 then
            call SoundStart("war3mapImported\\Kenshiro_4-2.mp3")
        endif
        if count == 370 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 380 then
            set RUnit = u
            call ForGroup(g, function period3_1)
            call DestroyGroup(g)
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
        set d = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local unit d
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 200 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Kenshiro_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1800, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 25)
            call SetUnitTimeScale(u, 0.25)
            call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 4.5)
            call SaveUnitHandle(ht, zid, 10, d)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
            set x = PolarX(GetUnitX(u), 50, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 50, GetUnitFacing(u))
            call Effect("war3mapImported\\AZ_Alleria_R4.mdl", x, y, 50, a, 0, 0, 1.2, 6.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 or count == 210 then
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.4, 0.5), 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 0)
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count <= 200 then 
            set d = LoadUnitHandle(ht, zid, 10)
            call SaveReal(ht, zid, 0, GetUnitFacing(d))
            call SetUnitFacing(u, GetUnitFacing(d))
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectYaw(e, GetUnitFacing(d))
            set x = PolarX(GetUnitX(u), 50, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 50, GetUnitFacing(u))
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 3000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 200 then 
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 3, 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 1.75, 1, PercentTo255(70), PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call ForGroup(g, function ResetMoveSpeed)
            call GroupClear(g)
        endif
        if count >= 200 and count <= 300 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 30, a)
            set y = PolarY(GetEffectY(e), 30, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A068')) * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), 30, a)
                set y = PolarY(GetEffectY(e), 30, a)
                call Effect("war3mapImported\\wind3.mdl", x, y, 150, a, - 90, 0, GetRandomReal(1.5, 1.75), 1, PercentTo255(60), PercentTo255(60), 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.5, 1.75))
                set x = PolarX(GetEffectX(e), - 60, a)
                set y = PolarY(GetEffectY(e), - 60, a)
                call Effect("war3mapImported\\by_wood_huoyanchongji_2_2.mdl", x, y, 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 300 then
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set d = null
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
            call SoundStart("war3mapImported\\Kenshiro_5.mp3")
            call SetUnitAnimationByIndex(u, 28)
        endif
        if count == 70 or count == 390 then
            call SetUnitTimeScale(u, 0.01)
        endif
        if count == 90 then
            call SetUnitTimeScale(u, 1) 
        endif
        if count == 260 then
            call SetUnitTimeScale(u, 1.5) 
        endif
        if count <= 600 then 
            if count >= 100 and count <= 270 then 
                set x = PolarX(GetUnitX(t), 4, a)
                set y = PolarY(GetUnitY(t), 4, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count >= 300 and count <= 340 then
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 2)
            endif
            if count >= 100 and count <= 270 then
                set iterator = iterator + 1
                call SaveInteger(ht, GetHandleId(z), 1, iterator)
                if iterator >= 10 then 
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.35, 0.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
                    call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75)) 
                    call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                    call Effect("war3mapImported\\AZ_Jugg_E1.mdl", x, y, 100, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, 255) 
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                    call Effect("war3mapImported\\AZ_Jugg_E1.mdl", x, y, 100, a, 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, 255) 
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                    call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdl", x, y, 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70))) 
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                    call Effect("war3mapImported\\BY_Wood_GongChengSiPai_2.mdl", x, y, 100, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70))) 
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                    call Effect("war3mapImported\\qqqqqr.mdl", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                    call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a - 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a - 90)
                    call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 500, 500), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 500, 500), a)
                    set x = PolarX(x, GetRandomReal(- 200, 200), a + 90)
                    set y = PolarY(y, GetRandomReal(- 200, 200), a + 90)
                    call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", x, y, 100, randomAngle(), 0, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                endif
            endif
        endif
        if count == 600 then 
            call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 180, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5) 
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\jin xia.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 610 then 
            call SetUnitTimeScale(u, 1)
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
            call SoundStart("war3mapImported\\Kenshiro_6.mp3")
            call SetUnitAnimationByIndex(u, 5)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 100 or count == 120 then
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.35, 0.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 0.65)
            call Effect("war3mapImported\\animeslashfinal.mdl", GetUnitX(u), GetUnitY(u), 150, a + 180, - 160, 0, 1.75, 1.5, 255, 255, 0, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\Kenshiro_6-1.mp3")
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 120 then 
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
            call SoundStart("war3mapImported\\Kenshiro_7.mp3")
            call SetUnitAnimationByIndex(u, 18)
        endif
        if count == 1 or count == 20 then
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\WindWeak2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindWeak(Thicker).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
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
            call SetUnitAnimationByIndex(u, 23)
            call SetUnitTimeScale(u, 1.1)
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 then
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 150, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 150, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
        endif
        if count == 40 then
            set x = PolarX(GetUnitX(t), 120, a + 90)
            set y = PolarY(GetUnitY(t), 120, a + 90)
            call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", x, y, 100, a - 90, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", x, y, 100, a - 90, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 120, a - 90)
            set y = PolarY(GetUnitY(t), 120, a - 90)
            call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", x, y, 100, a + 90, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", x, y, 100, a + 90, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 50 then
            call SetUnitTimeScale(u, 0.1) 
        endif
        if count == 140 then
            call SetUnitTimeScale(u, 1)
        endif
        if count == 150 then
            set x = PolarX(GetUnitX(t), 120, a + 90)
            set y = PolarY(GetUnitY(t), 120, a + 90)
            call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", x, y, 100, a - 90, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", x, y, 100, a - 90, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 120, a - 90)
            set y = PolarY(GetUnitY(t), 120, a - 90)
            call Effect("war3mapImported\\hero_juggernaut_n4s_e_line.mdl", x, y, 100, a + 90, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", x, y, 100, a + 90, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 160 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

        if abilId == 'A065' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A066' then
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

        if abilId == 'A068' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            if dist > 600 then
                call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
                call TimerStart(z, 0.02, true, function period4)
            else
                call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
                call TimerStart(z, 0.02, true, function period3)
            endif
        endif

        if abilId == 'A069' then
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

        if abilId == 'A06F' then
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

        if abilId == 'A06G' then
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