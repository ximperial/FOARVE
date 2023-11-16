scope izayoispell initializer init

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
            call SoundStart("war3mapImported\\Izayoi_1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 13)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Ring.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e) , 80, a)
            set y = PolarY(GetEffectY(e) , 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A015'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\earthdetonation.mdl", x, y, 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Dls2.mdl", x, y, 50, a, - 40, 0, 1, 1, 255, 255, 255, 255)
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

    globals
        private unit array IzaW
    endglobals

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 15 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Izayoi_2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitAnimationByIndex(u, 1)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left hand"))
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right hand"))
            call SaveEffectHandle(ht, zid, 102, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left foot"))
            call SaveEffectHandle(ht, zid, 103, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right foot"))
        endif
        if count <= 15 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 10, a)
                set y = PolarY(GetUnitY(u) , dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a) 
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 100, a , 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A01B')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
            call SaveReal(ht, zid, 0, a)
            if IsUnitHero(t) and IsUnitAlive(t) then
                call DisableAbilityEx(u, 'A01B', true)
                call EnableAbilityEx(u, 'A051', true)
            endif
            set IzaW[GetUnitUserData(u)] = t
        endif
        if IzaW[GetUnitUserData(u)] != null then
            if count >= 15 and count <= 45 then
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 5 then
                    call SaveInteger(ht, zid, 1, 0)
                    set a = LoadReal(ht, zid, 0)
                    call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(t) , GetUnitY(t) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(t) , GetUnitY(t) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
                endif
            endif
            if count == 45 then
                call ShakeCamera(1, GetOwningPlayer(u) , 15)
                call ShakeCamera(1, GetOwningPlayer(t) , 15)
                call Effect("war3mapImported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\[A]SlamWithOut.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\[A]StompNew.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Sand_YueKongJi.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            endif
        endif
        if count == 165 or(count > 45 and IzaW[GetUnitUserData(u)] == null) then
            if IzaW[GetUnitUserData(u)] != null then
                call DisableAbilityEx(u, 'A051', true)
                call EnableAbilityEx(u, 'A01B', true)
                set IzaW[GetUnitUserData(u)] = null
            endif
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 35 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Izayoi_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitAnimationByIndex(u, 1)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left hand"))
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right hand"))
            call SaveEffectHandle(ht, zid, 102, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left foot"))
            call SaveEffectHandle(ht, zid, 103, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right foot"))
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u) , GetUnitY(u) , 50, a , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_bashenan_juqi_1_4.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            set x = PolarX(GetUnitX(t) , 120, a)
            set y = PolarY(GetUnitY(t) , 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacing(u, a + 180)
            call SetUnitAnimationByIndex(u, 15)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\bowen1.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u) , GetUnitY(u) , 50, a + 180 , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Izayoi_2-2.mp3")
            call Effect("war3mapImported\\File00001831.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 100, a , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 35 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A051')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
            call SaveReal(ht, zid, 0, a)
        endif
        if count == 35 then
            call Effect("war3mapImported\\File00001831.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
        endif
        if count >= 35 and count <= 65 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                set a = LoadReal(ht, zid, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(t) , GetUnitY(t) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(t) , GetUnitY(t) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 65 then
            call SoundStart("war3mapImported\\Izayoi_2-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\[A]RinRfire1.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]SlamWithOut.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]StompNew.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Sand_YueKongJi.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Izayoi_4.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\valkdustnew.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left hand"))
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right hand"))
            call SaveEffectHandle(ht, zid, 102, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "left foot"))
            call SaveEffectHandle(ht, zid, 103, AddSpecialEffectTarget("war3mapImported\\0236.mdx", u, "right foot"))
        endif
        if count <= 20 then
            if dist > 70 then
                set x = PolarX(GetUnitX(u) , dist / 10, a)
                set y = PolarY(GetUnitY(u) , dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , 50, GetUnitFacing(u) - 90)
                set y = PolarY(GetUnitY(t) , 50, GetUnitFacing(u) - 90)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\[A]ZoroEf6.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , 50, GetUnitFacing(u) , 90, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 40 then
            call ShakeCamera(3, GetOwningPlayer(u) , 5)
            call ShakeCamera(3, GetOwningPlayer(t) , 5)
        endif
        if count >= 40 and count <= 200 then
            set x = PolarX(GetUnitX(t) , 5, GetUnitFacing(u))
            set y = PolarY(GetUnitY(t) , 5, GetUnitFacing(u))
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t) , 50, GetUnitFacing(u) - 90)
            set y = PolarY(GetUnitY(t) , 50, GetUnitFacing(u) - 90)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1 , 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\[a]t_icesparks.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(t) , GetUnitY(t) , 0, GetUnitFacing(u) , 0, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Izayoi_4-2.mp3")
            call SoundStart("war3mapImported\\Izayoi_4-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\[A]ZoroEf6.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SBXZAFB2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\Dls1.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
        endif
        if count == 205 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A01R')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
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
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitAnimationByIndex(u, 15)
            call SetUnitTimeScale(u, 1.2)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 20, a)
                set y = PolarY(GetUnitY(u) , dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , - 120, a)
                set y = PolarY(GetUnitY(t) , - 120, a)
                call SetUnitXY(u, x, y, 0) 
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Izayoi_5.mp3")
            call SoundStart("war3mapImported\\Satomi_5-1.mp3")
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Izayoi_5-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1.25)
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\Izayoi_5-2.mp3")
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count >= 40 and count <= 120 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            if count >= 60 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 14, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind2.mdx", GetUnitX(t) , GetUnitY(t) , GetUnitFlyHeight(t) , randomAngle() , 0, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
            endif
        endif
        if count == 120 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\[A]GongChengBlue.mdx", GetUnitX(t) , GetUnitY(t) , GetUnitFlyHeight(t) , a , -45, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\by_wood_gongchengsipai_3_white.mdx", GetUnitX(t) , GetUnitY(t) , GetUnitFlyHeight(t) , randomAngle() , 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 120 and count <= 150 then
            set x = PolarX(GetUnitX(t) , 20, a)
            set y = PolarY(GetUnitY(t) , 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 25, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind2.mdx", GetUnitX(t) , GetUnitY(t) , GetUnitFlyHeight(t) , a, 45, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
            endif
        endif
        if count == 150 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\zxd6.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 160 then
            call SetUnitFlyHeight(u, 0, 840 / 0.4)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 85 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Izayoi_6.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
        endif
        if count <= 50 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z) , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(1.2, 2.35) , 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 40 then
            call SetUnitAnimationByIndex(u, 11)
            call Effect("war3mapImported\\dash sfx 2.mdx", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count >= 50 and count <= 75 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , - 120, a)
                set y = PolarY(GetUnitY(t) , - 120, a)
                call SetUnitXY(u, x, y, 0) 
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 70 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SoundStart("war3mapImported\\Izayoi_6-1.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1.4)
        endif
        if count == 80 then
            call Effect("war3mapImported\\by_wood_gongchengsipai_3_white.mdx", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 85 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.4)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count == 105 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\zxd6.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[a]t_icesparks.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Izayoi_7.mp3")
            call ShakeCamera(2, GetOwningPlayer(u) , 10)
            call ShakeCamera(2, GetOwningPlayer(t) , 10)
        endif
        if count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\dustwaveanimate2.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(1, 2) , 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Izayoi_7-1.mp3")
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\dash sfx 2.mdx", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count >= 100 and count <= 125 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , - 120, a)
                set y = PolarY(GetUnitY(t) , - 120, a)
                call SetUnitXY(u, x, y, 0) 
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 125 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\smokefuzzy.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]cherry blossom impact.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\blinknew2.mdx", GetUnitX(t) , GetUnitY(t) , 100, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\fuzzystomp.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[a]t_icesparks.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 130 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A015' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A01B' then
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

        if abilId == 'A051' then
            set t = IzaW[GetUnitUserData(u)]
            set IzaW[GetUnitUserData(u)] = null
            call DisableAbilityEx(u, 'A051', true)
            call EnableAbilityEx(u, 'A01B', true)
            if not IsUnitInvulnerable(t) then
                set z = CreateTimer()
                call PauseUnit(u, true)
                call SetUnitInvulnerable(u, true)
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
                call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
                call SaveInteger(ht, GetHandleId(z) , 0, 0)
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                call TimerStart(z, 0.02, true, function period2_1)
            endif
        endif

        if abilId == 'A01R' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A01S' then
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

        if abilId == 'A021' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif
        
        if abilId == 'A022' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
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