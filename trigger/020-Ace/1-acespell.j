scope acespell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Ace_1.mp3")
            else
                call SoundStart("war3mapImported\\Ace_1-1.mp3")
            endif
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 15)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.6, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0AA'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            call Effect("war3mapImported\\[A]FireShockRun(fire2).mdl", GetEffectX(e), GetEffectY(e), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call Effect("war3mapImported\\[A]BY_Wood_Kong.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
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

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ace_2.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.25)
            call SaveEffectHandle(ht, GetHandleId(z), 10, AddSpecialEffectTarget("war3mapImported\\[A]AceFireShockRun.mdx", u, "left hand"))
            call SaveEffectHandle(ht, GetHandleId(z), 11, AddSpecialEffectTarget("war3mapImported\\[A]AceFireShockRun.mdx", u, "right hand"))
            call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 30 then
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
        if count == 30 then
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\Ethereal Lightning.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.4)
        endif
        if count == 40 then
            call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(t), GetUnitY(t), 200, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]File00002800.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 50 then
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0AB')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 10))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 11))
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x
        local real y
        local effect e 
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count <= 40 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Ace_3.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.9)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set i = 0
            loop
                exitwhen i > 17
                call Effect("war3mapImported\\fire1.mdl", GetUnitX(u), GetUnitY(u), 50, i * 20, 0, 0, 2.5, 3, 255, 255, 255, PercentTo255(60))
                call SaveEffectHandle(ht, GetHandleId(z), 100 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count <= 30 then
            set i = 0
            loop
                exitwhen i > 17
                set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                set x = PolarX(GetEffectX(e), 20, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 20, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 1)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x, y))
                set i = i + 1
            endloop
        endif
        if count == 40 then
            call SaveReal(ht, GetHandleId(z), 10, GetUnitX(u))
            call SaveReal(ht, GetHandleId(z), 20, GetUnitY(u))
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call lockUnit(gUnit, 1, false)
                endif 
            endloop
            call GroupClear(gGroup)
            set i = 0
            loop
                exitwhen i > 8
                set x = PolarX(GetUnitX(u), 150, i * 40)
                set y = PolarY(GetUnitY(u), 150, i * 40)
                call Effect("war3mapImported\\[A]acefireshockrun.mdl", x, y, 50, i * 40, 0, 0, 1.25, 2.2, 255, 255, 255, PercentTo255(80))
                set x = PolarX(GetUnitX(u), 300, i * 40)
                set y = PolarY(GetUnitY(u), 300, i * 40)
                call Effect("war3mapImported\\[A]acefireshockrun.mdl", x, y, 50, i * 40, 0, 0, 1.25, 2.2, 255, 255, 255, PercentTo255(80))
                set x = PolarX(GetUnitX(u), 450, i * 40)
                set y = PolarY(GetUnitY(u), 450, i * 40)
                call Effect("war3mapImported\\[A]acefireshockrun.mdl", x, y, 50, i * 40, 0, 0, 1.25, 2.2, 255, 255, 255, PercentTo255(80))
                set i = i + 1
            endloop
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count >= 40 and count <= 140 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set x = LoadReal(ht, GetHandleId(z), 10)
                set y = LoadReal(ht, GetHandleId(z), 20)
                call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) then
                        call DamageUnit(u, gUnit, ((2 + GetUnitAbilityLevel(u, 'A0AC')) * GetHeroStr(u, true)) / 20)
                    endif
                endloop
                call GroupClear(gGroup)
            endif
        endif
        if count == 140 then
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period4 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Ace_4.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 0.1)
            call Effect("war3mapImported\\[A]Natsu roar 3.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.8, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 30 then
            call Effect("war3mapImported\\qj3.mdl", GetUnitX(u), GetUnitY(u), 250, a, 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
        endif
        if count >= 30 and count <= 70 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = PolarX(GetEffectX(e), dist / 40, a)
            set y = PolarY(GetEffectY(e), dist / 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 250 + GetAxisZ(x, y))
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Ace_4-1.mp3")
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.75) 
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]Nuke2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_FenShenDaBaoPo_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 75 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0AF')) * GetHeroStr(u, true))
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

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x
        local real y
        local real h
        local group g1 = LoadGroupHandle(ht, GetHandleId(z), 10)
        local group g2 = LoadGroupHandle(ht, GetHandleId(z), 11)
        local effect e
        local unit d

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ace_5.mp3")
            call VisionArea(GetOwningPlayer(u), 1500, 5, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]AceBall.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 0.1, 7, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
        endif
        if count == 50 or count == 100 or count == 150 then
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 3, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 0.1)
        endif
        if count == 80 then
            call SetUnitAnimationByIndex(u, 11)
            call SetUnitTimeScale(u, 1)
            set d = CreateUnit(GetOwningPlayer(u), 'h0CO', GetUnitX(u), GetUnitY(u), a)
            call UnitEnableMovement(d, false, false)
            call SaveUnitHandle(ht, GetHandleId(z), 1000, d)
            if GetLocalPlayer() == GetOwningPlayer(u) then
                call SelectUnit(d, true)
            endif
        endif
        if count >= 80 and count <= 200 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            set d = LoadUnitHandle(ht, GetHandleId(z), 1000)
            if iterator >= 25 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                if GetLocalPlayer() == GetOwningPlayer(u) then
                    call SelectUnit(d, true)
                endif
            endif
            call SaveReal(ht, GetHandleId(z), 0, GetUnitFacing(d))
            call SetUnitFacing(u, GetUnitFacing(d))
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectYaw(e, GetUnitFacing(d))
            call SetSpecialEffectZ(e, GetEffectZ(e) + 3)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.02)
        endif
        if count == 200 then
            if GetLocalPlayer() == GetOwningPlayer(u) then
                call SelectUnit(u, true)
            endif
            set d = LoadUnitHandle(ht, GetHandleId(z), 1000)
            call RemoveUnit(d)
            call SoundStart("war3mapImported\\Ace_5-1.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
        endif
        if count >= 200 and count <= 240 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            set x = PolarX(GetEffectX(e), 50, a)
            set y = PolarY(GetEffectY(e), 50, a)
            call SetEffectXY(e, x, y, 1)
            set h = GetEffectZ(e) + GetAxisZ(x + 0.01, y) - GetAxisZ(x, y)
            call SetSpecialEffectZ(e, h)
            call GroupEnumUnitsInRange(gGroup, x, y, 450, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g2) then
                    call DamageUnit(u, gUnit, 15 * GetHeroStr(u, true))
                    call GroupAddUnit(g2, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\KatonGoukaMekkyaku.mdl", x, y, 100, a, 0, 0, 1.2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            endif
        endif
        if count <= 220 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 2500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g1) then 
                    call GroupAddUnit(g1, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 220 then
            call ForGroup(g1, function ResetMoveSpeed)
            call DestroyGroup(g1)
        endif
        if count == 240 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.6)
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 245 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g2)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g1 = null
        set g2 = null
        set e = null
        set d = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, GetHandleId(z), 10)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ace_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Ace_6-1.mp3")
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 5, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\AceRef.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\[A]zhendi-fire-dici.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]zhendi-fire-dici.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 650, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 11 * GetHeroStr(u, true))
                    call knockupUnit(gUnit, 1.6, 600)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count <= 100 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.01)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 1)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set g = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x 
        local real y
        local real h
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Ace_7.mp3")
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\[a]explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set i = 0
            loop
                exitwhen i > 16
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
                set a = Angle(GetUnitX(u), GetUnitY(u), x, y)
                call SaveReal(ht, GetHandleId(z), 100 + i, x)
                call SaveReal(ht, GetHandleId(z), 200 + i, y)
                call Effect("war3mapImported\\ZeroPinkGreen.mdl", GetUnitX(u), GetUnitY(u), GetRandomReal(50, 100), a, 0, 0, 1, 0, 255, 255, 255, 255)
                call SaveEffectHandle(ht, GetHandleId(z), 100 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count <= 100 then
            set i = 0
            loop
                exitwhen i > 16
                set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                set x = LoadReal(ht, GetHandleId(z), 100 + i)
                set y = LoadReal(ht, GetHandleId(z), 200 + i)
                set dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
                set x = PolarX(GetEffectX(e), dist / 100, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), dist / 100, GetSpecialEffectYaw(e))
                set h = GetEffectZ(e) + GetAxisZ(x + 0.01, y) - GetAxisZ(x, y)
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectZ(e, h)
                set i = i + 1
            endloop
        endif
        if count == 110 then
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 140 then
            set i = 0
            loop
                exitwhen i > 16
                set e = LoadEffectHandle(ht, GetHandleId(z), 100 + i)
                set x = GetEffectX(e)
                set y = GetEffectY(e)
                call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", x, y, GetEffectZ(e) - GetAxisZ(x, y), randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
                set i = i + 1
            endloop
        endif
        if count == 160 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0AA' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0AB' then
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

        if abilId == 'A0AC' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0AF' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0AE' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 10, CreateGroup())
            call SaveGroupHandle(ht, GetHandleId(z), 11, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0AD' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 10, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0AG' then
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