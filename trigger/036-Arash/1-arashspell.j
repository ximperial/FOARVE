scope arashspell initializer init
   
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
            call SoundStart("war3mapImported\\Arash_1.mp3")
            call SoundStart("war3mapImported\\Cronus_1-1.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", GetUnitX(u), GetUnitY(u), 50, a + 20, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", GetUnitX(u), GetUnitY(u), 50, a - 20, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 1)
                call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0H5'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                set i = i + 1
            endloop
        endif
        if count == 15 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SetSpecialEffectAnimation(e, "death")
                call SetSpecialEffectTimeScale(e, 0.75)
                call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set i = i + 1
            endloop
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
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arash_2.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count == 10 then
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFlyHeight(u, 600, 0)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Cronus_1-1.mp3")
            call Effect("Abilities\\Weapons\\PoisonArrow\\PoisonArrowMissile.mdl", GetUnitX(u), GetUnitY(u), 600, a, - 45, 0, 3, 1.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 15 and count <= 35 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 20, a)
            set y = PolarY(GetEffectY(e), dist / 20, a)
            call SetEffectXY(e, x, y, 0)
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetSpecialEffectZ(e, h - 30)
        endif
        if count == 25 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 35 then
            call Effect("war3mapImported\\fireeffectorange.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\firessl.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 40 then 
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 600, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0H6')) * GetHeroStr(u, true))
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arash_4.mp3")
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count <= 50 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.25), 1.5, 255, 255, 255, PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set x = PolarX(GetUnitX(u), - 50, a)
                set y = PolarY(GetUnitY(u), - 50, a)
                call Effect("war3mapImported\\model (117)_2.mdx", x, y, 50, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 50 then
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 50 and count <= 65 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 15, a)
            set y = PolarY(GetEffectY(e), dist / 15, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
        endif
        if count == 65 then 
            call SoundStart("war3mapImported\\Cronus_3-3.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.75)
            call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 70 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0H8')) * GetHeroStr(u, true))
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
        local effect e

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
            call SoundStart("war3mapImported\\Arash_5.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 5, BLEND_MODE_BLEND, "war3mapImported\\arasht.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 5, BLEND_MODE_BLEND, "war3mapImported\\arasht.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count <= 600 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\windcirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(1.1, 1.4), 1.5, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.25), 1.5, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1.5, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.35), 1.5, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(80))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                set x = PolarX(GetUnitX(u), - 50, a)
                set y = PolarY(GetUnitY(u), - 50, a)
                call Effect("war3mapImported\\model (117)_2.mdx", x, y, 50, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 600 then
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 3, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 600 and count <= 630 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 30, a)
            set y = PolarY(GetEffectY(e), dist / 30, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapimported\\wind3.mdx", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, GetRandomReal(1, 1.25), 1, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapimported\\wind3.mdx", GetEffectX(e), GetEffectY(e), 150, a, - 90, 0, GetRandomReal(1, 1.25), 1, PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(GetRandomReal(20, 50)), PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 620 then
            call SoundStart("war3mapImported\\Cronus_1-1.mp3")
        endif
        if count == 630 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.5)
            call Effect("war3mapimported\\Kaca_Pecah.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 12, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\File00002105.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[A]ChuShou_Blue.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        endif
        if count == 640 then
            call SetUnitTimeScale(u, 1)
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Arash_6.mp3")
            call SoundStart("war3mapImported\\Arash_6-1.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.2)
            call CinematicFilterGenericEx(GetOwningPlayer(u), 2, BLEND_MODE_BLEND, "war3mapImported\\arashf.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\arashf.tga", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 15 then
            call Effect("war3mapImported\\exshexian111.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            set i = 1
            loop
                exitwhen i > 6
                set x = PolarX(GetUnitX(u), 250 * i, a)
                set y = PolarY(GetUnitY(u), 250 * i, a)
                call Effect("war3mapImported\\LW11.mdl", x, y, 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                set i = i + 1
            endloop
        endif
        if count == 25 then 
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

    private function period6_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local real a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
        local real x = PolarX(GetEffectX(e), 10 + dist / 20, a)
        local real y = PolarY(GetEffectY(e), 10 + dist / 20, a)

        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
        if dist <= 100 then
            call SoundStart("war3mapImported\\Cronus_1-1.mp3")
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call Effect("war3mapImported\\by_wood_effect_qigongbo_lan.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call DamageUnit(u, t, GetHeroStr(u, true))
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

    private function period6_1 takes unit u, unit t returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))

        call SaveUnitHandle(ht, zid, 0, u)
        call SaveUnitHandle(ht, zid, 1, t)
        call Effect("war3mapImported\\by_wood_effect_qigongbo_lan.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 0, 255, 255, 255, 255)
        call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        call TimerStart(z, 0.02, true, function period6_2)

        set z = null
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
        if count == 1 then
            call SoundStart("war3mapImported\\Arash_7.mp3")
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Arash_7-1.mp3")
            call SetUnitTimeScale(u, 2)
        endif
        if count >= 10 and count <= 90 then 
            call SetUnitFacing(u, a)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call SetUnitAnimation(u, "attack")
                call period6_1(u, t)
            endif
        endif
        if count == 95 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueTargetOrderById(u, 851983, t)
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

        if abilId == 'A0H5' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0H6' then
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

        if abilId == 'A0H7' then
            call SoundStart("war3mapImported\\Arash_3.mp3")
        endif

        if abilId == 'A0H8' then
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

        if abilId == 'A0H9' then
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

        if abilId == 'A0HA' then
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

        if abilId == 'A0HB' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
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