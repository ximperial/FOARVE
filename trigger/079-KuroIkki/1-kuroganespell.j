scope kuroganespell initializer init
   
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\KuroIkki_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 2)
            set x = PolarX(GetUnitX(u), 300, a)
            set y = PolarY(GetUnitY(u), 300, a)
            call Effect("war3mapImported\\akiha claw_0.mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(u), 300, a + 20)
            set y = PolarY(GetUnitY(u), 300, a + 20)
            call Effect("war3mapImported\\akiha claw_0.mdl", x, y, 100, a + 20, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a + 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            set x = PolarX(GetUnitX(u), 300, a - 20)
            set y = PolarY(GetUnitY(u), 300, a - 20)
            call Effect("war3mapImported\\akiha claw_0.mdl", x, y, 100, a - 20, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a - 20, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Musashi_1-1.mp3")
            set x = PolarX(GetUnitX(u), 300, a)
            set y = PolarY(GetUnitY(u), 300, a)
            call Effect("war3mapImported\\DTJJ.mdl", x, y, 50, a, 0, 0, 1.3, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 300, a + 20)
            set y = PolarY(GetUnitY(u), 300, a + 20)
            call Effect("war3mapImported\\DTJJ.mdl", x, y, 50, a + 20, 0, 0, 1.3, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 300, a - 20)
            set y = PolarY(GetUnitY(u), 300, a - 20)
            call Effect("war3mapImported\\DTJJ.mdl", x, y, 50, a - 20, 0, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count <= 15 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 1)
                call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
                call GroupEnumUnitsInRange(gGroup, x, y, 200, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0GV'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                set i = i + 1
            endloop
        endif
        if count == 15 then
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4) 
            call SaveReal(ht, zid, 0, a)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 then
            call SoundStart("war3mapImported\\KuroIkki_7-1.mp3")
            if count == 10 then
                set a = LoadReal(ht, zid, 0) + 40
            elseif count == 20 then
                set a = LoadReal(ht, zid, 0) + 120
            elseif count == 30 then
                set a = LoadReal(ht, zid, 0) - 10
            elseif count == 40 then
                set a = LoadReal(ht, zid, 0) - 70
            endif
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimation(u, "attack")
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 180, 0)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\File00009632.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\KuroIkki_7-2.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.2)
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitFlyHeight(u, 0, 3000)
        endif
        if count == 75 then
            call SoundStart("war3mapImported\\Hassan_2-1.mp3")
            call SetUnitTimeScale(u, 1)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\Gukuboom.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\File00005630.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            call Effect("war3mapImported\\File00002085.mdx", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 1.5, 1.5, PercentTo255(60), 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\FawEffects (3).mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\RasenganImpact.mdx", GetUnitX(u), GetUnitY(u), 200, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)        
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0GW')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\KuroIkki_7.mp3")
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\3shadowassault(lightzi)waveblue.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 5 then
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count >= 5 and count <= 25 then
            set x = PolarX(GetUnitX(u), 40, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 40, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, GetRandomReal(1.15, 1.4), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
                call Effect("war3mapImported\\kuroikki.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.4, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 25 then
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1.2)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapimported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\dash sfx 2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\valkdustNew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.3, 1.5, 255, 255, 255, 255)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Ogita_2-2.mp3")
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapimported\\windslash.mdx", GetUnitX(t), GetUnitY(t), 150, a + 90, - 45, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\windslash.mdx", GetUnitX(t), GetUnitY(t), 150, a + 90, 45, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\ultizoro.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            set i = 0
            loop
                exitwhen i > 6
                call Effect("war3mapimported\\windweak2.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(1, 2.35), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
                set i = i + 1 
            endloop
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 0.45, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 190, 0, 0, 0.55, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.05)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 200, 0, 0, 0.6, 1.5, 255, 255, 255, 255)
        endif
        if count == 40 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0GX')) * GetHeroAgi(u, true))
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
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\KuroIkki_4.mp3")
            call SoundStart("war3mapImported\\KuroIkki_4-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\0631.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.2, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\3shadowassault(lightzi)waveblue.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 2 or count == 5 or count == 8 or count == 11 or count == 14 or count == 17 then
            call Effect("war3mapImported\\MomijiThunder.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.8, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\kuroikki.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.4, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(u), 70, a)
            set y = PolarY(GetUnitY(u), 70, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A0GY')) * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid , 1, 0)
                set x = PolarX(GetUnitX(u), - 50, a)
                set y = PolarY(GetUnitY(u), - 50, a)
                call Effect("war3mapImported\\xuanfeng_whitewind.mdx", x, y, 100, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.2, 0.4)
            endif
        endif
        if count == 20 then
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
        local integer i

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
            call SoundStart("war3mapImported\\KuroIkki_5.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 11, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapimported\\az_airfloww11.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 11, 255, 255, 255, PercentTo255(90))
        endif
        if count >= 415 and count <= 605 then
            set i = LoadInteger(ht, zid, 2) + 1
            call SaveInteger(ht, zid, 2, i)
            if i >= 5 then
                call SaveInteger(ht, zid, 2, 0)
                set i = LoadInteger(ht, zid, 3) + 1
                call SaveInteger(ht, zid, 3, i)
                call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "ImageSpell\\ikkit" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
                call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "ImageSpell\\ikkit" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
            endif
        endif
        if count <= 550 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\uissb.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, 255)
                call Effect("war3mapimported\\windcirclefaster2.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.85, 1.5), 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
            endif
        endif
        if count == 540 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count >= 550 and count <= 600 then
            set x = PolarX(GetUnitX(u), 30, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 30, GetUnitFacing(u))
            if count >= 580 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\YFtex1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            endif
        endif
        if count == 570 then
            call Effect("war3mapimported\\eros.mdx", GetUnitX(t) , GetUnitY(t) , 50, a + 30, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\eros.mdx", GetUnitX(t) , GetUnitY(t) , 50, a - 30, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 580 then
            call SoundStart("war3mapImported\\OkitaAlter_7-2.mp3")
            call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 12, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 600 then
            call Effect("war3mapimported\\zm (280).mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 8, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 605 then 
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
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\KuroIkki_6.mp3")
            call SoundStart("war3mapImported\\KuroIkkiBGM1.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 9.1, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif 
        if count >= 1 and count <= 455 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.3, 2.4), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\az_airfloww11.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
            endif
        endif
        if count >= 480 and count <= 650 then
            set i = LoadInteger(ht, zid, 2) + 1
            call SaveInteger(ht, zid, 2, i)
            if i >= 5 then
                call SaveInteger(ht, zid, 2, 0)
                set i = LoadInteger(ht, zid, 3) + 1
                call SaveInteger(ht, zid, 3, i)
                call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "ImageSpell\\ikkiF (" + I2S(i) + ").blp", 255, 255, 255, 0, 255, 255, 255, 255)
                call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "ImageSpell\\ikkiF (" + I2S(i) + ").blp", 255, 255, 255, 0, 255, 255, 255, 255)
            endif
        endif
        if count >= 465 and count <= 650 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\kuroikki.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 0.4, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapimported\\yydlz.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.65, 1.15), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1.6), 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\wind3.mdx", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapimported\\az_jianci.mdx", GetUnitX(u), GetUnitY(u), 150, randomAngle(), - 90, 0, GetRandomReal(1, 2), 1.5, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 650 then
            set x = PolarX(GetUnitX(t), - 450, a)
            set y = PolarY(GetUnitY(t), - 450, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 650 or count == 680 or count == 710 or count == 740 or count == 770 then
            call Effect("war3mapimported\\az_red-xuanwo.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapimported\\AZ_PA_B2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
        endif
        if count == 770 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count >= 770 and count <= 880 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\YFtex1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.9, 1.65), 1, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
                call Effect("war3mapimported\\SZBYAFB2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, PercentTo255(30))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            endif
        endif
        if count == 885 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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
            call SoundStart("war3mapImported\\KuroIkki_7-3.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 7)
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SaveReal(ht, zid, 0, dist)
            call SaveReal(ht, zid, 1, a)
        endif
        if count <= 40 then
            set dist = LoadReal(ht, zid, 0)
            set a = LoadReal(ht, zid, 1)
            set x = PolarX(GetUnitX(u), dist / 40, a)
            set y = PolarY(GetUnitY(u), dist / 40, a)
            call SetUnitXY(u, x, y, 0)
            if count > 20 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 25, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 25, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(1, 1.4), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 45 then
            set a = LoadReal(ht, zid, 1)
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 55 or count == 65 or count == 75 or count == 85 then
            call Effect("war3mapimported\\az_red-xuanwo.mdx", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1.5, 255, 255, 255, PercentTo255(90))
            call Effect("war3mapimported\\AZ_PA_B2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1.5, 255, 255, 255, 255)
        endif
        if count == 85 then
            call SetUnitFacingEx(u, a, true)
        endif
        if count >= 95 and count <= 130 then
            set x = PolarX(GetUnitX(u), 25, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 25, GetUnitFacing(u))
            if count >= 115 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\kuroikki.mdx", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1, 0.4, 255, 255, 255, PercentTo255(90))
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 115 then
            call Effect("war3mapimported\\akiha claw_0.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 125 then
            call Effect("war3mapimported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 180, 0, 0, 0.45, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.15)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 190, 0, 0, 0.55, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.05)
            call Effect("war3mapimported\\xzblue.mdx", GetUnitX(t), GetUnitY(t), 50, a + 200, 0, 0, 0.6, 1.5, 255, 255, 255, 255)
        endif
        if count == 135 then
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitPathing(u, true)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
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

        if abilId == 'A0GV' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0GW' then
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

        if abilId == 'A0GX' then
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

        if abilId == 'A0GY' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0GZ' then
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

        if abilId == 'A0H0' then
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

        if abilId == 'A0H1' then
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