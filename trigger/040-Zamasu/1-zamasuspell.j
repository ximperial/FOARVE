scope zamasuspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zamasu_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 48)
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\darkblast.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\redshockwave.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\red power ball.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 3.5, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            call Effect("war3mapImported\\red ball.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 3, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 11, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0IS'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 1.3, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call Effect("war3mapImported\\superbigexplosion.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\shrapnelshards.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\redring.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            set e = LoadEffectHandle(ht, GetHandleId(z), 11)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\zamasu_2.mp3")
            else
                call SoundStart("war3mapImported\\zamasu_2-1.mp3")
            endif
            call SetUnitAnimationByIndex(u, 40)
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 15 then
            call SetUnitAnimationByIndex(u, 48)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\supershinythingy5.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\red power ball.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\effect_ReiatsuOverFlowbyDeckai.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call Effect("war3mapImported\\pinkredlaser.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ultizoro.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255) 
            call Effect("war3mapImported\\superbigbombexplosionred.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\redshockwave.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 45 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0IT')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
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
            call SoundStart("war3mapImported\\zamasu_4.mp3")
            call SetUnitAnimationByIndex(u, 40)
        endif
        if count <= 130 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.3, 1.7), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 0.95))
                call Effect("war3mapImported\\bubble.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 1.5), 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 130 then
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count >= 130 and count <= 160 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 160 then
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dls2.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SaveReal(ht, zid, 100, a)
        endif
        if count >= 160 and count <= 200 then
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 180 then
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 700, a + 20)
            set y = PolarY(GetUnitY(t), - 700, a + 20)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 40)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(60))
        endif
        if count == 190 then
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 650, a - 20)
            set y = PolarY(GetUnitY(t), - 650, a - 20)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(60))
        endif
        if count == 200 then
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 600, a + 20)
            set y = PolarY(GetUnitY(t), - 600, a + 20)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(60))
        endif
        if count == 210 then
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 450, a - 20)
            set y = PolarY(GetUnitY(t), - 450, a - 20)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(60))
        endif
        if count == 220 then
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 300, a + 20)
            set y = PolarY(GetUnitY(t), - 300, a + 20)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.85, 1, 255, 255, 255, PercentTo255(60))
        endif
        if count == 230 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 30)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 240 then
            call Effect("war3mapImported\\ZamasuEffect1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\ZamasuEffect1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 250 then
            call Effect("war3mapImported\\[Plagiat]Effect43.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtred.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\redshockwave.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 260 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0IV')) * GetHeroStr(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\zamasu_5.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 2, BLEND_MODE_BLEND, "war3mapImported\\zamasuT.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 2, BLEND_MODE_BLEND, "war3mapImported\\zamasuT.tga", 255, 255, 255, 0, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 40)
        endif
        if count <= 100 or count >= 360 and count <= 480 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.5, 2.3), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.75))
                call Effect("war3mapImported\\bubble.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.5, 1.5), 1.5, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 0.65)
        endif
        if count >= 100 and count <= 130 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 130 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dls2.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 160 then
            call ShakeCamera(3.5, GetOwningPlayer(u), 5)
            call ShakeCamera(3.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 63)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 360 then
            call SetUnitAnimationByIndex(u, 40)
        endif
        if count >= 130 and count <= 440 then
            if count >= 130 and count <= 160 then
                set x = PolarX(GetUnitX(t), 15, a)
                set y = PolarY(GetUnitY(t), 15, a)
            elseif count >= 160 and count <= 350 then
                set x = PolarX(GetUnitX(t), 4, a)
                set y = PolarY(GetUnitY(t), 4, a)
            else
                set x = PolarX(GetUnitX(t), 8, a)
                set y = PolarY(GetUnitY(t), 8, a)
            endif
            call SetUnitXY(t, x, y, 2)
            if count >= 160 and count <= 360 then
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 10 then
                    call SaveInteger(ht, zid, 1, 0)
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
                    call Effect("war3mapImported\\wavejojo.mdl", x, y, GetRandomReal(100, 150), randomAngle(), GetRandomReal(- 60, - 40), 0, GetRandomReal(1.2, 1.5), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
                    call Effect("war3mapImported\\wavejojo.mdl", x, y, GetRandomReal(100, 150), randomAngle(), GetRandomReal(- 60, - 40), 0, GetRandomReal(1.2, 1.5), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
                    call Effect("war3mapImported\\Hit.mdl", x, y, GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(0.9, 1.3), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), randomAngle())
                    call Effect("war3mapImported\\Hit.mdl", x, y, GetRandomReal(100, 150), randomAngle(), 0, 0, GetRandomReal(0.9, 1.3), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
                endif
            endif
            set iterator = LoadInteger(ht, zid, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 2, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 2, 0)
                call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.85, 1.25), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.85))
            endif
        endif
        if count == 480 then
            call SetUnitAnimationByIndex(u, 49)
            call SetUnitTimeScale(u, 0.7)
        endif
        if count >= 480 and count <= 530 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 510 then
            call Effect("war3mapImported\\ZamasuEffect1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\ZamasuEffect1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 180, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 520 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\ZamasuEffect2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set i = 0
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(t), 250, i * 40)
                set y = PolarY(GetUnitY(t), 250, i * 40)
                call Effect("war3mapImported\\red ball.mdl", x, y, 50, randomAngle(), 0, 0, 4, 3, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
                set i = i + 1
            endloop
        endif
        if count == 530 then
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
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local group g2 = LoadGroupHandle(ht, zid, 2)
        local effect e
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local real h
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Zamasu_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 4, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\violet spark by deckai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\SuperShinyThingy7.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = GetUnitModelObjectPositionX(u, "box29")
            set y = GetUnitModelObjectPositionY(u, "box29")
            call Effect("war3mapImported\\kamehaballrose.mdl", x, y, 20, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\shockwave(pink).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 or count == 50 or count == 60 or count == 70 or count == 80 then
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 20 or count == 40 or count == 60 then
            call Effect("war3mapImported\\shockwave(pink).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperShinyThingy7.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 70 then
            call SetUnitAnimationByIndex(u, 7)
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\shockwave(pink).mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\A7_zisekuosan.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 75 then
            call Effect("war3mapImported\\kamehaballrose.mdl", GetUnitX(u), GetUnitY(u), 80, a, 0, 0, 4, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 10, bj_lastCreatedEffect)
        endif
        if count <= 80 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g2) then 
                    call GroupAddUnit(g2, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.5)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 80 then
            call ForGroup(g2, function ResetMoveSpeed)
            call GroupClear(g2)
        endif
        if count >= 80 and count <= 110 then
            set e = LoadEffectHandle(ht, zid, 10)
            set x = PolarX(GetEffectX(e), 50, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), 50, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
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
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\kamehaballrose.mdl", x, y, 150, GetSpecialEffectYaw(e), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperShinyThingy7.mdl", x, y, 150, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 110 then
            set e = LoadEffectHandle(ht, zid, 10)
            call Effect("war3mapImported\\SuperBigBombExplosionPink.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\firagawhite.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 4, 1.5, 255, 100, 180, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\dtbluenoringwhite.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 3, 2, 255, 100, 180, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
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
        if count == 1 then
            call SoundStart("war3mapImported\\zamasu_7.mp3")
            call SetUnitAnimationByIndex(u, 40)
            call Effect("war3mapImported\\shockwave(pink).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperShinyThingy7.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\valkdust.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 50 then
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\DarkSword.mdl", u, "hand right"))
        endif
        if count == 75 or count == 115 or count == 155 or count == 195 or count == 225 or count == 255 or count == 285 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            set x = PolarX(GetUnitX(t), 140, randomAngle())
            set y = PolarY(GetUnitY(t), 140, randomAngle())
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimation(u, "attack")
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\bloodex.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\zamasueffect1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2.5, 1.5, 150, 50, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
            call Effect("war3mapImported\\StarSlash(Missle).mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2.5, 1.5, 150, 50, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 80 and count <= 110 or count >= 120 and count <= 150 or count >= 160 and count <= 190 or count >= 200 and count <= 220 or count >= 230 and count <= 250 or count >= 260 and count <= 280  then
            if count > 190 then
                set x = PolarX(GetUnitX(t), 15, a)
                set y = PolarY(GetUnitY(t), 15, a)
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
            endif
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 0.9), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.65, 0.75))
            endif
        endif
        if count == 290 then
            call SetUnitAnimationByIndex(u, 63)
        endif
        if count >= 290 and count <= 350 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\bloodex.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\zamasueffect1.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, - 45, 2, 1.5, 150, 50, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                else
                    call Effect("war3mapImported\\zamasueffect1.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, 45, 2, 1.5, 150, 50, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                endif
                call Effect("war3mapImported\\StarSlash(Missle).mdl", GetUnitX(t), GetUnitY(t), GetRandomReal(0, 50), randomAngle(), 0, 0, 2, 1.5, 150, 50, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\StarSlash(Missle).mdl", GetUnitX(t), GetUnitY(t), GetRandomReal(0, 50), randomAngle(), 0, 0, 2, 1.5, 150, 50, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
            endif
        endif
        if count == 355 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\dtpink.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\A7_zisekuosan.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\shockwave(pink).mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\helgate1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 365 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            if GetUnitAbilityLevel(u, 'B01B') > 0 then
                call DamageUnit(u, t, 10 * GetHeroStr(u, true))
            else
                call DamageUnit(u, t, 8 * GetHeroStr(u, true))
            endif
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

        if abilId == 'A0IS' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0IT' then
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

        if abilId == 'A0IU' then
            call SoundStart("war3mapImported\\zamasu_3.mp3")
            call Effect("Abilities\\Spells\\Undead\\DarkRitual\\DarkRitualTarget.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\violet spark by deckai.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtpink.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\shadowtornado.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
        endif

        if abilId == 'A0IV' then
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

        if abilId == 'A0IW' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0IX' then
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

        if abilId == 'A0IY' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 2, 0)
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