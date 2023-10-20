scope laxusspell initializer init

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
            call SoundStart("war3mapImported\\LaxusNew_1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.15, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 5 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1.5, 1, 255, 255, PercentTo255(60), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapImported\\CF2.mdl", x, y, 50, a, 0, 0, 0.5, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 1.25, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            set x = PolarX(GetUnitX(u), 150, a)
            set y = PolarY(GetUnitY(u), 150, a)
            call Effect("war3mapImported\\rasengan_eff4.mdl", x, y, 100, a, - 90, 0, 0.8, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 5 and count <= 20 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A093'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), 20, a)
                set y = PolarY(GetEffectY(e), 20, a)
                call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(50, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, GetRandomReal(1.5, 1.8), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            endif
        endif
        if count == 20 then
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
        if count <= 60 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\LaxusNew_2.mp3")
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.5)
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.5, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, PercentTo255(60), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 20 then
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\Ap235.mdl", u, "right hand")) 
            call SetUnitTimeScale(u, 0.2)
        endif
        if count == 20 or count == 40 or count == 60 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 0.7, 1, 255, 255, PercentTo255(60), PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.4, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.25, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5) 
        endif
        if count <= 50 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\LaxusNew_2-1.mp3") 
            call SetUnitTimeScale(u, 1)
        endif
        if count == 55 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\QQQQQyellow.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 60 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A094')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
        endif
        if count >= 60 and count <= 90 then
            if count > 75 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            endif
        endif
        if count == 90 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\LaxusNew_3.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.5, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, PercentTo255(60), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 30 then
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.5, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, PercentTo255(60), PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 60 then
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\Ap235.mdl", u, "left hand"))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 60 or count == 80 or count == 110 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 0.7, 1, 255, 255, PercentTo255(60), PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.4, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.25, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 60 and count <= 110 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
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
        if count == 110 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 2.5, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\HolyPhoenixMissle1.mdl", x, y, 100, a, - 90, 0, 1.25, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]Lightingcollection.mdl", x, y, 100, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\QQQQQyellow.mdl", x, y, 150, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapImported\\effect2.mdl", x, y, 100, randomAngle(), 0, 0, 2.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 120 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A095')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2 
        local real y2
        local real a
        local real dist
        local unit d
        local effect e
        local lightning l
        local integer i
        
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 250 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\LaxusNew_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1800, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), 0)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 4.2)
            call SaveBoolean(ht, StringHash("LaxusR"), GetHandleId(d), true)
            call SaveReal(ht, StringHash("LaxusR_X"), GetHandleId(d), x)
            call SaveReal(ht, StringHash("LaxusR_Y"), GetHandleId(d), y)
            call SaveUnitHandle(ht, zid, 10, d)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
            call Effect("war3mapImported\\LightningBall.mdl", x, y, 600, randomAngle(), 0, 0, 0.75, 8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set l = AddLightningEx("AFOD", false, GetUnitX(u), GetUnitY(u), 50 + GetAxisZ(GetUnitX(u), GetUnitY(u)), x, y, 600 + GetAxisZ(x, y))
            call SetLightningTexture(l, "war3mapImported\\LightningYellow.blp")
            call SaveLightningHandle(ht, zid, 1000, l)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\LaxusNew_4-1.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\LaxusNew_4-2.mp3")
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count <= 200 then
            set d = LoadUnitHandle(ht, zid, 10)
            if x != LoadReal(ht, StringHash("LaxusR_X"), GetHandleId(d)) or y != LoadReal(ht, StringHash("LaxusR_Y"), GetHandleId(d)) then
                set x = LoadReal(ht, StringHash("LaxusR_X"), GetHandleId(d))
                set y = LoadReal(ht, StringHash("LaxusR_Y"), GetHandleId(d))
                call SaveReal(ht, zid, 0, x)
                call SaveReal(ht, zid, 1, y)
            endif
            set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
            set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
            if dist > 1000 then
                set x = PolarX(GetUnitX(u), 1000, a)
                set y = PolarY(GetUnitY(u), 1000, a)
                call SaveReal(ht, zid, 0, x)
                call SaveReal(ht, zid, 1, y)
            endif
            set e = LoadEffectHandle(ht, zid, 100)
            set a = Angle(GetEffectX(e), GetEffectY(e), x, y)
            set dist = Distance(GetEffectX(e), GetEffectY(e), x, y)
            set x2 = PolarX(GetEffectX(e), dist / 10, a)
            set y2 = PolarY(GetEffectY(e), dist / 10, a)
            if dist > 0 and not IsTerrainPathable(x2, y2, PATHING_TYPE_FLYABILITY) then
                call SetEffectXY(e, x2, y2, 1)
                call SetSpecialEffectZ(e, 600 + GetAxisZ(x2, y2))
                set l = LoadLightningHandle(ht, zid, 1000)
                call MoveLightningEx(l, false, GetUnitX(u), GetUnitY(u), 50 + GetAxisZ(GetUnitX(u), GetUnitY(u)), x2, y2, 600 + GetAxisZ(x2, y2))
                set a = Angle(GetUnitX(u), GetUnitY(u), x2, y2)
                call SetUnitFacing(u, a)
            endif
        endif
        if count >= 200 and count <= 240 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 14)
            set l = LoadLightningHandle(ht, zid, 1000)
            call MoveLightningEx(l, false, GetUnitX(u), GetUnitY(u), 50 + GetAxisZ(GetUnitX(u), GetUnitY(u)), GetEffectX(e), GetEffectY(e), GetEffectZ(e))
        endif
        if count <= 240 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2500, null)
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
        if count == 240 then
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
        endif
        if count == 250 then
            call SoundStart("war3mapImported\\LaxusNew_4-3.mp3")
            call ShakeCamera(2, GetOwningPlayer(u), 10)
            call SelectUnitForPlayerSingle(u, GetOwningPlayer(u))
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapImported\\glowline(yellow).mdl", GetEffectX(e), GetEffectY(e), 10, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        endif
        if count == 280 or count == 310 or count == 340 then
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 0
            loop
                exitwhen i > 8
                set x2 = PolarX(GetEffectX(e), 400, i * 40)
                set y2 = PolarY(GetEffectY(e), 400, i * 40)
                call Effect("war3mapImported\\krk (1849).mdl", x2, y2, 50, i * 40, - 90, 0, 0.75, 1.5, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 340 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.5) 
        endif
        if count <= 350 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count >= 250 then
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 600, null)
                loop 
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null 
                    if FilterGeneral(u, gUnit) then 
                        call DamageUnit(u, gUnit, ((6 + 2 * GetUnitAbilityLevel(u, 'A097')) * GetHeroStr(u, true)) / 100)
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif
                endloop
                call GroupClear(gGroup)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.5, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
                if count >= 250 then
                    call Effect("war3mapImported\\LighWave3.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(2, 2.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                    call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, GetRandomReal(3, 4), 1.5, 255, 255, 255, PercentTo255(GetRandomReal(30, 60)))
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                    call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(80, 90)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                    call Effect("war3mapImported\\wind4.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(1.5, 1.75), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
                endif
            endif
        endif
        if count == 350 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call Effect("war3mapImported\\wind3.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 2, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\File00007390.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.8, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 355 then
            set l = LoadLightningHandle(ht, zid, 1000)
            call DestroyLightning(l)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
        set d = null
        set e = null
        set l = null
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\LaxusNew_6.mp3")
            call ShakeCamera(6, GetOwningPlayer(u), 5)
            call ShakeCamera(6, GetOwningPlayer(t), 5)
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count <= 280 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 2), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 2))
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            endif
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\LaxusNew_6-1.mp3")
        endif
        if count == 260 then
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 280 then
            call Effect("war3mapImported\\laxus_lightning_spear.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 280 and count <= 320 then 
            set e = LoadEffectHandle(ht, zid, 100)
            set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetEffectX(e), dist / 40, a)
            set y = PolarY(GetEffectY(e), dist / 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Ap235.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(20))
                call Effect("war3mapImported\\CF2.mdl", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, GetRandomReal(0.3, 0.4), 1.5, 255, 255, PercentTo255(60), PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
                call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.4, 0.6), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            endif
        endif
        if count == 320 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\[A]LightStrikeArray4.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.75, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\QQQQQyellow.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\WindCirclefaster.mdl", x, y, 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\[tx]lvlup.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BY_Wood_Sand_YueKongJi.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(t), 200, a + 40)
            set y = PolarY(GetUnitY(t), 200, a + 40)
            call Effect("war3mapImported\\krk (1849).mdl", x, y, 50, 40, - 90, 0, 0.75, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a + 130)
            set y = PolarY(GetUnitY(t), 200, a + 130)
            call Effect("war3mapImported\\krk (1849).mdl", x, y, 50, 130, - 90, 0, 0.75, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a + 220)
            set y = PolarY(GetUnitY(t), 200, a + 220)
            call Effect("war3mapImported\\krk (1849).mdl", x, y, 50, 220, - 90, 0, 0.75, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a + 310)
            set y = PolarY(GetUnitY(t), 200, a + 310)
            call Effect("war3mapImported\\krk (1849).mdl", x, y, 50, 310, - 90, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
        endif
        if count == 330 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A097')) * GetHeroStr(u, true))
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local group g2 = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 700 then
            if count >= 350 then
                call PauseUnit(u, true)
            endif
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\LaxusNew_5-2.mp3")
            else
                call SoundStart("war3mapImported\\LaxusNew_5-3.mp3")
            endif
            call UnitApplySilence(u, true)
        endif
        if count == 350 then
            call SoundStart("war3mapImported\\LaxusNew_5.mp3")
            call VisionArea(GetOwningPlayer(u), 1800, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\ChargeYellow.mdl", GetUnitX(u), GetUnitY(u), 150, randomAngle(), 0, 0, 2.75, 7, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFB_aura_Yellow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.15, 7, 255, 255, 255, 255)
            call Effect("war3mapImported\\File00007390.mdl", GetUnitX(u), GetUnitY(u), - 200, randomAngle(), 0, 0, 4, 7, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\huoqiang02_T1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1)) 
        endif
        if count == 380 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectTimeScale(e, 0.03)
        endif
        if count == 390 or count == 430 or count == 470 or count == 510 then
            call Effect("war3mapImported\\huoqiang02_T1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))  
        endif
        if count <= 450 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 15 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.35, 2), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
            endif
        endif
        if count == 450 then
            call SetUnitTimeScale(u, 0)
            call Effect("war3mapImported\\MC Laxus.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count >= 450 and count <= 550 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectZ(e, GetEffectZ(e) + 9)
        endif
        if count >= 450 and count <= 700 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 15 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.7, 1) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.25) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.35, 2) + (count - 450) * 0.02, 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
            endif
        endif
        if count == 500 then
            call SoundStart("war3mapImported\\LaxusNew_5-1.mp3")
            call ShakeCamera(4, GetOwningPlayer(u), 10)
            call SetUnitTimeScale(u, 0.5)
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 550 then
            call Effect("war3mapImported\\az_sg2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.6, 3, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.05)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapImported\\MystoganExp.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, PercentTo255(70)) 
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
        endif
        if count >= 550 and count <= 700 then
            if count <= 650 then
                set e = LoadEffectHandle(ht, zid, 101)
                call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.15)
                set e = LoadEffectHandle(ht, zid, 102)
                call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.15)
                set e = LoadEffectHandle(ht, zid, 103)
                call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.15)
            endif
            if count < 650 then 
                call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300 + (count - 550) * 12, null)
            else
                call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1500, null)
            endif
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 15 * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit) 
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count >= 350 and count <= 600 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g2) then 
                    call GroupAddUnit(g2, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01) 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 600 then
            call ForGroup(g2, function ResetMoveSpeed)
            call DestroyGroup(g2)
        endif
        if count == 700 then
            call SetUnitTimeScale(u, 1)
            call UnitApplySilence(u, false)
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
            call SoundStart("war3mapImported\\LaxusNew_6-3.mp3")
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
        if count == 20 or count == 50 or count == 70 or count == 100 or count == 120 or count == 150 or count == 170 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 1.75), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\LaxusNew_6-4.mp3") 
        endif
        if count == 200 or count == 230 or count == 260 or count == 290 or count == 320 or count == 350 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 0.7, 1, 255, 255, PercentTo255(60), PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.4, 1, 255, 255, PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.25, 1, 255, 255, PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\LaxusNew_6-5.mp3") 
            call SetUnitTimeScale(u, 0.5)
            call SetUnitAnimationByIndex(u, 6)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapimported\\NatsuLightning.mdl", u, "left hand"))
        endif
        if count == 210 or count == 240 or count == 270 or count == 300 or count == 330 then
            call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.25, 1.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 2))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
        if count == 230 then
            call SetUnitTimeScale(u, 0)
        endif
        if count >= 200 and count <= 350 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 40, a)
                set y = PolarY(GetUnitY(u), dist / 40, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 4, a)
                set y = PolarY(GetUnitY(t), 4, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 270 then
            call SetUnitTimeScale(u, 0.3)
        endif
        if count == 340 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 3, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\QQQQQyellow.mdl", x, y, 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapImported\\effect2.mdl", x, y, 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", x, y, 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\NatsuLightning.mdl", x, y, 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 350 then 
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
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period8 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\LaxusNew_7.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.25)
        endif
        if count == 40 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 0.3)
        endif
        if count == 150 or count == 250 then
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapImported\\QQQQQyellow.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\WindCirclefaster.mdl", x, y, 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count <= 250 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 15 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\LighWave3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.65), 1, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\LaxusSpark2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.45), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.7), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
                call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, PercentTo255(60), PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
            endif
        endif
        if count == 250 then
            call SoundStart("war3mapImported\\LaxusNew_7-1.mp3")
        endif
        if count == 290 then
            call Effect("war3mapImported\\LaxusLighthing.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 300 then 
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\[A]HolyPhoenixMissle1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.75, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(10, 40)))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 1.75, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\white-shandian-qiquan-yellow.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[A]YellowMissile.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 310 then 
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

        if abilId == 'A093' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A094' then
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

        if abilId == 'A095' then
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

        if abilId == 'A097' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if t != null then
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period5)
            else
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
                call TimerStart(z, 0.02, true, function period4)
            endif
        endif

        if abilId == 'A09M' then
            set z = CreateTimer()
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A09N' then
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

        if abilId == 'A09O' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period8)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function action2 takes nothing returns nothing
        local unit u = GetTriggerUnit()
        local real x = GetOrderPointX()
        local real y = GetOrderPointY()
        if LoadBoolean(ht, StringHash("LaxusR"), GetHandleId(u)) then 
            if GetIssuedOrderId() == 851986 or GetIssuedOrderId() == 851971 then
                call SaveReal(ht, StringHash("LaxusR_X"), GetHandleId(u), x)
                call SaveReal(ht, StringHash("LaxusR_Y"), GetHandleId(u), y)
            endif
        endif
        set u = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, function action2)
    endfunction
endscope