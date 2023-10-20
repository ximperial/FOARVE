scope kurumispell initializer init
   
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
            call SoundStart("war3mapImported\\Kurumi_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 10 then
            call Effect("war3mapImported\\ShockwavePurple.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion4.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTPurpleNoRing.mdx", x, y, 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\A7_zisekuosan.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A02A'))
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
            call SoundStart("war3mapImported\\Kurumi_2.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        endif
        if count == 90 then
            call Effect("war3mapImported\\DTPurpleNoRing.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\A7_zisekuosan.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 102, 102, 255, 255)
            call Effect("war3mapImported\\PurpleExplode.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count == 100 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A02X')) * GetHeroAgi(u, true))
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
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kurumi_3.mp3")
            call SoundStart("war3mapImported\\Kurumi_3-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\BlackHoles.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
        endif
        if count == 15 then 
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\BlackHoles.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapImported\\ShockwavePurple.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\a7_zisekuosan.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtpurplenoring.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (1 + 0.5 * GetUnitAbilityLevel(u, 'A02I')) * GetHeroAgi(u, true))
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

    private function period4_1 takes nothing returns nothing
        local unit u = GetEnumUnit()

        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)

        set u = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real a2

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
            call SoundStart("war3mapImported\\Kurumi_4.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 600, a)
            set y = PolarY(GetUnitY(t), - 600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.2)
            call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 8.6, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Kurumi_4-1.mp3")
            call Effect("war3mapImported\\Kurumi Field.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 6.6, 255, 255, 255, 255)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 10.6, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count >= 100 and count <= 430 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(t), GetUnitY(t), 1000, null)
            call GroupRemoveUnit(gGroup, u)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 180 then
            set x = PolarX(GetUnitX(t), 400, a + 60)
            set y = PolarY(GetUnitY(t), 400, a + 60)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call AnimEffect(bj_lastCreatedEffect, 8, 2)
            set x = PolarX(GetUnitX(t), 400, a + 120)
            set y = PolarY(GetUnitY(t), 400, a + 120)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call AnimEffect(bj_lastCreatedEffect, 8, 2)
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call AnimEffect(bj_lastCreatedEffect, 8, 2)
            set x = PolarX(GetUnitX(t), 400, a + 240)
            set y = PolarY(GetUnitY(t), 400, a + 240)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call AnimEffect(bj_lastCreatedEffect, 8, 2)
            set x = PolarX(GetUnitX(t), 400, a + 300)
            set y = PolarY(GetUnitY(t), 400, a + 300)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x, y, 0, a2, 0, 0, 1, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call AnimEffect(bj_lastCreatedEffect, 8, 2)
        endif
        if count >= 280 and count <= 430 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
                call Effect("war3mapImported\\[a]bloodex.mdx", x, y, GetRandomReal(25, 100), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\QQQQQR.mdx", x, y, GetRandomReal(25, 100), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 430 then
            call ForGroup(g, function period4_1)
            call DestroyGroup(g)
            set x = PolarX(GetUnitX(t), 400, a + 60)
            set y = PolarY(GetUnitY(t), 400, a + 60)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a + 120)
            set y = PolarY(GetUnitY(t), 400, a + 120)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a)
            set y = PolarY(GetUnitY(t), 400, a)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a + 240)
            set y = PolarY(GetUnitY(t), 400, a + 240)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 400, a + 300)
            set y = PolarY(GetUnitY(t), 400, a + 300)
            set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x, y, 50, a2, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 430 and count <= 470 then
            set x = PolarX(GetUnitX(u), 10, a)
            set y = PolarY(GetUnitY(u), 10, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 470 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir2.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\kurumir2.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 510 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 520 then
            call SoundStart("war3mapImported\\Kurumi_4-2.mp3")
        endif
        if count == 620 then
            call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az-zidan.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        endif
        if count == 630 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A02D')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveUnit(LoadUnitHandle(ht, zid, 3))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set g = null
    endfunction

    private function period5 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Kurumi_5.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        endif
        if count == 10 then
            call Effect("war3mapImported\\Kurumi Field.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Black.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 then
            call Effect("war3mapImported\\ShockwavePurple.mdx", x, y, 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\PurpleExplode.mdx", x, y, 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTPurpleNoRing.mdx", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTPurpleNoRing.mdx", x, y, 300, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTPurpleNoRing.mdx", x, y, 500, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\A7_zisekuosan.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\OrbitalRay.mdx", x, y, 0, randomAngle(), 0, 0, 9, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 15 * GetHeroAgi(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 30 then
            call Effect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdx", x, y, 50, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call VisionArea(GetOwningPlayer(u), 1200, 2, x, y)
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kurumi_6.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call Effect("war3mapImported\\LS SQTX.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3.5, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
        endif
        if count == 100 then
            call Effect("war3mapImported\\KurumiBall.mdx", GetUnitX(t), GetUnitY(t), 800, randomAngle(), 0, 0, 4, 4.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 110 then
            call SetUnitAnimationByIndex(u, 15)
        endif
        if count >= 120 and count <= 240 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 6)
        endif
        if count == 240 then
            call SoundStart("war3mapImported\\Kurumi_6-1.mp3")
            call SetSpecialEffectAnimationByIndex(e, 2)
            call Effect("war3mapImported\\sjkjz.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 250 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
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

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2 
        local real y2
        local real a

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 10 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Kurumi_7.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\Black.mdl", x, y, 0, randomAngle(), 0, 0, 1, 3, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            set x2 = PolarX(x, 600, GetUnitFacing(u) + 60)
            set y2 = PolarY(y, 600, GetUnitFacing(u) + 60)
            set a = Angle(x2, y2, x, y)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x2, y2, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x2, y2, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            set x2 = PolarX(x, 600, GetUnitFacing(u) + 120)
            set y2 = PolarY(y, 600, GetUnitFacing(u) + 120)
            set a = Angle(x2, y2, x, y)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x2, y2, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x2, y2, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            set x2 = PolarX(x, 600, GetUnitFacing(u))
            set y2 = PolarY(y, 600, GetUnitFacing(u))
            set a = Angle(x2, y2, x, y)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x2, y2, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x2, y2, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            set x2 = PolarX(x, 600, GetUnitFacing(u) + 240)
            set y2 = PolarY(y, 600, GetUnitFacing(u) + 240)
            set a = Angle(x2, y2, x, y)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x2, y2, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x2, y2, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            set x2 = PolarX(x, 600, GetUnitFacing(u) + 300)
            set y2 = PolarY(y, 600, GetUnitFacing(u) + 300)
            set a = Angle(x2, y2, x, y)
            call Effect("Abilities\\Spells\\Items\\AIil\\AIilTarget.mdx", x2, y2, 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Kurumi_Tokisaki.mdx", x2, y2, 0, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
        endif
        if count == 10 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 then
            call SoundStart("war3mapImported\\Kurumi_7-1.mp3")
        endif
        if count <= 100 then
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 8 * GetHeroAgi(u, true) / 100)
                    if count >= 10 then
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x2 = PolarX(x, GetRandomReal(- 400, 400), randomAngle())
                set y2 = PolarY(y, GetRandomReal(- 400, 400), randomAngle())
                call Effect("war3mapImported\\[a]bloodex.mdx", x2, y2, GetRandomReal(25, 100), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\QQQQQR.mdx", x2, y2, GetRandomReal(25, 100), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
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

        if abilId == 'A02A' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A02X' then
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

        if abilId == 'A02I' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A02D' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true) 
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A02H' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A02Y' then
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

        if abilId == 'A02Z' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
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