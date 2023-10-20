scope yayaspell initializer init
   
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
            call SoundStart("war3mapImported\\Yaya_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\valkkame3.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
            call Effect("", GetUnitX(u) , GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0H2'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), - 100, a)
                set y = PolarY(GetEffectY(e), - 100, a)
                call Effect("war3mapimported\\valkdustNew.mdx", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\valkkame3.mdx", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
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

    private function period1_1 takes nothing returns nothing
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart( "war3mapImported\\Yaya_1-1.mp3" )
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, .5)
            call Effect("war3mapimported\\stingroar.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StingEffect1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\WindNewFaw4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ExpWhiteFaw.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call SaveUnitHandle(ht, zid, 10, d)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 2.5)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 30 or count == 60 or count == 90 or count == 120 or count == 150 or count == 180 or count == 210 or count == 240 or count == 270 then
            call Effect("war3mapimported\\Cyclon Explosion_green.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\black_thunderclapcaster.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 or count == 100 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count <= 100 then 
            set d = LoadUnitHandle(ht, zid, 10)
            call SaveReal(ht, zid, 0, GetUnitFacing(d))
            call SetUnitFacing(u, GetUnitFacing(d))
        endif
        if count == 300 then
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a + 180, - 180, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 180, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a + 180, - 180, 0, 2.75, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_GongChengSiPai_1.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 180, 0, 2.25, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 300 and count <= 400 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 30, a)
            set y = PolarY(GetEffectY(e), 30, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 5 * GetHeroInt(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\valkkame3.mdx", x, y, 100, a, 0, 0, 4, 1, 255, 255, 255, 255)
                call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
                call Effect("war3mapImported\\valkdustNew.mdx", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 400 then 
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\EarthSlamWhiteNew.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]hit-white-guangxiao.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 4.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\FawEffects (11).mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\StingEffect1.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\az_slb.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Sand3.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Almagest.mdx", GetEffectX(e), GetEffectY(e), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 405 then 
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
        set d = null
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Yaya_2.mp3")
            call Effect("war3mapImported\\WDFZL_green.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 50 or count == 60 or count == 70 or count == 80 or count == 90 then
            call Effect("war3mapImported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\white-qiquan-juhuang.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            call Effect("war3mapImported\\white-qiquan-juhuang.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 120 then 
            call SetUnitTimeScale(u, 0)
        endif
        if count == 110 then 
            call SoundStart("war3mapImported\\Yaya_2-1.mp3")
        endif
        if count >= 110 and count <= 320 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DragonZhua.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 325 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0KO')) * GetHeroInt(u, true))
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

    private function period2_1 takes nothing returns nothing
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Yaya_2-2.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\DevilSlam.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\Death Release.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 140 then
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count >= 140 and count <= 500 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 50, a)
                set y = PolarY(GetUnitY(u), dist / 50, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 10 then
                    call SaveInteger(ht, zid, 1, 0) 
                    call Effect("war3mapImported\\dzxb1.mdx", GetUnitX(u), GetUnitY(u), 50, a, 180, 0, 1, 0.3, 255, 255, 255, 255)
                    call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                endif
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 10 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\[a]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1.5, 255, 255, 255, 255)
                    call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 500 then 
            call SetUnitAnimationByIndex(u, 19)
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\EarthCrackBlu.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif 
        if count == 510 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 7 * GetHeroInt(u, true))
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
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yaya_3.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\dzxb1.mdx", GetUnitX(u), GetUnitY(u), 50, a, 180, 0, 1, 0.3, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
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
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0KP')) * GetHeroInt(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\dzxb1.mdx", GetUnitX(u), GetUnitY(u), 50, a, 180, 0, 1, 0.3, 255, 255, 255, 255)
                call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
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

    private function period3_1 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Yaya_3-1.mp3")
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\HolyBlessing.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        endif
        if count == 50 then
            call Effect("war3mapimported\\Cyclon Explosion_green.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Yaya_3-2.mp3")
            call SetUnitTimeScale(u, 0.7)
            call SetUnitAnimationByIndex(u, 21)
            call Effect("war3mapImported\\sistinatoushe.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 100 and count <= 190 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 90, a)
            set y = PolarY(GetEffectY(e), dist / 90, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\valkdustNew.mdx", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, GetRandomReal(1, 1.25), 1, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapimported\\CF2.mdx", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, GetRandomReal(1, 1.25), 1, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 190 then 
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Nature Blast - Classic.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\EarthSlamWhiteSlashes.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 120, 255, 120, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 200 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0) 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 7 * GetHeroInt(u, true))
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart( "war3mapImported\\Yaya_4.mp3" )
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\WDFZL2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\XZDL.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 150 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count >= 150 and count <= 400 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 30 then 
                call SaveInteger(ht, zid, 1, 0)
                call SetUnitAnimationByIndex(u, GetRandomInt(2, 5))
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 400 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0KQ')) * GetHeroInt(u, true))
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

    private function period4_1 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Yaya_4-1.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.2, 1.5, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count >= 120 and count <= 350 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 60, a)
                set y = PolarY(GetUnitY(u), dist / 60, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 10 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                endif
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 250 then 
            call SetUnitAnimationByIndex(u, 17)
        endif
        if count == 350 then
            call SetUnitAnimationByIndex(u, 21)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AliceFSFX2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 0)
        endif 
        if count == 380 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 12 * GetHeroInt(u, true))
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

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 1250 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart( "war3mapImported\\Yaya_5.mp3" )
            call Effect("war3mapImported\\LDQS_tx.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 25, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\RedHarvest.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 25, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\DarkLightningAura.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 30, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 180 then
            call Effect("war3mapImported\\OkitaAlterEff1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Evolt-7-low.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.4, 21, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\Drop_the_beat.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 2, 1, 21, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 1250 then
            call Effect("war3mapImported\\windcaotic2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 5, 3, 255, 255, 255, 255)
            call Effect("war3mapImported\\By_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_4_2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 5, 3, 255, 255, 255, 255)
            if GetUnitTypeId(u) != 'H01A' then
                call MorphUnit(u, 'H01A')
            endif
            call DisableAbilityEx(u, 'A0H2', true)
            call DisableAbilityEx(u, 'A0KO', true)
            call DisableAbilityEx(u, 'A0KP', true)
            call DisableAbilityEx(u, 'A0KQ', true)
            call DisableAbilityEx(u, 'A0KR', true)
            call UnitAddAbility(u, 'A0KS')
            call UnitMakeAbilityPermanent(u, true, 'A0KS')
            call UnitAddAbility(u, 'A0KT')
            call UnitMakeAbilityPermanent(u, true, 'A0KT')
            call UnitAddAbility(u, 'A0KU')
            call UnitMakeAbilityPermanent(u, true, 'A0KU')
            call UnitAddAbility(u, 'A0KV')
            call UnitMakeAbilityPermanent(u, true, 'A0KV')
            call UnitAddAbility(u, 'A0KW')
            call UnitMakeAbilityPermanent(u, true, 'A0KW')
            call Effect("war3mapImported\\Fortitude Rune Aura.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
        endif
        if count > 1250 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = GetUnitModelObjectPositionX(u, "origin")
            set y = GetUnitModelObjectPositionY(u, "origin")
            set h = GetUnitModelObjectPositionZ(u, "origin")
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, h)
        endif
        if count > 1250 and GetUnitAbilityLevel(u, 'B00M') == 0 and IsUnitAlive(u) then 
            call MorphUnit(u, 'H019')
            call UnitRemoveAbility(u, 'A0KS')
            call UnitRemoveAbility(u, 'A0KT')
            call UnitRemoveAbility(u, 'A0KU')
            call UnitRemoveAbility(u, 'A0KV')
            call UnitRemoveAbility(u, 'A0KW')
            call EnableAbilityEx(u, 'A0H2', true)
            call EnableAbilityEx(u, 'A0KO', true)
            call EnableAbilityEx(u, 'A0KP', true)
            call EnableAbilityEx(u, 'A0KQ', true)
            call EnableAbilityEx(u, 'A0KR', true)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period5_1 takes nothing returns nothing
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
            call SoundStart( "war3mapImported\\Yaya_5-1.mp3" )
        endif
        if count == 50 then
            call Effect("war3mapImported\\white-qiquan-juhuang.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-qiquan-juhuang.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.2, 1, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 250 then 
            call Effect("war3mapImported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 2, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 500 then
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count >= 500 and count <= 650 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\[a]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.3, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DragonZhua.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 650 then
            call SetUnitAnimationByIndex(u, 21)
            call Effect("war3mapImported\\WindCirclefaster.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), PercentTo255(GetRandomReal(10, 90)), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\XZDL.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 1050 then
            call SoundStart( "war3mapImported\\Yaya_5-2.mp3" )
        endif
        if count >= 700 and count <= 1000 then
            set x = PolarX(GetUnitX(t), 2, a)
            set y = PolarY(GetUnitY(t), 2, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call SetUnitTimeScale(u, 3)
                call SetUnitAnimationByIndex(u, GetRandomInt(18, 21))
                call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\valkkame3.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 2.5, 0.2, 255, 255, 255, 255)
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 1050 then
            call SetUnitTimeScale(u, 0.3)
            call SetUnitAnimationByIndex(u, 21)
        endif
        if count == 1200 then
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 0.7, 0.4, 255, 255, 255, 255)
            call Effect("war3mapimported\\valkkame3.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 2.5, 0.2, 255, 255, 255, 255)
            call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 14 * GetHeroInt(u, true))
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
            call SoundStart("war3mapImported\\Yaya_6.mp3")
            call Effect("war3mapImported\\WDFZL2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WeatherEffect5.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 2, 5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 250 then
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count == 450 then 
            call SetUnitAnimationByIndex(u, 19)
        endif
        if count >= 250 and count <= 400 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u), 120, a, 0, 0, 0.7, 0.4, 255, 255, 255, 255)
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Dash Sfx 2.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 480 then 
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AliceFSFX2.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 0)
        endif
        if count == 500 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Yaya_7.mp3")
            set x = PolarX(GetUnitX(t), - 1200, a)
            set y = PolarY(GetUnitY(t), - 1200, a)
            call SetUnitXY(u, x, y, 0)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\mbdm.mdx", u, "origin"))
            call Effect("war3mapImported\\red-qiquan.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(30), PercentTo255(30), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 100 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.4)
        endif
        if count == 200 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 360 then 
            call Effect("war3mapImported\\CF2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\chongfeng2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 0.7, 0.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapimported\\valkkame3.mdx", GetUnitX(u) , GetUnitY(u), 100, a, 0, 0, 2.5, 0.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 370 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroInt(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0H2' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0KS' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1_1)
        endif

        if abilId == 'A0KO' then
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
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0KT' then
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
            call TimerStart(z, 0.02, true, function period2_1)
        endif

        if abilId == 'A0KP' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0KU' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3_1)
        endif

        if abilId == 'A0KQ' then
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

        if abilId == 'A0KV' then
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
            call TimerStart(z, 0.02, true, function period4_1)
        endif

        if abilId == 'A0KR' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0KW' then
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
            call TimerStart(z, 0.02, true, function period5_1)
        endif

        if abilId == 'A0KX' then
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
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0KY' then 
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