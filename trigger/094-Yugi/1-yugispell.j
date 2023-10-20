scope yugispell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local group g = LoadGroupHandle(ht, zid , 1)
        local real a = LoadReal(ht, zid , 0)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yugi_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 10 then
            set i = 0
            loop
                exitwhen i > 10
                set x = PolarX(GetUnitX(u), 120 * i, a)
                set y = PolarY(GetUnitY(u), 120 * i, a)
                call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A043'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                set i = i + 1
            endloop
            call Effect("war3mapimported\\AZ_Z020_3.mdx", GetUnitX(u) , GetUnitY(u), 0, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real x
        local real y
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yugi_2.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "war3mapImported\\YugiW.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "war3mapImported\\YugiW.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapimported\\zygz.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Kirito_7-3.mp3")
            call Effect("war3mapimported\\pinkghj.mdx", GetUnitX(t), GetUnitY(t), 1500, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 70, 0.4, GetSpecialEffectYaw(bj_lastCreatedEffect))
            set x = PolarX(GetUnitX(t), 100, a + 45)
            set y = PolarY(GetUnitY(t), 100, a + 45)
            call Effect("war3mapimported\\pinkghj.mdx", x, y, 1500, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 70, 0.4, GetSpecialEffectYaw(bj_lastCreatedEffect))
            set x = PolarX(GetUnitX(t), 100, a + 135)
            set y = PolarY(GetUnitY(t), 100, a + 135)
            call Effect("war3mapimported\\pinkghj.mdx", x, y, 1500, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 70, 0.4, GetSpecialEffectYaw(bj_lastCreatedEffect))
            set x = PolarX(GetUnitX(t), 100, a + 225)
            set y = PolarY(GetUnitY(t), 100, a + 225)
            call Effect("war3mapimported\\pinkghj.mdx", x, y, 1500, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 70, 0.4, GetSpecialEffectYaw(bj_lastCreatedEffect))
            set x = PolarX(GetUnitX(t), 100, a + 315)
            set y = PolarY(GetUnitY(t), 100, a + 315)
            call Effect("war3mapimported\\pinkghj.mdx", x, y, 1500, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call MoveEffect3(bj_lastCreatedEffect, 0, - 70, 0.4, GetSpecialEffectYaw(bj_lastCreatedEffect))
        endif
        if count == 40 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A06Y')) * GetHeroInt(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2
        local real y2
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local integer i 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yugi_4.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "war3mapImported\\YugiR.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            set x2 = PolarX(GetUnitX(u), 120, a + 120)
            set y2 = PolarY(GetUnitY(u), 120, a + 120)
            call Effect("war3mapimported\\Dark Magic.mdx", x2, y2, 50, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
        endif
        if count == 10 then
            call Effect("war3mapimported\\sjkjz.mdx", x, y, 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 30 then
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A07M')) * GetHeroInt(u, true))
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

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\Yugi_4-1.mp3")
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t) , - 600, a)
            set y = PolarY(GetUnitY(t) , - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapimported\\az_airfloww12.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 3, 255, 0, 255, 255)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 10, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Yugi_4-2.mp3")
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapImported\\obelisk.mdx", x, y, 0, a, 0, 0, 6, 8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 220 then
            call SoundStart("war3mapImported\\Yugi_5-1.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 2) 
        endif
        if count == 350 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\YugiR2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\YugiR2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 470 then
            call SetUnitAnimationByIndex(u, 6)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 4)
        endif
        if count >= 150 and count <= 480 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set e = LoadEffectHandle(ht, zid, 100)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, a, 0, 0, GetRandomReal(1, 2), 1, 255, 0, 255, 255)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, a, 0, 0, GetRandomReal(1, 2), 1, 255, 0, 255, 255)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, a, 0, 0, GetRandomReal(1, 2), 1, 255, 0, 255, 255)
            endif
        endif
        if count == 500 then 
            call SoundStart("war3mapImported\\Yugi_7-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_YuBanMeiQin_Lightning_ZhenZhengDeLuoLei-purp.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 510 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A07M')) * GetHeroInt(u, true))
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
        set e = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\Yugi_5.mp3")
            call ShakeCamera(2.5, GetOwningPlayer(u), 10)
            call ShakeCamera(2.5, GetOwningPlayer(t), 10)
            call SetUnitAnimationByIndex(u, 5)
            set x = PolarX(GetUnitX(u), - 600, a)
            set y = PolarY(GetUnitY(u), - 600, a)
            call Effect("war3mapimported\\SkyDragon.mdx", x, y, 100, a, 0, 0, 2, 9.2, 255, 255, 255, 0)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\oxgz.mdx", x, y, 0, randomAngle(), 0, 0, 5, 9.2, 255, 0, 0, 255)
            call Effect("war3mapimported\\Black.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Yugi_5-1.mp3")
        endif
        if count >= 100 and count <= 200 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set e = LoadEffectHandle(ht, zid, 100)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\plasma+zanber+lightning.mdx", GetEffectX(e), GetEffectY(e), 200, randomAngle(), -230, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\plasma+zanber+lightning.mdx", GetEffectX(e), GetEffectY(e), 300, randomAngle(), -230, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Yugi_5-2.mp3")
        endif
        if count <= 200 then
            call SaveReal(ht, zid, 10, LoadReal(ht, zid, 10) + 0.5)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadReal(ht, zid, 10)))
        endif
        if count == 300 then
            call SetUnitAnimationByIndex(u, 6)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 2)
            call SetSpecialEffectTimeScale(e, 1.6)
        endif
        if count == 350 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\YugiT.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\YugiT.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count >= 350 and count <= 450 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then
                call SaveInteger(ht, zid, 1, 0)
                set e = LoadEffectHandle(ht, zid, 100)
                set i = 1
                loop
                    exitwhen i > 10
                    set x = PolarX(GetEffectX(e), 200 * i, a)
                    set y = PolarY(GetEffectY(e), 200 * i, a)
                    call Effect("war3mapimported\\hhzy123.mdx", x, y, 350, a, - 90, 0, 3, 1, 255, 255, 255, PercentTo255(10))
                    set i = i + 1
                endloop
            endif
        endif
        if count == 400 then
            call SoundStart("war3mapImported\\Yugi_5-3.mp3")
        endif
        if count == 450 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroInt(u, true))
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
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local group g = LoadGroupHandle(ht, zid , 1)
        local group g2 = LoadGroupHandle(ht, zid , 2)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = LoadReal(ht, zid , 0)
        local real x
        local real y
        local integer i
        local effect e
        local unit d

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        if count <= 470 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Yugi_6.mp3")
            call ShakeCamera(3.5, GetOwningPlayer(u), 10)
            call VisionArea(GetOwningPlayer(u), 1500, 10, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 5)
            set x = PolarX(GetUnitX(u), - 400, a)
            set y = PolarY(GetUnitY(u), - 400, a)
            call Effect("war3mapimported\\hehehehehe33.mdx", x, y, 0, a, 0, 0, 1, 3, 255, 255, 255, 255)
        endif
        if count >= 40 and count <= 120 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), - 400, a)
                set y = PolarY(GetUnitY(u), - 400, a)
                set x = PolarX(x, GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(y, GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(u), - 400, a)
                set y = PolarY(GetUnitY(u), - 400, a)
                set x = PolarX(x, GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(y, GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapimported\\misaka light a.mdx", x, y, 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 120 then
            set x = PolarX(GetUnitX(u), - 400, a)
            set y = PolarY(GetUnitY(u), - 400, a)
            call Effect("war3mapimported\\demon.mdx", x, y, 0, a, 0, 0, 3, 11.2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 170 then
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 250 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 1.5, BLEND_MODE_BLEND, "war3mapImported\\YugiF.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 300 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 6)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call UnitEnableMovement(d, false, false)
            call UnitApplyTimedLife(d, 'BTLF', 2)
            call SaveUnitHandle(ht, zid, 10, d)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 300 or count == 320 or count == 340 or count == 360 or count == 380 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count >= 300 and count <= 420 then
            if count < 400 then
                set d = LoadUnitHandle(ht, zid, 10)
                set e = LoadEffectHandle(ht, zid, 100)
                call SaveReal(ht, zid, 0, GetUnitFacing(d))
                call SetUnitFacing(u, GetUnitFacing(d))
                set x = PolarX(GetUnitX(u), - 400, GetUnitFacing(d))
                set y = PolarY(GetUnitY(u), - 400, GetUnitFacing(d))
                call SetSpecialEffectPositionEx(e, x, y, GetAxisZ(x, y))
                call SetSpecialEffectYaw(e, GetUnitFacing(d))
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), - 400, a)
                set y = PolarY(GetUnitY(u), - 400, a)
                call Effect("war3mapimported\\ethereal lightning2.mdx", x, y, 300, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 420 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 0)
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 470 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectTimeScale(e, 0.05)
            set x = PolarX(GetUnitX(u), 200, a)
            set y = PolarY(GetUnitY(u), 200, a)
            call Effect("war3mapimported\\dianqiu.mdx", x, y, 150, a, 0, 0, 8, 3.4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count == 480 or count == 510 or count == 540 or count == 570 or count == 610 then
            call SoundStart("war3mapImported\\Yugi_6-1.mp3")
        endif
        if count >= 470 and count <= 630 then
            set e = LoadEffectHandle(ht, zid, 101)
            set x = PolarX(GetEffectX(e), 25, a)
            set y = PolarY(GetEffectY(e), 25, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 11 * GetHeroInt(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 500, 500), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 500, 500), randomAngle())
                call Effect("war3mapimported\\misaka light b.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                set x = PolarX(GetEffectX(e), GetRandomReal(- 500, 500), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 500, 500), randomAngle())
                call Effect("war3mapimported\\misaka light b.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            endif
        endif
        if count <= 470 then
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
        if count == 470 then
            call ForGroup(g2, function ResetMoveSpeed)
            call DestroyGroup(g2)
        endif
        if count == 630 then
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
        set d = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local group g = LoadGroupHandle(ht, zid , 1)
        local real a = LoadReal(ht, zid , 0)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real x
        local real y
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yugi_7.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 1.5, BLEND_MODE_BLEND, "war3mapImported\\YugiD.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            set x = PolarX(GetUnitX(u), 200, a)
            set y = PolarY(GetUnitY(u), 200, a)
            call Effect("war3mapimported\\exodia.mdx", x, y, 0, a, 0, 0, 2.5, 1.5, 255, 255, 255, 0)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\AZ_Rune31.mdx", x, y, 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
        endif
        if count <= 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SaveReal(ht, zid, 10, LoadReal(ht, zid, 10) + 100 / 30)
            call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadReal(ht, zid, 10)))
        endif
        if count == 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 2)
            call SetSpecialEffectTimeScale(e, 1.6)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Yugi_7-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 1
            loop
                exitwhen i > 10
                set x = PolarX(GetEffectX(e), 140 * i, a)
                set y = PolarY(GetEffectY(e), 140 * i, a)
                call GroupEnumUnitsInRange(gGroup, x, y, 400, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call ShakeCamera(1, GetOwningPlayer(gUnit), 15)
                        call DamageUnit(u, gUnit, 8 * GetHeroInt(u, true))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                call Effect("war3mapimported\\SZBYAFB2.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 50 then
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
        set e = null
    endfunction

    private function period8 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\Yugi_7-2.mp3")
            call SoundStart("war3mapImported\\Yugi_7-3.mp3")
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t) , - 400, a)
            set y = PolarY(GetUnitY(t) , - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapimported\\Black.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 25.4, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 300 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 2, BLEND_MODE_BLEND, "war3mapImported\\YugiD2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 350 then
            call SetUnitAnimationByIndex(u, 5)
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapImported\\kuriboh_compressed.mdx", x, y, 0, a, 0, 0, 1.5, 18.4, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 3)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 700 then
            call SoundStart("war3mapImported\\Yugi_7-4.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 1
            loop
                exitwhen i > 3
                set x = PolarX(GetEffectX(e), GetRandomReal(- 200, 200), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 200, 200), randomAngle())
                call Effect("war3mapImported\\kuriboh_compressed.mdx", x, y, 0, a, 0, 0, 1.5, 11.4, 255, 255, 255, 0)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call SaveEffectHandle(ht, zid, 100 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count >= 700 and count <= 750 then
            set i = 1
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SaveInteger(ht, zid, 100 + i, LoadInteger(ht, zid, 100 + i) + 2)
                call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadInteger(ht, zid, 100 + i)))
                set i = i + 1
            endloop
        endif
        if count == 750 then
            call SoundStart("war3mapImported\\Yugi_7-5.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 1
            loop
                exitwhen i > 3
                set x = PolarX(GetEffectX(e), GetRandomReal(- 200, 200), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 200, 200), randomAngle())
                call Effect("war3mapImported\\kuriboh_compressed.mdx", x, y, 0, a, 0, 0, 1.5, 10.4, 255, 255, 255, 0)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call SaveEffectHandle(ht, zid, 103 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count >= 750 and count <= 800 then
            set i = 1
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid, 103 + i)
                call SaveInteger(ht, zid, 103 + i, LoadInteger(ht, zid, 103 + i) + 2)
                call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadInteger(ht, zid, 103 + i)))
                set i = i + 1
            endloop
        endif
        if count == 800 then
            call SoundStart("war3mapImported\\Yugi_7-4.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 1
            loop
                exitwhen i > 3
                set x = PolarX(GetEffectX(e), GetRandomReal(- 200, 200), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 200, 200), randomAngle())
                call Effect("war3mapImported\\kuriboh_compressed.mdx", x, y, 0, a, 0, 0, 1.5, 9.4, 255, 255, 255, 0)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call SaveEffectHandle(ht, zid, 106 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count >= 800 and count <= 850 then
            set i = 1
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid, 106 + i)
                call SaveInteger(ht, zid, 106 + i, LoadInteger(ht, zid, 106 + i) + 2)
                call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadInteger(ht, zid, 106 + i)))
                set i = i + 1
            endloop
        endif
        if count == 850 then
            call SoundStart("war3mapImported\\Yugi_7-5.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            set i = 1
            loop
                exitwhen i > 3
                set x = PolarX(GetEffectX(e), GetRandomReal(- 200, 200), randomAngle())
                set y = PolarY(GetEffectY(e), GetRandomReal(- 200, 200), randomAngle())
                call Effect("war3mapImported\\kuriboh_compressed.mdx", x, y, 25, a, 0, 0, 1.5, 8.4, 255, 255, 255, 0)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call SaveEffectHandle(ht, zid, 109 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count >= 850 and count <= 900 then
            set i = 1
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid, 109 + i)
                call SaveInteger(ht, zid, 109 + i, LoadInteger(ht, zid, 109 + i) + 2)
                call SetSpecialEffectVertexColour(e, 255, 255, 255, PercentTo255(LoadInteger(ht, zid, 109 + i)))
                set i = i + 1
            endloop
        endif
        if count == 1000 then
            call SoundStart("war3mapImported\\Yugi_7-6.mp3")
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count >= 1010 and count <= 1200 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx", x, y, GetRandomReal(50, 200), randomAngle(), 0, 0, GetRandomReal(1, 3), 1, 255, 255, 255, 255)
                if count >= 1100 then
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                    call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx", x, y, GetRandomReal(50, 200), randomAngle(), 0, 0, GetRandomReal(1, 3), 1, 255, 255, 255, 255)
                endif
                call Effect("war3mapImported\\WindExploreEffect(Bigger).mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 1010 then
            call ShakeCamera(3.5, GetOwningPlayer(u), 10)
            call ShakeCamera(3.5, GetOwningPlayer(t), 10)
        endif
        if count == 1010 or count == 1050 or count == 1090 or count == 1130 then
            call SoundStart("war3mapImported\\Yugi_7-4.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 102)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 1020 or count == 1060 or count == 1100 or count == 1140 or count == 1180 then
            call SoundStart("war3mapImported\\Yugi_7-5.mp3")
            set e = LoadEffectHandle(ht, zid, 103)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 104)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 105)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 1030 or count == 1070 or count == 1110 or count == 1150 or count == 1190 then
            call SoundStart("war3mapImported\\Yugi_7-4.mp3")
            set e = LoadEffectHandle(ht, zid, 106)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 107)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 108)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 1040 or count == 1080 or count == 1120 or count == 1160 or count == 1200 then
            call SoundStart("war3mapImported\\Yugi_7-5.mp3")
            set e = LoadEffectHandle(ht, zid, 109)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 110)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 111)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set e = LoadEffectHandle(ht, zid, 112)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 1250 then
            call SoundStart("war3mapImported\\Yugi_7-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\BY_Wood_Sand_YueKongJi.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 1270 then 
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
            call StartAbilityCooldown(GetUnitAbility(u, 'A07P'), 60)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroInt(u, true))
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
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A043' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A06Y' then 
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

        if abilId == 'A07M' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if t != null then
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
                call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period4)
            else
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call TimerStart(z, 0.02, true, function period3)
            endif
        endif
        
        if abilId == 'A07N' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveInteger(ht, GetHandleId(z) , 2, 0)
            call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A07O' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z) , 2, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A07P' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveInteger(ht, GetHandleId(z) , 2, 0)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            if t != null then
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
                call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period8)
            else
                call SaveReal(ht, GetHandleId(z) , 0, a)
                call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
                call TimerStart(z, 0.02, true, function period7)
            endif
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope