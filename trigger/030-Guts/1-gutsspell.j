scope gutsspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2 
        local real y2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\WindWeak2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindWeak(Thicker).mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Guts_1.mp3")
            call Effect("war3mapImported\\[A]red-shoot-big.mdl", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            set x2 = PolarX(GetUnitX(u), 50, GetUnitFacing(u))
            set y2 = PolarY(GetUnitY(u), 50, GetUnitFacing(u))
            call Effect("war3mapImported\\wind2.mdl", x2, y2, 150, GetUnitFacing(u), - 90, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\wavejojo.mdl", x2, y2, 150, GetUnitFacing(u), - 90, 0, 1, 1, 255, 255, 255, PercentTo255(70))
        endif
        if count == 10 then 
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", x, y, 100, randomAngle(), 0, 0, 2.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 2.3, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A02W'))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_2.mp3")
            call SoundStart("war3mapImported\\Guts_2-1.mp3")
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count == 1 or count == 20 or count == 40 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 4) 
        endif
        if count == 50 or count == 100 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 50, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50)) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 50 and count <= 100 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
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
        if count == 75 then
            call SetUnitAnimationByIndex(u, 8) 
            call SetUnitTimeScale(u, 0.55)
        endif
        if count == 85 then
            set x = PolarX(GetUnitX(t), - 150, a)
            set y = PolarY(GetUnitY(t), - 150, a)
            call Effect("war3mapImported\\AZ_PAFeathermoon_C_Caster.mdl", x, y, 50, a, 0, 0, 2.6, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 90 then
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 100 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0B3')) * GetHeroStr(u, true))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_2-2.mp3")
            set x = PolarX(GetUnitX(t), 600, a)
            set y = PolarY(GetUnitY(t), 600, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 100 or count == 130 or count == 160 or count == 190 or count == 220 or count == 250 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.7, 1.5, 225, 70, 70, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.25, 1.5, 225, 70, 70, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 225, 70, 70, PercentTo255(70))
        endif
        if count == 190 or count == 210 or count == 240 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 50, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(50)) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 190 and count <= 250 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
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
        if count == 220 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.6) 
        endif
        if count == 230 then
            call SoundStart("war3mapImported\\Guts_2-3.mp3")
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, 50, a, 0, 0, 2.5, 2, 255, 255, 255, PercentTo255(90))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 240 then
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, 0.7, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.25, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 250 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2 + GetUnitAbilityLevel(u, 'A0B3')) * GetHeroStr(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 20 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_3.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 9)
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\CF2.mdl", x, y, 50, a, 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(u), 150, a)
            set y = PolarY(GetUnitY(u), 150, a)
            call Effect("war3mapImported\\rasengan_eff4.mdl", x, y, 100, a, - 90, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("Abilities\\Weapons\\BoatMissile\\BoatMissile.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call SaveReal(ht, zid, 10, dist)
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count <= 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            set dist = LoadReal(ht, zid, 10)
            set x2 = PolarX(GetEffectX(e), dist / 30, GetSpecialEffectYaw(e))
            set y2 = PolarY(GetEffectY(e), dist / 30, GetSpecialEffectYaw(e))
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetEffectXY(e, x2, y2, 1)
            if count > 20 then
                call SetSpecialEffectZ(e, h - 30)
            else
                call SetSpecialEffectZ(e, h + 15)
            endif
        endif
        if count == 30 then 
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetEffectX(e), GetEffectY(e), 150, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\[A]Explodeorange.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 2.3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0B4')) * GetHeroStr(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_4.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.25)
            call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 1 or count == 30 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(60))
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 40 and count <= 70 then 
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
        if count == 50 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 50 or count == 70 or count == 110 or count == 130 or count == 180 or count == 190 or count == 210 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 60 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 65 then
            set x = PolarX(GetUnitX(t), - 175, a)
            set y = PolarY(GetUnitY(t), - 175, a)
            call Effect("war3mapImported\\File00000827.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Guts_4-1.mp3")
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[DoFT]az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 70 or count == 220 then
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count >= 70 and count <= 150 then
            set x = PolarX(GetUnitX(u), 10, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 10, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 150 then
            call SetUnitTimeScale(u, 2)
            call SetUnitFacing(u, a)
        endif
        if count == 180 then
            call SetUnitTimeScale(u, 0.5)
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count >= 180 and count <= 230 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
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
        if count == 200 then
            call SetUnitTimeScale(u, 0.75) 
        endif
        if count == 220 then
            set x = PolarX(GetUnitX(t), - 220, a)
            set y = PolarY(GetUnitY(t), - 220, a)
            call Effect("war3mapImported\\az_pa_c33.mdl", x, y, 100, a, 0, 0, 2.2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 230 then
            call Effect("war3mapImported\\hero_dwarvensniper_n3s_o_target.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7) 
            call Effect("war3mapImported\\[DoFT]az_hit-blue-blade.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
            call Effect("war3mapImported\\blue-slash-more.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 0.75, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 240 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0B5')) * GetHeroStr(u, true))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local real a2
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\Guts_4-2.mp3")
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 0.55)
        endif
        if count == 1 or count == 20 or count == 40 or count == 70 or count == 90 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5)) 
        endif
        if count == 40 then
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 150, a, 0, - 270, 2.25, 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
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
            if count > 30 then 
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0)
            else 
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 10, 0)
            endif
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Guts_4-3.mp3") 
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 50 and count <= 100 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1 
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(40))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, GetRandomReal(1.35, 1.55), 1.5, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            endif
        endif
        if count == 100 then
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 100 or count == 130 or count == 160 or count == 190 then
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), - 500, a2)
            set y = PolarY(GetUnitY(t), - 500, a2)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\guts.mdl", x, y, 0, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Guts_4-4.mp3")
        endif
        if count == 160 or count == 190 or count == 220 or count == 250 then
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), - 500, a2)
            set y = PolarY(GetUnitY(t), - 500, a2)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\guts.mdl", x, y, 0, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count == 220 or count == 250 or count == 280 then
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), - 500, a2)
            set y = PolarY(GetUnitY(t), - 500, a2)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\guts.mdl", x, y, 0, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.95)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            set e = bj_lastCreatedEffect
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8)) 
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            set x = PolarX(GetEffectX(e), - 50, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), - 50, GetSpecialEffectYaw(e))
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count >= 100 and count <= 310 then
            set e = LoadEffectHandle(ht, zid, 100)
            if e != null then
                set x = PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                if count >= 110 and count <= 130 or count >= 140 and count <= 160 then
                    set x = PolarX(GetUnitX(t), 2, GetSpecialEffectYaw(e))
                    set y = PolarY(GetUnitY(t), 2, GetSpecialEffectYaw(e))
                    call SetUnitXY(t, x, y, 2)
                endif 
            endif
            set e = LoadEffectHandle(ht, zid, 101)
            if e != null then
                set x = PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                if count >= 170 and count <= 190 or count >= 200 and count <= 220 then
                    set x = PolarX(GetUnitX(t), 2, GetSpecialEffectYaw(e))
                    set y = PolarY(GetUnitY(t), 2, GetSpecialEffectYaw(e))
                    call SetUnitXY(t, x, y, 2)
                endif
            endif
            set e = LoadEffectHandle(ht, zid, 102)
            if e != null then
                set x = PolarX(GetEffectX(e), 30, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 30, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, GetAxisZ(x, y))
                if count >= 230 and count <= 250 or count >= 260 and count <= 280 then
                    set x = PolarX(GetUnitX(t), 2, GetSpecialEffectYaw(e))
                    set y = PolarY(GetUnitY(t), 2, GetSpecialEffectYaw(e))
                    call SetUnitXY(t, x, y, 2)
                endif
            endif
        endif
        if count == 110 or count == 140 or count == 170 or count == 200 or count == 230 or count == 260 or count == 290 then
            set e = LoadEffectHandle(ht, zid, 100)
            if e != null then
                set a = GetSpecialEffectYaw(e)
                set x = PolarX(GetUnitX(t), - 300, a)
                set y = PolarY(GetUnitY(t), - 300, a)
                call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
                call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            endif
            set e = LoadEffectHandle(ht, zid, 101)
            if e != null then
                set a = GetSpecialEffectYaw(e)
                set x = PolarX(GetUnitX(t), - 300, a)
                set y = PolarY(GetUnitY(t), - 300, a)
                call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
                call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            endif
            set e = LoadEffectHandle(ht, zid, 102)
            if e != null then
                set a = GetSpecialEffectYaw(e)
                set x = PolarX(GetUnitX(t), - 300, a)
                set y = PolarY(GetUnitY(t), - 300, a)
                call Effect("war3mapImported\\az_pa_c-black.mdl", x, y, 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.6, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
                call Effect("war3mapImported\\[A]wavejojo.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1.75, 2.5), 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
                set x = PolarX(GetUnitX(t), 50, GetSpecialEffectYaw(e))
                set y = PolarY(GetUnitY(t), 50, GetSpecialEffectYaw(e))
                call SetUnitXY(t, x, y, 2)
            endif
        endif
        if count == 310 then
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            set a2 = randomAngle()
            set x = PolarX(GetUnitX(t), 700, a2)
            set y = PolarY(GetUnitY(t), 700, a2)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.95)
            call SaveReal(ht, zid, 0, dist)
        endif
        if count == 320 then
            call SoundStart("war3mapImported\\Guts_4-5.mp3") 
        endif
        if count >= 310 and count <= 350 then
            set dist = LoadReal(ht, zid, 0)
            set x = PolarX(GetUnitX(u), dist / 40, a)
            set y = PolarY(GetUnitY(u), dist / 40, a)
            call SetUnitXY(u, x, y, 0)
            if count > 335 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 12, 0)
            endif
        endif
        if count == 350 then
            set a = GetUnitFacing(u)
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a) 
            call Effect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl", x, y, 50, a, 0, 0, 1, 1.5, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.2, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))  
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.55, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1.5, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.25, 1.5, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
            call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.75, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 370 then
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)  
        endif
        if count == 380 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (7 + 2 * GetUnitAbilityLevel(u, 'A0B5')) * GetHeroStr(u, true))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_5.mp3")
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Guts_5-1.mp3")
        endif
        if count == 1 or count == 30 or count == 60 or count == 90 then
            call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(u), GetUnitY(u), 9, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\red-yumao-zhendiLord.mdl", GetUnitX(u), GetUnitY(u), 9, randomAngle(), 0, 0, GetRandomReal(0.8, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 9, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 1 or count == 100 then
            call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\red-lizi-zhendi-fast.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 11) 
        endif
        if count == 120 or count == 140 or count == 160 or count == 180 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count >= 120 and count <= 185 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
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
        if count == 130 or count == 150 or count == 170 then
            call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 175 then
            call SetUnitAnimationByIndex(u, 8) 
            call SetUnitTimeScale(u, 0.6)
            set x = PolarX(GetUnitX(t), - 250, a)
            set y = PolarY(GetUnitY(t), - 250, a)
            call Effect("war3mapImported\\AZ_PA_C.mdl", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
        endif
        if count == 180 then
            call SoundStart("war3mapImported\\Guts_5-2.mp3") 
            call Effect("war3mapImported\\AZ_jingzi_jiansheng01_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 40, 0, 0, 1.5, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))  
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 1.55, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)  
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
            call Effect("war3mapImported\\UltiZoro.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        endif
        if count == 190 then 
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_5-3.mp3")
            call SoundStart("war3mapImported\\Guts_5-4.mp3")
            call SoundStart("war3mapImported\\Guts_5-5.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 1.5)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 10 then
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 20 or count == 40 or count == 60 or count == 80 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            set x = PolarX(GetUnitX(t), - 50, a)
            set y = PolarY(GetUnitY(t), - 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count == 30 or count == 50 or count == 70 or count == 90 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.35))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(0.3, 0.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1), 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7)) 
        endif
        if count >= 20 and count <= 100 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 40 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.7)
        endif
        if count >= 40 and count <= 110 then 
            if dist > 140 then
                set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 90 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 22, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 10, 0)
            endif
        endif
        if count == 50 or count == 70 or count == 90 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count == 60 or count == 80 or count == 100 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
        if count == 110 then
            set x = PolarX(GetUnitX(t), - 150, a)
            set y = PolarY(GetUnitY(t), - 150, a)
            call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 150, a, 0, - 270, 2.5, 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Guts_5-6.mp3")
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\Guts_5-7.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\File00003933.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\red-blood-ball.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blood-rou.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.7, 1, PercentTo255(40), PercentTo255(40), PercentTo255(40), PercentTo255(40)) 
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)    
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count == 200 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 16 * GetHeroStr(u, true))
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

    private function period9 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        if count <= 115 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_6.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 1 or count == 30 then
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        endif
        if count == 40 or count == 50 or count == 60 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
        endif
        if count >= 40 and count <= 70 then
            set x = PolarX(GetUnitX(u), - 15, a)
            set y = PolarY(GetUnitY(u), - 15, a) 
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Guts_6-1.mp3") 
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\ArrowSqwirl.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 70 or count == 90 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.55, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.35, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, a, 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 70 and count <= 110 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif 
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectX(e, GetUnitX(u))
            call SetEffectY(e, GetUnitY(u))
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        endif
        if count == 110 then
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\ChuShou_Effect_Earth1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count == 115 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 9 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call StartAbilityCooldown(GetUnitAbility(u, 'A0B7'), 0)
        endif
        if count == 265 or (count > 115 and not LoadBoolean(ht, StringHash("GutsF"), GetHandleId(u))) then
            if LoadBoolean(ht, StringHash("GutsF"), GetHandleId(u)) then
                call SaveBoolean(ht, StringHash("GutsF"), GetHandleId(u), false)
                call StartAbilityCooldown(GetUnitAbility(u, 'A0B7'), 80)
            endif
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period10 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_6-2.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.75)
        endif
        if count == 10 or count == 30 or count == 50 or count == 70 or count == 90 or count == 110 or count == 130 then
            set x = PolarX(GetUnitX(t), 120, randomAngle())
            set y = PolarY(GetUnitY(t), 120, randomAngle())
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            if GetRandomInt(1, 2) == 1 then
                call SetUnitAnimationByIndex(u, 1)
            else
                call SetUnitAnimationByIndex(u, 2) 
            endif
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
        endif
        if count >= 10 and count <= 130 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Guts_6-3.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 130 or count == 145 or count == 160 or count == 175 or count == 190 or count == 205 or count == 220 or count == 235 or count == 250 or count == 270 then
            set x = PolarX(GetUnitX(t), 120, randomAngle())
            set y = PolarY(GetUnitY(t), 120, randomAngle())
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            if GetRandomInt(1, 2) == 1 then
                call SetUnitAnimationByIndex(u, 1)
            else
                call SetUnitAnimationByIndex(u, 2) 
            endif
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 130 and count <= 270 then 
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 270 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 4 * GetHeroStr(u, true))
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

    private function period11 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_6-4.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call Effect("war3mapImported\\bymutou-hongse3.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 1 or count == 50 then
            call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            call Effect("war3mapImported\\red-zhendi-shanguang.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.7, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 5) 
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 50 and count == 70 or count == 90 or count == 110 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, GetRandomReal(0.5, 0.8), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
        endif
        if count >= 50 and count <= 130 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 50, a)
                set y = PolarY(GetUnitY(u), dist / 50, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 100 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 12, 0)
            endif
        endif
        if count == 120 then
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a) 
            call Effect("war3mapImported\\[A]SlashCirlce.mdl", x, y, 50, randomAngle(), - 90, 0, 0.65, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 130 then
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, PercentTo255(10), 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
            call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 130 or count == 150 or count == 170 or count == 190 then
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
            call Effect("war3mapImported\\red-qiquan.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.8), 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.8))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.4, 0.6), 1, 255, PercentTo255(60), PercentTo255(60), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.7))
        endif
        if count >= 130 and count <= 200 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 5 or iterator == 10 then 
                if iterator == 10 then 
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\BY_Wood_GongChengSiPai_6.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                    set x = PolarX(GetUnitX(t), 30, a)
                    set y = PolarY(GetUnitY(t), 30, a)
                    call Effect("war3mapImported\\qqqqqr.mdl", x, y, 50, randomAngle(), 0, 0, GetRandomReal(1.25, 1.5), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                endif
                set x = PolarX(GetUnitX(t), 30, a)
                set y = PolarY(GetUnitY(t), 30, a)
                call Effect("war3mapImported\\red-zhendi-shanguang.mdl", x, y, 50, randomAngle(), 0, 0, GetRandomReal(0.7, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(50, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
                call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, GetRandomReal(1.25, 1.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
            endif
        endif
        if count == 200 then
            call Effect("war3mapImported\\red-lizi-shunjian.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, PercentTo255(10), 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3) 
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]Sand3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(40))
        endif
        if count == 210 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 12 * GetHeroStr(u, true))
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

    private function period12 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count) 
        if count <= 10 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart( "war3mapImported\\Guts_7.mp3" )
            if GetUnitTypeId(u) != 'H0FT' then
                call MorphUnit(u, 'H0FT')
            endif
            call DisableAbilityEx(u, 'A0B8', true)
            call UnitAddAbility(u, 'A0B9')
            call UnitMakeAbilityPermanent(u, true, 'A0B9')
            call Effect("war3mapimported\\bymutou-hongse3.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\File00003933.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\[A]Guts_wolf.mdx", u, "head"))
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", u, "right hand"))
            call SaveEffectHandle(ht, zid, 102, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", u, "left hand"))
            call SaveEffectHandle(ht, zid, 103, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", u, "right foot"))
            call SaveEffectHandle(ht, zid, 104, AddSpecialEffectTarget("war3mapImported\\AZ_LCDark_T2_Buff.mdx", u, "left foot"))
        endif
        if count == 10 then
            call PauseUnit(u, false)
        endif
        if count == 75 then
            call SoundStart("war3mapImported\\Guts_7-1.mp3")
        endif
        if count >= 75 and GetUnitAbilityLevel(u, 'B009') == 0 and IsUnitAlive(u) then 
            call MorphUnit(u, 'H0EF')
            call EnableAbilityEx(u, 'A0B8', true)
            call UnitRemoveAbility(u, 'A0B9')
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
            call DestroyEffect(LoadEffectHandle(ht, zid, 104))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period13 takes nothing returns nothing
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

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Guts_7-2.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 1 or count == 30 then
            call Effect("war3mapImported\\WindNewFaw4.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 50 or count == 70 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5) 
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count >= 50 and count <= 100 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 80 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 15, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 10, 0)
            endif
        endif
        if count == 100 then
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(80))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 0.9, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\az_slb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 105 then 
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
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A02W' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0B3' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FT' then
                call TimerStart(z, 0.02, true, function period3)
            else
                call TimerStart(z, 0.02, true, function period2)
            endif
        endif

        if abilId == 'A0B4' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0B5' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FT' then
                call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period6)
            else
                call TimerStart(z, 0.02, true, function period5)
            endif
        endif

        if abilId == 'A0B6' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FT' then
                call TimerStart(z, 0.02, true, function period8)
            else
                call TimerStart(z, 0.02, true, function period7)
            endif
        endif

        if abilId == 'A0B7' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FT' then
                call TimerStart(z, 0.02, true, function period11)
            else
                if not LoadBoolean(ht, StringHash("GutsF"), GetHandleId(u)) then
                    call SaveBoolean(ht, StringHash("GutsF"), GetHandleId(u), true)
                    call TimerStart(z, 0.02, true, function period9)
                else
                    call SaveBoolean(ht, StringHash("GutsF"), GetHandleId(u), false)
                    call TimerStart(z, 0.02, true, function period10)
                endif
            endif
        endif

        if abilId == 'A0B8' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period12)
        endif

        if abilId == 'A0B9' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period13)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope