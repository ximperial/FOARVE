scope tanjirospell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local effect e

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tanjiro_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 3)
            call Effect("war3mapImported\\xzcl.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.75)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u), 80, a)
            set y = PolarY(GetUnitY(u), 80, a)
            call SetUnitXY(u, x, y, 1)
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            call SetEffectXY(e, GetUnitX(u), GetUnitY(u), 0)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A04Y'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\mwjl.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 0)
            endif
        endif
        if count == 15 then
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local effect e

        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count <= 25 then
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Tanjiro_2.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count <= 25 then
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
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\mwjl.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 0)
            endif
        endif
        if count == 25 then
            call Effect("war3mapImported\\[DZ.Spell]0062.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A04Z')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call Effect("war3mapImported\\mwjl.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count >= 25 and count <= 55 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
            call SetSpecialEffectZ(e, 200 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
        endif
        if count == 55 then
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real randomA
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tanjiro_3.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count <= 20 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\mwjl.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 0)
            endif
        endif
        if count == 20 then 
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count == 30 then
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            set x = PolarX(GetUnitX(t), 300, a + 72)
            set y = PolarY(GetUnitY(t), 300, a + 72)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\tzl.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster2.mdl", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
        endif
        if count == 40 then 
            set x = PolarX(GetUnitX(t), 300, a + 144)
            set y = PolarY(GetUnitY(t), 300, a + 144)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\tzl.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster2.mdl", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
        endif
        if count == 50 then 
            set x = PolarX(GetUnitX(t), 300, a + 216)
            set y = PolarY(GetUnitY(t), 300, a + 216)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\tzl.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster2.mdl", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
        endif
        if count == 60 then 
            set x = PolarX(GetUnitX(t), 300, a + 288)
            set y = PolarY(GetUnitY(t), 300, a + 288)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\tzl.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster2.mdl", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
        endif
        if count == 70 then
            set x = PolarX(GetUnitX(t), 300, a)
            set y = PolarY(GetUnitY(t), 300, a)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\tzl.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\gikura_a.mdl", x, y, 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\windcirclefaster2.mdl", x, y, 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\crescentslashblue.mdl", x, y, 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\shuizhuByyaycutsom.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 2, 255, 255, 255, 255)
        endif
        if count == 80 then
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A074')) * GetHeroStr(u, true))
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
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real randomA
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Tanjiro_4.mp3")
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count <= 200 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                if iterator == 5 or iterator == 10 then
                    set randomA = GetRandomReal(- 30, 30)
                    set x = PolarX(GetUnitX(t), - 120, a + randomA)
                    set y = PolarY(GetUnitY(t), - 120, a + randomA)
                    call SetUnitXY(u, x, y, 0)
                    set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                    call SetUnitFacingEx(u, a, true)
                    call Effect("war3mapImported\\SenjiSwordEffect.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 2, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                    call Effect("war3mapImported\\SenjiSwordEffect.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 90, 90), 0, 2.5, 2, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
                    call Effect("war3mapImported\\SenjiSwordEffect.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 90, 90), 0, 2, 2, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.55)
                    set x = PolarX(GetUnitX(u), 50, a)
                    set y = PolarY(GetUnitY(u), 50, a)
                    call Effect("war3mapImported\\SenjiSwordEffect.mdl", x, y, 100, randomAngle(), 0, 0, 2.25, 2, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                    call Effect("war3mapImported\\SenjiSwordEffect.mdl", x, y, 100, randomAngle(), 0, 0, 1.75, 2, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
                    call Effect("war3mapImported\\sjthy.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                endif
            endif
            if iterator >= 10 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\fire-boom-new.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 0.9)
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count >= 200 and count <= 220 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(u), 20, a)
            set y = PolarY(GetUnitY(u), 20, a)
            call SetUnitXY(u, x, y, 1)
        endif
        if count == 210 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\slash_flareadditive195_2.mdl", GetUnitX(t), GetUnitY(t), 50, a + 40, 0, 0, 6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\slash_flareadditive195_2.mdl", GetUnitX(t), GetUnitY(t), 50, a - 40, 0, 0, 6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_2_di_.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 220 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A06S')) * GetHeroStr(u, true))
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

    private struct TanjiroT extends Missiles

    effect e
    integer i
    integer i2
                    
    method onPeriod takes nothing returns boolean
        call SetSpecialEffectPositionEx(e, .x, .y, .z)
        call SetSpecialEffectYaw(e, .effect.yaw * bj_RADTODEG)
        set i = i + 1
        set i2 = i2 + 1
        if i >= 10 or i2 == 1 then
            set i = 0
            call Effect("war3mapimported\\SenjiSwordEffect.mdx", .x, .y, 100, randomAngle(), 0, 0, 1.55, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\SenjiSwordEffect.mdx", .x, .y, 100, randomAngle(), 0, 0, 1.55, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\SenjiSwordEffect.mdx", .x, .y, 100, .effect.yaw * bj_RADTODEG, 0, 0, 2.25, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapimported\\SenjiSwordEffect.mdx", .x, .y, 100, .effect.yaw * bj_RADTODEG, 0, 0, 1.75, 3, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\HakenSaber2.mdx", .x, .y, 50, randomAngle(), 0, 0, 0.75, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", .x, .y, 50, randomAngle(), 0, 0, 0.45, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\WindCirclefaster.mdx", .x, .y, 100, randomAngle(), 0, 0, 1.15, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        return false
    endmethod
                        
    method onRemove takes nothing returns nothing
        set e = null
    endmethod
        
endstruct

private function period5 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local real x2
    local real y2
    local real randomA
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local TanjiroT move
    local effect e

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, GetHandleId(z), - 1) + 1000 then 
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, GetHandleId(z), - 1) then
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
    endif
    call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, GetHandleId(z), - 1))
    if count == 1 then
        call SoundStart("war3mapImported\\Tanjiro_5.mp3")
        call SetUnitVertexColor(u, 255, 255, 255, 0)
        call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 19, 255, 255, 255, PercentTo255(60))
        call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        call Effect("war3mapImported\\tzl.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 14.2, 255, 255, 255, 255)
        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
        call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        set x = PolarX(GetUnitX(t), 700, a)
        set y = PolarY(GetUnitY(t), 700, a)
        set move = TanjiroT.create(GetUnitX(u), GetUnitY(u), 0, x, y, 0)
        set move.duration = 0.6
        set move.e = LoadEffectHandle(ht, GetHandleId(z), 10)
        set move.i = 0
        set move.i2 = 0
        call move.launch()
    endif
    if count >= 30 and count <= 680 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 30 then
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            set randomA = randomAngle()
            set x = PolarX(GetUnitX(t), 700, randomA)
            set y = PolarY(GetUnitY(t), 700, randomA)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set x2 = PolarX(GetUnitX(t), 700, a)
            set y2 = PolarY(GetUnitY(t), 700, a)
            set move = TanjiroT.create(x, y, 0, x2, y2, 0)
            set move.duration = 0.6
            set move.e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set move.i = 0
            set move.i2 = 0
            call move.launch()
        endif
    endif
    if count == 720 then
        call SoundStart("war3mapImported\\Tanjiro_5-1.mp3")
        call SetUnitVertexColor(u, 255, 255, 255, 255)
        call SetUnitX(u, PolarX(GetUnitX(t), - 200, a))
        call SetUnitY(u, PolarY(GetUnitY(t), - 200, a))
        call Effect("war3mapImported\\shanguangbiubiu.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, 0, 2, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
    endif
    if count >= 720 and count <= 920 then
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 10 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.5, 0.75), 1, 255, 255, 255, PercentTo255(GetRandomReal(60, 80)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.35, 0.5), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
            call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(0.75, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1.25))
        endif
    endif
    if count == 930 then 
        call SetUnitAnimationByIndex(u, 6)
    endif
    if count == 940 then 
        call SoundStart("war3mapImported\\Tanjiro_5-2.mp3") 
        call Effect("war3mapImported\\SenjiSwordEffect.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\FireSwordEffect.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 3, 1, 255, 255, 255, 255) 
    endif
    if count == 950 then
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.3, 2, 255, 120, 0, 255) 
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255) 
        call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255) 
        call Effect("war3mapImported\\QQQQQ.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\hit-juhuang-lizi.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        call Effect("war3mapImported\\Kira-zhendi-yellow-qiquan.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255) 
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 960 then
        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(u, false)
        call SetUnitInvulnerable(t, false)
        call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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

private function period6 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
    local integer i

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tanjiro_6.mp3")
        set x = PolarX(GetUnitX(t), - 200, a)
        set y = PolarY(GetUnitY(t), - 200, a)
        call SetUnitXY(u, x, y, 0)
        set i = 0
        loop
            exitwhen i > 3
            call Effect("war3mapImported\\qj3.mdl", GetUnitX(u), GetUnitY(u), 50, a + i * 90, 0, 0, 3, 3, 255, 255, 255, 255)
            call AnimEffect(bj_lastCreatedEffect, 1, 2)
            call SpinEffect(bj_lastCreatedEffect, 1, 3)
            set i = i + 1
        endloop
    endif
    if count == 140 then
        call SetUnitAnimationByIndex(u, 6)
        call Effect("war3mapImported\\FireSwordEffect.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
        call Effect("war3mapImported\\SenjiSwordEffect.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
    endif
    if count == 150 then
        call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\TanjirouEffectT.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 5, 3, 255, 255, 255, 255)
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 2, 255, 120, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 160 then
        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(u, false)
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

private function period7 takes nothing returns nothing
    local timer z = GetExpiredTimer()
    local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
    local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
    local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
    local real x
    local real y
    local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
    local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

    call SaveInteger(ht, GetHandleId(z), 0, count)
    call PauseUnit(t, true)
    call SetUnitInvulnerable(t, true)
    call PauseUnit(u, true)
    call SetUnitInvulnerable(u, true)
    if count == 1 then
        call SoundStart("war3mapImported\\Tanjiro_7.mp3")
        call UnitAddAbility(u, 'Amrf')
        call UnitRemoveAbility(u, 'Amrf')
        set x = PolarX(GetUnitX(t), - 1000, a)
        set y = PolarY(GetUnitY(t), - 1000, a)
        call SetUnitXY(u, x, y, 0)
        call SetUnitAnimationByIndex(u, 9)
    endif
    if count <= 40 then
        set x = PolarX(GetUnitX(u), 25, a)
        set y = PolarY(GetUnitY(u), 25, a)
        call SetUnitXY(u, x, y, 0)
        if count > 20 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
        else
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
        endif
        set iterator = iterator + 1
        call SaveInteger(ht, GetHandleId(z), 1, iterator)
        if iterator >= 5 then 
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.25, 1.5, 255, 255, 255, 255)
        endif
    endif
    if count == 40 then
        set x = PolarX(GetUnitX(u), - 50, GetUnitFacing(u))
        set y = PolarY(GetUnitY(u), - 50, GetUnitFacing(u))
        call Effect("war3mapImported\\FireSwordEffect.mdl", x, y, 350, a, - 90, - 270, 2, 1.5, 255, 255, 255, 255)
        call Effect("war3mapImported\\SenjiSwordEffect.mdl", x, y, 350, a, - 90, - 270, 2.5, 1.5, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
    endif
    if count == 50 then
        call SoundStart("war3mapImported\\Tanjiro_5-2.mp3") 
        call Effect("war3mapImported\\slash_flareadditive195_2.mdl", GetUnitX(t), GetUnitY(t), 50, a - 40, 0, 0, 7, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\slash_flareadditive195_2.mdl", GetUnitX(t), GetUnitY(t), 50, a + 40, 0, 0, 7, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\cyzdtred.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.3, 2, 255, 120, 0, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
    endif
    if count == 60 then
        call SetUnitFlyHeight(u, 0, 0)
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

    if abilId == 'A04Y' then
        set z = CreateTimer()
        call PauseUnit(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), 0, a)
        call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
        call TimerStart(z, 0.02, true, function period1)
    endif

    if abilId == 'A04Z' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period2)
    endif

    if abilId == 'A074' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period3)
    endif

    if abilId == 'A06S' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period4)
    endif

    if abilId == 'A06T' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
        call TimerStart(z, 0.02, true, function period5)
    endif

    if abilId == 'A084' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call SaveUnitHandle(ht, GetHandleId(z), 0, u)
        call SaveUnitHandle(ht, GetHandleId(z), 1, t)
        call SaveInteger(ht, GetHandleId(z), 0, 0)
        call SaveInteger(ht, GetHandleId(z), 1, 0)
        call TimerStart(z, 0.02, true, function period6)
    endif

    if abilId == 'A08B' then
        set z = CreateTimer()
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
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