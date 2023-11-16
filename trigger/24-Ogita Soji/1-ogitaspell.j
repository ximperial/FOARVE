scope ogitaspell initializer init
   
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
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Ogita_1.mp3")
            else
                call SoundStart("war3mapImported\\Ogita_1-1.mp3")
            endif
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Ogita_1-2.mp3")
        endif
        if count == 2 or count == 5 or count == 8 or count == 11 then
            call Effect("war3mapImported\\afbctzsntx.mdx", GetUnitX(u) , GetUnitY(u) , 100, a , 0, 0, 2, 1, 255 , 255 , 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x , y , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroAgi(u, true) + 90 * GetUnitAbilityLevel(u, 'A0G2'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\glchj.mdx", GetUnitX(u) , GetUnitY(u) , 50, a , 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ogita_2.mp3")
            call SoundStart("war3mapImported\\Ogita_2-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\3shadowassault(lightzi)waveblue.mdx", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(t) , 400, a)
            set y = PolarY(GetUnitY(t) , 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
            call SetUnitFacingEx(u, a + 180, true)
        endif
        if count == 5 then
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count >= 5 and count <= 25 then
            set x = PolarX(GetUnitX(u) , 40, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 40, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, GetUnitFacing(u) , 0, 0, 1.5 , 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 25 then
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1.2)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapimported\\blackblink.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\dash sfx.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Ogita_2-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapimported\\windslash.mdx", GetUnitX(t) , GetUnitY(t) , 150, a + 90, - 45, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\windslash.mdx", GetUnitX(t) , GetUnitY(t) , 150, a + 90, 45, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\ultizoro.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set i = 1
            loop
                exitwhen i > 6
                call Effect("war3mapimported\\windweak2.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, GetRandomReal(1, 2.5) , 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.85))
                set i = i + 1 
            endloop
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set x = PolarX(GetUnitX(u) , - 300, a)
            set y = PolarY(GetUnitY(u) , - 300, a)
            call Effect("war3mapimported\\xzblue.mdx", x , y , 100, a + 180, 0, 0, 0.45, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\xzblue.mdx", x , y , 100, a + 190, 0, 0, 0.55, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.05)
            call Effect("war3mapimported\\xzblue.mdx", x , y , 100, a + 200, 0, 0, 0.6, 1.5, 255, 255, 255, 255)
        endif
        if count == 40 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0GE')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Ogita_3.mp3")
            set x = PolarX(GetUnitX(t) , 140, a)
            set y = PolarY(GetUnitY(t) , 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count == 5 then
            call SetUnitFacing(u, a)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Yomi_5-2.mp3")
            call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\zhanji-blue-shu.mdx", GetUnitX(t) , GetUnitY(t) , 100, a + 40, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 25 then 
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0GF')) * GetHeroAgi(u, true))
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local integer i 
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ogita_4.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 4, GetUnitX(u) , GetUnitY(u))
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call Effect("war3mapimported\\sxcf2.mdx", GetUnitX(u) , GetUnitY(u) , 10, randomAngle() , 0, 0, 5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(u) , 300, i * 60)
                set y = PolarY(GetUnitY(u) , 300, i * 60)
                call Effect("war3mapimported\\[A]WhiteSlash.mdx", x, y, 50, i * 60 , 0, 0, 1.3, 1, PercentTo255(80) , 255, 255, 255)
                call Effect("war3mapimported\\ogitasoji.mdx", x, y, 0, i * 60 , 0, 0, 1, 1, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call SaveEffectHandle(ht, zid, 100 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count == 30 or count == 40 or count == 50 or count == 60 or count == 70 then
            call SoundStart("war3mapImported\\Ogita_4-1.mp3")
        endif
        if count >= 30 and count <= 70 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A0GG')) * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            set i = 0
            loop
                exitwhen i > 5
                set e = LoadEffectHandle(ht, zid, 100 + i)
                if iterator == 3 or iterator == 6 then
                    set x = PolarX(GetUnitX(u) , GetRandomReal(-400, 400) , randomAngle())
                    set y = PolarY(GetUnitY(u) , GetRandomReal(-400, 400) , randomAngle())
                    call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y , GetRandomReal(250, 350) , randomAngle() , 0, 0, GetRandomReal(2, 3.5) , 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                endif
                if iterator >= 6 then
                    call SetSpecialEffectAnimationByIndex(e, GetRandomInt(11, 13))
                endif
                set i = i + 1
            endloop
            if iterator >= 6 then
                call SaveInteger(ht, zid, 1, 0)
            endif
        endif
        if count == 70 then
            call SetUnitVertexColor(u, 255, 255, 255, 255)
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
    endfunction

    private function period5 takes nothing returns nothing
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ogita_5.mp3")
            call SoundStart("war3mapImported\\Ogita_5-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            set x = PolarX(GetUnitX(t) , -500, a)
            set y = PolarY(GetUnitY(t) , -500, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.9)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapimported\\punchshot.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Ogita_1-2.mp3")
            call Effect("war3mapimported\\CTshoting.mdx", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\glchj.mdx", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count >= 10 and count <= 30 then
            set x = PolarX(GetUnitX(u) , 650 / 20, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 650 / 20, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            endif
        endif
        if count == 30 then
            call SetUnitFacing(u, a)
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Ogita_2-2.mp3")
            call Effect("war3mapimported\\zhanji-blue-shu.mdx", GetUnitX(t) , GetUnitY(t) , 50, a + 40, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count >= 35 and count <= 45 then
            set x = PolarX(GetUnitX(t) , 30, a)
            set y = PolarY(GetUnitY(t) , 30, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Ogita_5-2.mp3")
        endif
        if count == 45 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitTimeScale(u, 2)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitFlyHeight(u, 300, 0)
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveReal(ht, zid, 0, GetUnitX(t))
            call SaveReal(ht, zid, 1, GetUnitY(t))
        endif
        if count == 50 or count == 65 or count == 75 or count == 90 then
            call SoundStart("war3mapImported\\Ogita_4-1.mp3")
        endif
        if count >= 45 and count <= 95 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = LoadReal(ht, zid, 0)
                set y = LoadReal(ht, zid, 1)
                set x = PolarX(x, GetRandomReal(-500, 500) , randomAngle())
                set y = PolarY(y, GetRandomReal(-500, 500) , randomAngle())
                call SetUnitXY(t, x, y, 0)
                call SetUnitFlyHeight(t, GetRandomReal(300, 400) , 0)
                set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
                call SetUnitFlyHeight(u, GetUnitFlyHeight(t) , 0)
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimation(u, "attack")
                call Effect("war3mapimported\\kdls2.mdx", GetUnitX(u) , GetUnitY(u) , GetUnitFlyHeight(u) , a + 90, 45, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\kdls2.mdx", GetUnitX(u) , GetUnitY(u) , GetUnitFlyHeight(u) , a + 90, - 45, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdx", GetUnitX(t) , GetUnitY(t) , GetUnitFlyHeight(t) , randomAngle() , GetRandomReal(-40, -20) , 0, 1, 1, PercentTo255(80) , 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
            endif
        endif
        if count == 95 then
            call SoundStart("war3mapImported\\Ogita_5-3.mp3")
        endif
        if count == 100 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(t, x, y, 0)
            call SetUnitFlyHeight(t, 600, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t) , 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count >= 100 and count <= 120 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t) , 0)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Ogita_5-4.mp3")
        endif
        if count == 125 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapimported\\123 (383)_2.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.15, 2, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 7, 2.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 130 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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

    private function period6 takes nothing returns nothing
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ogita_6.mp3")
            set x = PolarX(GetUnitX(t) , -1200, a)
            set y = PolarY(GetUnitY(t) , -1200, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.85)
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 20 or count == 50 then
            call Effect("war3mapimported\\zxd3.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 5, 2, 51, 153, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 10 or count == 25 or count == 40 or count == 60 then
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\wind3.mdx", GetUnitX(u) , GetUnitY(u) , 100, a, - 90, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 10 or count == 30 then
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count <= 70 then
            set x = PolarX(GetUnitX(u) , 10, a)
            set y = PolarY(GetUnitY(u) , 10, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2, 1.5, PercentTo255(90) , 255, 255, 255)
            endif
        endif
        if count == 60 then
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapimported\\blackblink.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 0.9, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Ogita_6-1.mp3")
            set x = PolarX(GetUnitX(t) , -200, a)
            set y = PolarY(GetUnitY(t) , -200, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Ogita_6-2.mp3")
        endif
        if count == 120 then
            set x = PolarX(GetUnitX(t) , 140, a)
            set y = PolarY(GetUnitY(t) , 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 8)
            set i = 1
            loop
                exitwhen i > 11
                set x = PolarX(GetUnitX(t) , GetRandomReal(- 500, 500) , randomAngle())
                set y = PolarY(GetUnitY(t) , GetRandomReal(- 500, 500) , randomAngle())
                call Effect("war3mapimported\\Ephemeral Cut Midnight.mdx", x, y, GetRandomReal(300, 500) , randomAngle() , 0, 0, GetRandomReal(4, 6) , 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 15))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set i = i + 1
            endloop
        endif
        if count == 140 then
            call Effect("war3mapImported\\hit-blood-special.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 3.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\jin xia.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 3.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 1.4, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 150 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
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

    private function period7 takes nothing returns nothing
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
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ogita_7.mp3")
            set x = PolarX(GetUnitX(t) , -140, a)
            set y = PolarY(GetUnitY(t) , -140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\shanguangbiubiu.mdl", GetUnitX(u) , GetUnitY(u) , 200, a, 0, 0, 2, 2, 255, 255, 255, 255)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 then
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 2, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 2, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
        endif
        if count == 60 then
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 65 then
            call Effect("war3mapimported\\model (24).mdx", GetUnitX(u) , GetUnitY(u) , 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\model (24).mdx", GetUnitX(u) , GetUnitY(u) , 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\model (24).mdx", GetUnitX(u) , GetUnitY(u) , 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Ogita_7-1.mp3")
            call Effect("war3mapImported\\0227.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\3shadowassault(lightzi)waveblue.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\[a]az-ice-zhendi.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]ChuShou_Blue1.mdx", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(80))
        endif
        if count == 100 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
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

        if abilId == 'A0G2' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0GE' then
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

        if abilId == 'A0GF' then
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

        if abilId == 'A0GG' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0GH' then
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

        if abilId == 'A0GI' then
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

        if abilId == 'A0GJ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
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