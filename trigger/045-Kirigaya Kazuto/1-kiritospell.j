scope kiritospell initializer init
   
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
            call SoundStart("war3mapImported\\Kirito_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Shockwave(Blue).mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\LightningNova.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dead Spirit by Deckai2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Energy Release2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Kirito_1-1.mp3")
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u), 80, a)
            set y = PolarY(GetUnitY(u), 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A00K'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Shockwave(Blue).mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\LightningNova.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Dead Spirit by Deckai2.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Energy Release2.mdx", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
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
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Kirito_2.mp3")
            else
                call SoundStart("war3mapImported\\Kirito_2-4.mp3")
            endif
            call SoundStart("war3mapImported\\Kirito_2-1.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 5 then
            call SetUnitAnimationByIndex(u, 6)
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
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Kirito_2-2.mp3")
            call Effect("war3mapImported\\Dls2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\uissb.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wendyql.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call Effect("war3mapImported\\nitu.mdx", x, y, 0, a + 180, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\nitu.mdx", x, y, 0, a + 160, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\nitu.mdx", x, y, 0, a + 200, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DarkBlade.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
        endif
        if count == 30 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A00L')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Kirito_4.mp3")
            else
                if GetRandomInt(1, 2) == 1 then
                    call SoundStart("war3mapImported\\Kirito_4-1.mp3")
                else
                    call SoundStart("war3mapImported\\Kirito_4-2.mp3")
                endif
            endif
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2.6, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Kirito_4-3.mp3")
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), 50, a + 30, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, a + 30)
            set y = PolarY(GetUnitY(t), 120, a + 30)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\mkirito2.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Kirito_4-3.mp3")
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), 50, a + 120, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, a + 120)
            set y = PolarY(GetUnitY(t), 120, a + 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\mkirito2.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Kirito_4-3.mp3")
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), 50, a + 210, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, a + 210)
            set y = PolarY(GetUnitY(t), 120, a + 210)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\mkirito2.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Kirito_4-3.mp3")
            call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, .8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), 50, a + 300, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\xjbz.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, a + 300)
            set y = PolarY(GetUnitY(t), 120, a + 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\mkirito2.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
        endif
        if count == 80 then 
            if GetRandomInt(1, 2) == 1 then
                set x = PolarX(GetUnitX(t), 120, a + 30)
                set y = PolarY(GetUnitY(t), 120, a + 30)
            else
                if GetRandomInt(1, 2) == 1 then
                    set x = PolarX(GetUnitX(t), 120, a + 120)
                    set y = PolarY(GetUnitY(t), 120, a + 120)
                else
                    if GetRandomInt(1, 2) == 1 then
                        set x = PolarX(GetUnitX(t), 120, a + 210)
                        set y = PolarY(GetUnitY(t), 120, a + 210)
                    else
                        set x = PolarX(GetUnitX(t), 120, a + 300)
                        set y = PolarY(GetUnitY(t), 120, a + 300)
                    endif
                endif
            endif
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A00M')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Kirito_7-1.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 12)
            call SetUnitTimeScale(u, 0.75)
            call Effect("war3mapImported\\SuperShinyThingyBlack.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 30 or count == 70 then
            call Effect("war3mapImported\\SuperShinyThingyBlack.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 27)
            call SetUnitTimeScale(u, 1.75)
            call SetUnitFacingEx(u, a, true)
        endif
        if count >= 100 and count <= 120 then 
            set x = PolarX(GetUnitX(u), 40, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 40, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\Kirito_7-2.mp3")
            call SoundStart("war3mapImported\\Kirito_7-3.mp3")
        endif
        if count == 120 then
            set a = GetUnitFacing(u)
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\eros.mdx", x, y, 50, a, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\dash sfx.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\baojiang.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\ChuShou_Effect_Earth1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 130 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A00I')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Kirito_5-4.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 18)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 15, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            set i = 0
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(t), 450, i * 45)
                set y = PolarY(GetUnitY(t), 450, i * 45)
                call Effect("war3mapImported\\Effect_Fate_jiujian_galibang_dimianjianqi2.mdx", x, y, 50, randomAngle(), 0, 0, 3, 16, 255, 255, 255, 255)
                set i = i + 1
            endloop
            call SaveReal(ht, zid, 0, GetUnitX(t))
            call SaveReal(ht, zid, 1, GetUnitY(t))
        endif
        if count == 100 then
            call SetUnitTimeScale(u, 2)
        endif
        if count >= 120 and count <= 720 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 10 or iterator == 20 then
                if iterator == 20 then
                    call SaveInteger(ht, zid, 1, 0)
                    call SetUnitAnimationByIndex(u, 32)
                endif
                set x = LoadReal(ht, zid, 0)
                set y = LoadReal(ht, zid, 1)
                set a = randomAngle()
                call SetUnitX(t, PolarX(x, GetRandomReal(200, 400), a))
                call SetUnitY(t, PolarY(y, GetRandomReal(200, 400), a))
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 12, 0)
                set a = randomAngle()
                call SetUnitX(u, PolarX(GetUnitX(t), 140, a))
                call SetUnitY(u, PolarY(GetUnitY(t), 140, a))
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
                if GetRandomInt(1, 2) == 1 then
                    set a = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set a = GetRandomReal(- 40, - 20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                    set a = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                    set a = GetRandomReal(- 40, - 20)
                    call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                else
                    if GetRandomInt(1, 2) == 1 then
                        set a = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                        set a = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                        set a = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                        set a = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                    else
                        set a = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\bule-dark-salsh_21.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                        set a = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 102, 102, 255, 255)
                        set a = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\bule-dark-salsh_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(0.5, 0.6), 1, 255, 255, 255, 255)
                        set a = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\windslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), a, 0, GetRandomReal(2, 3.5), 1, 255, 255, 0, 255)
                    endif
                endif
            endif
        endif
        if count == 730 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(t, x, y, 0)
            set a = randomAngle()
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 20)
            call SetUnitTimeScale(u, 1)
        endif
        if count >= 740 and count <= 770 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 24, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
        endif
        if count == 750 or count == 755 or count == 760 or count == 765 then
            call Effect("war3mapImported\\wind2.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(80))
        endif
        if count == 770 then
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\blue-guagnzhu-special.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 780 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Kirito_5.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2.4, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\Effect_Fate_jiujian_galibang_dimianjianqi2.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 2.4, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 10 or iterator == 20 then
                if iterator == 20 then
                    call SaveInteger(ht, zid, 1, 0)
                    call SoundStart("war3mapImported\\Kirito_5-3.mp3")
                    call SetUnitAnimationByIndex(u, 32)
                else
                    call SoundStart("war3mapImported\\Kirito_5-2.mp3")
                endif
                call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(200, 400), randomAngle(), - 45, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\JeanlilyHXDG1.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(300, 400), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\JeanlilyHXDG2.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(300, 400), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(3, 4), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\uissb.mdx", GetUnitX(t), GetUnitY(t), 200, randomAngle(), - 45, 0, GetRandomReal(3, 5), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, GetRandomReal(7, 9), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\specialanimedustwave.mdx", GetUnitX(t), GetUnitY(t), 25, randomAngle(), 0, 0, GetRandomReal(3, 5), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Kirito_5-1.mp3")
        endif
        if count == 110 then 
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kirito_6.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 3, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count <= 100 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\XZBlue.mdx", GetUnitX(t), GetUnitY(t), 200, randomAngle(), - 45, 0, GetRandomReal(.6, 1), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\zhanji-blue-shu.mdx", GetUnitX(t), GetUnitY(t), GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
                call Effect("war3mapImported\\zhanji-bluex-shu2.mdx", x, y, GetRandomReal(100, 250), randomAngle(), 0, 0, GetRandomReal(1.5, 2.5), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\zxd3.mdx", x, y, GetRandomReal(100, 250), randomAngle(), - 45, 0, GetRandomReal(4, 6), 1, 0, 160, 255, 255)
                call Effect("war3mapImported\\uissb.mdx", x, y, 25, randomAngle(), 0, 0, GetRandomReal(2, 4), 1, 255, 255, 255, 255)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
                set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
                call Effect("war3mapImported\\mkirito2.mdx", x, y, GetRandomReal(25, 150), a, 0, 0, 1, 0.6, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.35, 2))
                if GetRandomInt(1, 2) == 1 then
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 20)
                else
                    if GetRandomInt(1, 2) == 1 then
                        call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 21)
                    else
                        if GetRandomInt(1, 2) == 1 then
                            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 22)
                        else
                            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 23)
                        endif
                    endif
                endif
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Kirito_6-1.mp3")
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 6, 0.4, 0, 160, 255, 255)
            call Effect("war3mapImported\\mkirito2.mdx", GetUnitX(t), GetUnitY(t), 1500, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 27)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.8)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 110 then
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 4, 0.6, 0, 160, 255, 255)
        endif
        if count == 120 then
            call Effect("war3mapImported\\zxd3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 0.8, 0, 160, 255, 255)
        endif
        if count >= 100 and count <= 130 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 50)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Kirito_6-2.mp3")
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_BaShenAn_BaJiuBei.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .2)
            call Effect("war3mapImported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
            call Effect("war3mapImported\\a_new_skybigbang.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, .8)
        endif
        if count == 140 then 
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
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

        if abilId == 'A00K' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A00L' then
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

        if abilId == 'A00M' then
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

        if abilId == 'A00I' then
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

        if abilId == 'A00J' then
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

        if abilId == 'A096' then
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

        if abilId == 'A00N' then
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