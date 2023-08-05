scope byakuranspell initializer init

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
        local boolean b = LoadBoolean(ht, GetHandleId(z), 0)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            if b then
                call SetUnitAnimationByIndex(u, 11)
                call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\chinesedragon.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 0, 0, 0, 0, 255)
                call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            else
                call SetUnitAnimationByIndex(u, 1)
                call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\chinesedragon.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 0, 255, 255, 255, 255)
                call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
            endif
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    if b then 
                        call DamageUnit(u, gUnit, 120 * GetUnitAbilityLevel(u, 'A0AH'))
                    else
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0AH'))
                    endif
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                if b then
                    call Effect("war3mapImported\\byakuran ball.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                else
                    call Effect("war3mapImported\\WhiteXMissile.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                endif
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            if b then
                call Effect("war3mapImported\\Firaga5.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\fireworksblack.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            else
                call Effect("war3mapImported\\FiragaWhite.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\SuperShinyThingy.mdl", GetEffectX(e), GetEffectY(e), 50, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\fireworkswhite.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            endif
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_2.mp3")
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\SuperShinyThingy.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Shockwave White.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteDrive.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\WhiteXMissile.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count <= 30 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            if dist > 400 then
                set x = PolarX(GetEffectX(e), dist / 30, a)
                set y = PolarY(GetEffectY(e), dist / 30, a)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            else
                set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
                if dist > 140 then
                    set x = PolarX(GetEffectX(e), dist / 15, a)
                    set y = PolarY(GetEffectY(e), dist / 15, a)
                    call SetEffectXY(e, x, y, 0)
                    call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
                else
                    set x = PolarX(GetUnitX(t), 10, a)
                    set y = PolarY(GetUnitY(t), 10, a)
                    call SetUnitXY(t, x, y, 2)
                    call SetEffectXY(e, x, y, 0)
                    call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
                endif
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", x, y, 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
            endif
        endif
        if count == 30 then
            call Effect("war3mapImported\\FiragaWhite.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperShinyThingy.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
        endif
        if count == 35 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0AI')) * GetHeroStr(u, true))
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
        set e = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_2-1.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 20 then
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 600, a)
            set y = PolarY(GetUnitY(t), 600, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count == 35 then
            call SetUnitAnimationByIndex(u, 11)
        endif
        if count == 25 or count == 35 then
            call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.85, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 20 and count <= 45 then
            set dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 45 then
            call SoundStart("war3mapImported\\Byakuran_2-2.mp3")
            call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 50 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2 + GetUnitAbilityLevel(u, 'A0AI')) * GetHeroStr(u, true))
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

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count <= 30 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_3.mp3")
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 30 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call AddUnitAnimationProperties(u, "alternate", true)
            call Effect("war3mapImported\\bymutou_huozhu_siwang.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkNova.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\shadowdrive2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 30 and (GetUnitAbilityLevel(u, 'B00Y') == 0 or not IsUnitAlive(u)) then
            call AddUnitAnimationProperties(u, "alternate", false)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_4.mp3")
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\harmonizeeffect.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\shinratensei.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
        endif
        if count == 55 then
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count >= 40 and count <= 70 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 20, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 70 then
            call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\SuperBigExplosion4.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 80 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0AK')) * GetHeroStr(u, true))
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

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_4-1.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\DarkBreathDamage.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            set i = 0
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(u), 250, i * 40)
                set y = PolarY(GetUnitY(u), 250, i * 40)
                call Effect("war3mapImported\\DarkBreathDamage.mdl", x, y, 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 25 then
            call SetUnitTimeScale(u, 2)
        endif
        if count >= 25 and count <= 105 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = PolarX(GetUnitX(t), 140, randomAngle())
                set y = PolarY(GetUnitY(t), 140, randomAngle())
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimationByIndex(u, 11)
                call Effect("war3mapImported\\DarkBlast.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\ShadowSlash.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            endif
        endif
        if count == 105 then
            call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 11)
            call Effect("war3mapImported\\fireworksblack.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 130 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0AK')) * GetHeroStr(u, true))
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

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        
        if not IsUnitInvulnerable(u) then
            set count = count + 1
            call SaveInteger(ht, GetHandleId(z), 0, count)
        endif
        if count >= 50 or not IsUnitAlive(u) or GetUnitAbilityLevel(u, 'B00Q') == 0 then
            call UnitRemoveAbility(u, 'A0I1')
            call UnitRemoveAbility(u, 'B00Q')
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period8 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local integer iterator2 = LoadInteger(ht, GetHandleId(z), 2)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer i
        local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
        local group g1 = LoadGroupHandle(ht, GetHandleId(z), 10)
        local group g2
        local unit v

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_5.mp3")
            call VisionArea(GetOwningPlayer(u), 1500, 8, GetUnitX(u), GetUnitY(u))
            if b then
                call SetUnitAnimationByIndex(u, 10)
            else
                call SetUnitAnimationByIndex(u, 4)
            endif
        endif
        if count <= 50 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\dustwaveanimate2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.85, 1.55), 1.5, 255, 255, 255, PercentTo255(50))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1.35, 1.75), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Byakuran_5-1.mp3")
            if b then
                call SetUnitAnimationByIndex(u, 17)
            else
                call SetUnitAnimationByIndex(u, 16)
            endif
            call Effect("war3mapImported\\hellbond.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 7.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_doomdragon_d2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 7.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 7.5, 255, 255, 255, PercentTo255(30))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\dzxb1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.8, 9, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call AnimEffectEx(bj_lastCreatedEffect, "death", 7.5)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 7.5)
        endif
        if count >= 60 and count <= 420 then
            set g2 = CreateGroup()
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            set iterator2 = iterator2 + 1
            call SaveInteger(ht, GetHandleId(z), 2, iterator2)
            set i = 1
            loop
                exitwhen i > 10
                set x = PolarX(GetUnitX(u), 120 * i, a)
                set y = PolarY(GetUnitY(u), 120 * i, a)
                call GroupEnumUnitsInRange(g2, x, y, 250, null)
                loop
                    set v = GroupForEachUnit(g2)
                    exitwhen v == null
                    if FilterGeneral(u, v) then
                        if not IsUnitInGroup(v, g1) and iterator2 == 5 then
                            call DamageUnit(u, v, 2 * GetHeroStr(u, true) / 10)
                            call GroupAddUnit(g1, v)
                        endif
                        call IssueImmediateOrderById(v, 851972)
                    endif
                endloop
                if iterator == 20 then
                    set x = PolarX(x, 100 * i, a)
                    set y = PolarY(y, 100 * i, a)
                    if i == 1 or i == 2 or i == 3 or i == 4 or i == 5 then
                        call Effect("war3mapImported\\WindCirclefaster.mdl", x, y, 100, a, - 90, 0, GetRandomReal(1, 1.35), 1.5, PercentTo255(10), PercentTo255(10), PercentTo255(10), PercentTo255(60))
                        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.55, 0.8))
                    endif
                endif
                set i = i + 1
            endloop
            if iterator >= 20 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
            endif
            if iterator2 >= 5 then
                call SaveInteger(ht, GetHandleId(z), 2, 0)
                call GroupClear(g1)
            endif
            call DestroyGroup(g2)
        endif
        if count == 420 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g1)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g1 = null
        set g2 = null
        set v = null
    endfunction

    private function period9 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i
        local boolean b = LoadBoolean(ht, GetHandleId(z), 0)
        
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Byakuran_6.mp3")
            if b then
                call SetUnitAnimationByIndex(u, 15)
            else
                call SetUnitAnimationByIndex(u, 14)
            endif
            call Effect("war3mapImported\\Hell_Roots_Buff.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1, 2, 255, 255, 255, 255)
        endif
        if count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\dustwaveanimate2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 1.3), 1.5, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\dustwaveanimate2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.85, 1.55), 2, 255, 255, 255, PercentTo255(30))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\SuperShinyThingy2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 1.15), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.55, 0.95))
            endif
        endif
        if count == 100 then
            call Effect("war3mapImported\\SuperBigExplosionBlack.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 110 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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

    private function period10 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a
        local real x
        local real y
        local boolean b = LoadBoolean(ht, GetHandleId(z), 0)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            if b then
                call SoundStart("war3mapImported\\Byakuran_7-1.mp3")
                call SetUnitAnimationByIndex(u, 10)
                call Effect("war3mapImported\\fireworksblack.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 180, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 270, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 360, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 90, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 180, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 270, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingBlend.mdl", GetUnitX(u), GetUnitY(u), 150, 360, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
            else
                call SoundStart("war3mapImported\\Byakuran_7.mp3")
                call SetUnitAnimationByIndex(u, 4)
                call Effect("war3mapImported\\fireworkswhite.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 180, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 270, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 360, - 90, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 90, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 180, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 270, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
                call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", GetUnitX(u), GetUnitY(u), 150, 360, - 45, 0, 2.5, 2, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
            endif
        endif
        if count == 20 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 8 * GetHeroStr(u, true))
                    set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(gUnit), GetUnitY(gUnit))
                    call knockbackUnit(gUnit, 400, a, 0.6)
                endif
            endloop
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, GetHandleId(z))
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

        if abilId == 'A0AH' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(u, 'B00Y') > 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0AI' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitAbilityLevel(u, 'B00Y') > 0 then
                call TimerStart(z, 0.02, true, function period3)
            else
                call TimerStart(z, 0.02, true, function period2)
            endif
        endif

        if abilId == 'A0AJ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0AK' then
            set z = CreateTimer()
            if t != u then
                call PauseUnit(u, true)
                call SetUnitInvulnerable(u, true)
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                call SaveInteger(ht, GetHandleId(z), 0, 0)
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if GetUnitAbilityLevel(u, 'B00Y') > 0 then
                    call TimerStart(z, 0.02, true, function period6)
                else
                    call TimerStart(z, 0.02, true, function period5)
                endif
            else
                call SoundStart("war3mapImported\\Byakuran_4-2.mp3")
                call UnitAddAbility(u, 'A0I1')
                call UnitMakeAbilityPermanent(u, true, 'A0I1')
                call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                call SaveInteger(ht, GetHandleId(z), 0, 0)
                call TimerStart(z, 0.1, true, function period7)
            endif
        endif

        if abilId == 'A0AL' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveInteger(ht, GetHandleId(z), 2, 0)
            call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(u, 'B00Y') > 0)
            call SaveGroupHandle(ht, GetHandleId(z), 10, CreateGroup())
            call TimerStart(z, 0.02, true, function period8)
        endif

        if abilId == 'A0AM' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(u, 'B00Y') > 0)
            call TimerStart(z, 0.02, true, function period9)
        endif

        if abilId == 'A0AN' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveBoolean(ht, GetHandleId(z), 0, GetUnitAbilityLevel(u, 'B00Y') > 0)
            call TimerStart(z, 0.02, true, function period10) 
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope