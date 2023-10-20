scope salterspell initializer init

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
            call SoundStart("war3mapImported\\SAlter_1.mp3")
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0JC'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\getsugatrap.mdl", x, y, 10, a, - 25, 0, 2.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\darkexcalibureffect1.mdl", x, y, 0, a, 0, 25, 0.9, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\darkexcalibureffect1.mdl", x, y, 0, a, 0, - 25, 0.9, 1, 255, 255, 255, 255)
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
            call SoundStart("war3mapImported\\SAlter_2.mp3")
            call SetUnitAnimationByIndex(u, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count == 10 or count == 20 or count == 30 or count == 50 or count == 70 or count == 105 or count == 140 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            call Effect("war3mapImported\\devilslam.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count == 30 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.15)
        endif
        if count == 40 then
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\daoguang_purp.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\baojiang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count >= 40 and count <= 60 or count >= 75 and count <= 95 or count >= 110 and count <= 130 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            if count <= 95 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            endif
        endif
        if count == 65 or count == 100 or count == 135 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, GetRandomInt(8, 9))
            call SetUnitTimeScale(u, 1.3)
        endif
        if count == 75 then
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 60, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\daoguang_purp.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\baojiang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 110 then
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\daoguang_purp.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\baojiang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 145 then
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a, - 225, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\daoguang_purp.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\baojiang.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 155 then
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count >= 145 and count <= 165 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        endif
        if count == 165 then
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u) / 2, a, - 225, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\[A]AsumaEXP4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[DoFT]t_thunderclapcaster.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\DashKirei.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 170 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0JD')) * GetHeroStr(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\SAlter_4.mp3")
            call Effect("war3mapImported\\devilslam.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\saberalterqc.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, - 180, 5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, a + 90, - 40, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, a - 90, - 40, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 55 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 60 or count == 65 or count == 70 or count == 75 or count == 80 or count == 85 or count == 90 or count == 95 or count == 100 then
            call Effect("war3mapImported\\SAlterEffect1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.75), 1.5, 255, 255, 255, 255)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\[A]HibikiSlam_purp.mdl", GetUnitX(u), GetUnitY(u), 10, a, 0, 0, 4.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 110 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            set i = 1
            loop
                exitwhen i > 4
                set x = PolarX(GetUnitX(u), 250 * i, a)
                set y = PolarY(GetUnitY(u), 250 * i, a)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", x, y, 0, a, 0, 0, 0.8, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\darkexcalibureffect1.mdl", x, y, 0, a, - 20, 0, 0.9, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                set i = i + 1
            endloop
        endif
        if count >= 30 and count <= 110 then
            set x = PolarX(GetUnitX(t), 8, a)
            set y = PolarY(GetUnitY(t), 8, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.15, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            endif
        endif
        if count == 120 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0JF')) * GetHeroStr(u, true))
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
        local integer i
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
            call SoundStart("war3mapImported\\SAlter_5.mp3")
            call ShakeCamera(7, GetOwningPlayer(u), 5)
            call ShakeCamera(7, GetOwningPlayer(t), 5)
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
        endif
        if count == 250 then
            set i = 0
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(u), 300, i * 45)
                set y = PolarY(GetUnitY(u), 300, i * 45)
                call Effect("war3mapImported\\SFXBreakGround.mdx", x, y, GetRandomReal(25, 50), randomAngle(), 0, 0, 0.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(2, 4))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
                set i = i + 1
            endloop
        endif
        if count <= 250 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.9, 1.6), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            endif
        endif
        if count == 350 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\Dash Sfx 2.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 400 or count == 480 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, GetRandomInt(8, 9))
            call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.55), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, - 180, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\36-purp.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), GetRandomReal(- 40, 40), 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 420 or count == 500 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, GetRandomInt(8, 9))
            call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.55), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\36-purp.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), GetRandomReal(- 40, 40), 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 440 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, GetRandomInt(8, 9))
            call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.55), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 20, - 180, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\36-purp.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), GetRandomReal(- 40, 40), 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 460 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, GetRandomInt(8, 9))
            call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.8, 1.55), 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 20, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\36-purp.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.75), 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), GetRandomReal(- 40, 40), 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 350 and count <= 500 then
            if dist > 160 then
                set x = PolarX(GetUnitX(u), 20, a)
                set y = PolarY(GetUnitY(u), 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 140, a)
                set y = PolarY(GetUnitY(t), - 140, a) 
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1.35), 1, 255, 0, 127, PercentTo255(GetRandomReal(60, 80)))
                call Effect("war3mapImported\\cf2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.35), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count >= 500 and count <= 530 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 530 or count == 540 or count == 550 or count == 560 or count == 570 or count == 580 or count == 590 or count == 600 or count == 610 or count == 620 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            if count != 530 then
                call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
                set x = PolarX(GetUnitX(t), 740, randomAngle())
                set y = PolarY(GetUnitY(t), 740, randomAngle())
                call SetUnitXY(u, x, y, 0)
            endif
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.3)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\a_new_k3.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 535 or count == 545 or count == 555 or count == 565 or count == 575 or count == 585 or count == 595 or count == 605 or count == 615 or count == 625 then
            call Effect("war3mapImported\\akiha claw black.mdl", GetUnitX(u), GetUnitY(u), 100, GetUnitFacing(u), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
        endif
        if count >= 530 and count <= 630 then
            set x = PolarX(GetUnitX(u), 120, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 120, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 640 then
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\az_airfloww12.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 3, 255, 92, 92, PercentTo255(90))
        endif
        if count == 650 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 640 or count == 700 or count == 740 then
            call Effect("war3mapImported\\saberalterqc.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 640 or count == 650 or count == 660 or count == 670 or count == 680 or count == 690 or count == 700 or count == 710 or count == 720 or count == 730 then
            call Effect("war3mapImported\\SAlterEffect1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.75), 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\2953.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 92, 92, 255)
        endif
        if count == 740 then
            call ShakeCamera(2, GetOwningPlayer(u), 15)
            call ShakeCamera(2, GetOwningPlayer(t), 15)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\exshexianblack.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 2.5, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.6, 0.4)
        endif
        if count == 750 or count == 760 or count == 770 or count == 780 or count == 790 or count == 800 or count == 810 or count == 820 then
            set i = 1
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(u), 300 * i, a)
                set y = PolarY(GetUnitY(u), 300 * i, a)
                call Effect("war3mapImported\\FantasyBattle (1582).mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                set i = i + 1
            endloop
        endif
        if count >= 740 and count <= 820 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 825 then
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
        set e = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local group g2 = LoadGroupHandle(ht, zid, 2)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\SAlter_6.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1200, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\nlygpz.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\bossbirth.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\saberalterqc.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 then
            call Effect("war3mapImported\\SAlterEffect1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.75), 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\2953.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 92, 92, 255)
        endif
        if count == 15 or count == 100 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 70 then
            call SetUnitTimeScale(u, 2)
        endif
        if count == 75 then
            call SoundStart("war3mapImported\\SAlter_6-1.mp3")
        endif
        if count == 80 then
            call ShakeCamera(1.5, GetOwningPlayer(u), 15)
            call Effect("war3mapImported\\bossbirth.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\saberalterqc.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 80 and count <= 120 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 45, a)
            set y = PolarY(GetEffectY(e), 45, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 350, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[R]wave1.mdl", x, y, 10, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count <= 100 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g2) then 
                    call GroupAddUnit(g2, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.4)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 100 then
            call ForGroup(g2, function ResetMoveSpeed)
            call GroupClear(g2)
        endif
        if count == 125 then
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
        set e = null
    endfunction
    
    private function period6 takes nothing returns nothing
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
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\SAlter_7.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\bossbirth.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Allmight_1-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\saberalterqc.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), 0, 0, 6, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\rb10.mdl", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), 0, 90, 6, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\darkexcalibureffect1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 8 * GetHeroStr(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0JC' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0JD' then
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

        if abilId == 'A0JE' then
            call SoundStart("war3mapImported\\SAlter_3.mp3")
        endif

        if abilId == 'A0JF' then
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

        if abilId == 'A0JG' then
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

        if abilId == 'A0JH' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0JI' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
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