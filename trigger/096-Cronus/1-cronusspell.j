scope cronusspell initializer init

    private function period1_1 takes nothing returns nothing
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
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_1.mp3")
            call SoundStart("war3mapImported\\Cronus_1-1.mp3")
            call SoundStart("war3mapImported\\Cronus_1-2.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\fire-boom-newGreen.mdl", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 0, 255, 0, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(u), GetUnitY(u), 100, a + 20, 0, 0, 2, 1.5, 0, 255, 0, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapImported\\BY_Wood_Effect_KOF_K_ReBanJi_YiZhiDan_2.mdl", GetUnitX(u), GetUnitY(u), 100, a - 20, 0, 0, 2, 1.5, 0, 255, 0, 255)
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
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A05T'))
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

    private function period1_2 takes nothing returns nothing
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
        if count <= 210 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_6-2.mp3")
            call SetUnitAnimationByIndex(u, 0)
            set x = PolarX(GetUnitX(t), - 500, a)
            set y = PolarY(GetUnitY(t), - 500, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 13)
        endif
        if count >= 30 and count <= 150 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), 3, a)
                set y = PolarY(GetUnitY(u), 3, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 or count == 80 or count == 130 or count == 180 then
            call Effect("war3mapImported\\WindSlash.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 0, 255, 0, 255)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Cronus_6-3.mp3")
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count == 180 then
            call SetUnitAnimationByIndex(u, 18)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 1.5, 0, 255, 255, 255, 0)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
        endif
        if count == 210 then
            call SaveBoolean(ht, StringHash("CronusQ"), GetHandleId(u), false)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 3 * GetHeroInt(u, true))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count > 210 and not LoadBoolean(ht, StringHash("CronusF"), GetHandleId(t)) then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period2_1 takes nothing returns nothing
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        if count <= 25 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_2.mp3")
            call SoundStart("war3mapImported\\Cronus_2-1.mp3")
            call SetUnitAnimation(u, "spell five")
            call SetUnitTimeScale(u, 1.5)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "hand right")
            call SaveEffectHandle(ht, zid, 100, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "hand left")
            call SaveEffectHandle(ht, zid, 101, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "foot left")
            call SaveEffectHandle(ht, zid, 102, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "foot right")
            call SaveEffectHandle(ht, zid, 103, e)
        endif
        if count <= 25 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            if count > 15 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 45, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 30, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\ltccc.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 0)
            endif
        endif
        if count == 10 then
            call SetUnitAnimation(u, "spell slam six")
        endif
        if count == 25 then 
            call SoundStart("war3mapImported\\Cronus_2-2.mp3")
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\fire-boom-newGreen.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\afbzd.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A05U')) * GetHeroInt(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
        endif
        if count >= 25 and count <= 55 then
            if count > 40 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            endif
        endif
        if count == 55 then
            call SetUnitFlyHeight(t, 0, 0)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period2_2 takes nothing returns nothing
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
        if count <= 160 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_6-4.mp3")
            call SetUnitAnimationByIndex(u, 0)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\WindSlash.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 0, 255, 0, 255)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Cronus_6-5.mp3")
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Cronus_4-4.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 4, 1.5, 0, 255, 0, 255)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 1.5, 0, 255, 255, 255, 0)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 160 then
            call SaveBoolean(ht, StringHash("CronusW"), GetHandleId(u), false)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 3 * GetHeroInt(u, true))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count > 160 and not LoadBoolean(ht, StringHash("CronusF"), GetHandleId(t)) then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period3_1 takes nothing returns nothing
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_4.mp3")
            call SoundStart("war3mapImported\\Cronus_4-1.mp3")
            call SoundStart("war3mapImported\\Cronus_4-2.mp3")
            call SetUnitAnimationByIndex(u, 4)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "hand right")
            call SaveEffectHandle(ht, zid, 100, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "hand left")
            call SaveEffectHandle(ht, zid, 101, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "foot left")
            call SaveEffectHandle(ht, zid, 102, e)
            set e = AddSpecialEffectTarget("war3mapImported\\sistinatoushe.mdl", u, "foot right")
            call SaveEffectHandle(ht, zid, 103, e)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Cronus_4-1.mp3")
            call SoundStart("war3mapImported\\Cronus_4-3.mp3")
            call SetUnitAnimation(u, "spell slam six")
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 2, 1, 0, 255, 0, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 5, 1, 0, 255, 0, 255)
        endif
        if count >= 10 and count <= 35 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            if count > 25 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            endif
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\ltccc.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 0)
            endif
        endif
        if count == 20 then
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count == 35 then 
            call SoundStart("war3mapImported\\Cronus_4-4.mp3")
            call SoundStart("war3mapImported\\Cronus_4-5.mp3")
            call Effect("war3mapImported\\fire-boom-newGreen.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 0, 255, 0, 255)
            call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A05W')) * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
            call DestroyEffect(LoadEffectHandle(ht, zid, 102))
            call DestroyEffect(LoadEffectHandle(ht, zid, 103))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period3_2 takes nothing returns nothing
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
        if count <= 90 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SetUnitVertexColor(u, 255, 255, 255, 0)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Cronus_6-6.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cronus2.mdl", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 10 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Cronus_6-7.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 60)
            set y = PolarY(GetUnitY(t), - 200, a + 60)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", x, y, 50, a, 0, 0, 4, 1.5, 0, 255, 0, 255)
            call Effect("war3mapImported\\ltccc.mdl", x, y, 150, a, 0, 0, 1.5, 1, 255, 255, 255, 0)
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cronus2.mdl", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 30 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Cronus_6(3)-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 120)
            set y = PolarY(GetUnitY(t), - 200, a + 120)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", x, y, 50, a, 0, 0, 4, 1.5, 0, 255, 0, 255)
            call Effect("war3mapImported\\ltccc.mdl", x, y, 150, a, 0, 0, 1.5, 1, 255, 255, 255, 0)
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cronus2.mdl", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 50 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Cronus_6(3)-1.mp3")
            set x = PolarX(GetUnitX(t), - 200, a + 240)
            set y = PolarY(GetUnitY(t), - 200, a + 240)
            call Effect("war3mapImported\\blackblink.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 200, a + 300)
            set y = PolarY(GetUnitY(t), - 200, a + 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", x, y, 50, a, 0, 0, 4, 1.5, 0, 255, 0, 255)
            call Effect("war3mapImported\\ltccc.mdl", x, y, 150, a, 0, 0, 1.5, 1, 255, 255, 255, 0)
            call Effect("war3mapImported\\zxd1.mdl", x, y, 0, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\cronus2.mdl", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 7)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 70 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call ShakeCamera(0.5, GetOwningPlayer(t), 5)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Cronus_6(3)-1.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 0)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 1.5, 0, 255, 255, 255, 0)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 90 then
            call SaveBoolean(ht, StringHash("CronusR"), GetHandleId(u), false)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 3 * GetHeroInt(u, true))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count > 90 and not LoadBoolean(ht, StringHash("CronusF"), GetHandleId(t)) then
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
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
            call SoundStart("war3mapImported\\Cronus_5.mp3")
            call SoundStart("war3mapImported\\Cronus_5-6.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 23)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 16, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\TX_25white first.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4.5, 16, 0, 255, 0, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.6, 14.2)
            call AnimEffect(bj_lastCreatedEffect, 1, 14.2)
        endif
        if count >= 30 and count <= 710 then
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
        if count == 110 then
            call SoundStart("war3mapImported\\Cronus_3.mp3")
            call SetUnitAnimationByIndex(u, 21)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\Cronus_5-1.mp3")
        endif
        if count == 240 then
            call SoundStart("war3mapImported\\Cronus_5-2.mp3")
            call SetUnitAnimationByIndex(u, 12)
            call SetUnitTimeScale(u, 0.8)
            set x = PolarX(GetUnitX(t), - 100, a)
            set y = PolarY(GetUnitY(t), - 100, a)
            call Effect("war3mapImported\\ltszmt.mdl", x, y, 0, a, 0, 0, 1.5, 5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.01)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.7, 3)
        endif
        if count >= 240 and count <= 380 then
            set x = PolarX(GetUnitX(u), 6, a)
            set y = PolarY(GetUnitY(u), 6, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 390 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.1)
        endif
        if count >= 390 and count <= 475 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set i = LoadInteger(ht, zid, 10) + 1
                call SaveInteger(ht, zid, 10, i)
                call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "ImageSpell\\CronusFT-" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
                call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "ImageSpell\\CronusFT-" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
            endif
        endif
        if count == 440 then
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 5, 1.5, 0, 255, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapImported\\afbzd.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 7.5, 255, 255, 255, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 560 then
            call SoundStart("war3mapImported\\Cronus_5-3.mp3")
        endif
        if count == 710 then
            call SoundStart("war3mapImported\\Cronus_5-4.mp3")
            call ForGroup(g, function period4_1)
            call DestroyGroup(g)
        endif
        if count == 810 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SoundStart("war3mapImported\\Cronus_5-5.mp3")
            call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Explode.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2.2, 1.2, 255, 255, 255, 255)
        endif
        if count == 820 then 
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
        set g = null
    endfunction

    private function period4_2 takes nothing returns nothing
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
            call StopSound(LoadSoundHandle(ht, StringHash("CronusBGM"), GetHandleId(u)), true, false)
            call SoundStart("war3mapImported\\CronusBGM2.mp3")
            call SaveSoundHandle(ht, StringHash("CronusBGM"), GetHandleId(u), dummySound)
            call SoundStart("war3mapImported\\Cronus_6-8.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 13)
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count >= 30 and count <= 350 then
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), 3, a)
                set y = PolarY(GetUnitY(u), 3, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 or count == 90 or count == 150 or count == 210 or count == 270 or count == 330 then
            call Effect("war3mapImported\\WindSlash.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 0, 255, 0, 255)
        endif
        if count == 350 then
            call SoundStart("war3mapImported\\Cronus_6-9.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\az_pafeathermoon_c_caster.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 4, 1.5, 0, 255, 0, 255)
            call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, 0, 0, 1.5, 3, 255, 255, 255, 0)
            call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 500 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT2-1.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusT2-1.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 650 then
            call SoundStart("war3mapImported\\Cronus_6-10.mp3") 
        endif
        if count == 730 then
            call SoundStart("war3mapImported\\CronusBGM3.mp3")
            call SaveSoundHandle(ht, StringHash("CronusBGM"), GetHandleId(u), dummySound)
            call SaveBoolean(ht, StringHash("CronusT"), GetHandleId(u), false)
            call SaveBoolean(ht, StringHash("CronusTDmg"), GetHandleId(u), true)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 4 * GetHeroInt(u, true))
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

    globals
        private unit FUnit = null
    endglobals

    private function period5_1 takes nothing returns nothing
        local unit t = GetEnumUnit()

        call RemoveSavedBoolean(ht, StringHash("CronusF"), GetHandleId(t))
        call SetUnitTimeScale(t, 1)
        call PauseUnit(t, false)
        call SetUnitInvulnerable(t, false)
        if HaveSavedReal(ht, StringHash("CronusF"), GetHandleId(t)) then
            call Effect("war3mapImported\\BY_Wood_Decade_RiderKick_Explode.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call DamageUnit(FUnit, t, LoadReal(ht, StringHash("CronusF"), GetHandleId(t)))
            call RemoveSavedReal(ht, StringHash("CronusF"), GetHandleId(t))
        endif

        set t = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local effect e
        local boolean b = not LoadBoolean(ht, StringHash("CronusQ"), GetHandleId(u)) and not LoadBoolean(ht, StringHash("CronusW"), GetHandleId(u)) and not LoadBoolean(ht, StringHash("CronusR"), GetHandleId(u)) and not LoadBoolean(ht, StringHash("CronusT"), GetHandleId(u))

        if b then
            set count = count + 1
            call SaveInteger(ht, zid, 0, count)
        endif
        if count <= 200 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SetUnitInvulnerable(t, true)
        endif
        call PauseUnit(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid , - 1) + 1000 then 
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SaveReal(ht, zid, 0, GetUnitX(t))
            call SaveReal(ht, zid, 1, GetUnitY(t))
            call StopSound(LoadSoundHandle(ht, StringHash("CronusBGM"), GetHandleId(u)), true, false)
            call SoundStart("war3mapImported\\CronusBGM1.mp3")
            call SaveSoundHandle(ht, StringHash("CronusBGM"), GetHandleId(u), dummySound)
            call SoundStart("war3mapImported\\Cronus_6.mp3")
            call SoundStart("war3mapImported\\Cronus_6-1.mp3")
            call SetUnitAnimationByIndex(u, 21)
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltszmt.mdl", GetUnitX(u), GetUnitY(u), 500, a, 90, 0, 1.5, 4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.01)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.7, 2.4)
        endif
        if count == 10 then
            call DisableAbilityEx(u, 'A05T', true)
            call UnitAddAbility(u, 'A0KB')
            call UnitMakeAbilityPermanent(u, true, 'A0KB')
            call DisableAbilityEx(u, 'A05U', true)
            call UnitAddAbility(u, 'A0KC')
            call UnitMakeAbilityPermanent(u, true, 'A0KC')
            call DisableAbilityEx(u, 'A05W', true)
            call UnitAddAbility(u, 'A0KD')
            call UnitMakeAbilityPermanent(u, true, 'A0KD')
            call DisableAbilityEx(u, 'A05Y', true)
            call UnitAddAbility(u, 'A0KE')
            call UnitMakeAbilityPermanent(u, true, 'A0KE')
            call DisableAbilityEx(u, 'A0KE', false)
            call DisableAbilityEx(u, 'A063', false)
        endif
        if count == 100 then
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF-1.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call CinematicFilterGenericEx(GetOwningPlayer(t), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF-1.blp", 255, 255, 255, 0, 255, 255, 255, 255)
        endif
        if count == 200 then
            call disarmUnit(u, 999)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call Effect("war3mapImported\\TX_25white first.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 5, 0, 0, 255, 0, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 0, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveEffectHandle(ht, GetHandleId(z), 101, bj_lastCreatedEffect)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 6, 0, 0, 255, 0, PercentTo255(60))
        endif
        if count >= 200 and count <= 500 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            set dist = Distance(x, y, GetUnitX(u), GetUnitY(u))
            call GroupEnumUnitsInRange(gGroup, x, y, 1200, null)
            call GroupRemoveUnit(gGroup, u)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                    call PauseUnit(gUnit, true)
                    if not IsUnitInGroup(gUnit, g) then
                        call SaveBoolean(ht, StringHash("CronusF"), GetHandleId(gUnit), true)
                        call SetUnitTimeScale(gUnit, 0)
                        call GroupAddUnit(g, gUnit)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
            if dist > 1200 and b then
                call SoundStart("war3mapImported\\Cronus_5-5.mp3")
                call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF-2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
                call RemoveSavedInteger(ht, StringHash("CronusT"), GetHandleId(u))
                call SaveBoolean(ht, StringHash("CronusTDmg"), GetHandleId(u), false)
                set e = LoadEffectHandle(ht, GetHandleId(z), 100)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
                set e = LoadEffectHandle(ht, GetHandleId(z), 101)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
                call UnitRemoveAbility(u, 'B00W')
                call UnitRemoveAbility(u, 'A0KB')
                call EnableAbilityEx(u, 'A05T', true)
                call UnitRemoveAbility(u, 'A0KC')
                call EnableAbilityEx(u, 'A05U', true)
                call UnitRemoveAbility(u, 'A0KD')
                call EnableAbilityEx(u, 'A05W', true)
                call UnitRemoveAbility(u, 'A0KE')
                call EnableAbilityEx(u, 'A05Y', true)
                call EnableAbilityEx(u, 'A063', true)
                set FUnit = u
                call ForGroup(g, function period5_1)
                call DestroyGroup(g)
                call FlushChildHashtable(ht, zid)
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        endif
        if count == 500 or LoadBoolean(ht, StringHash("CronusTDmg"), GetHandleId(u)) or not IsUnitAlive(u) then
            call SoundStart("war3mapImported\\Cronus_5-5.mp3")
            call CinematicFilterGenericEx(GetOwningPlayer(u), 3, BLEND_MODE_BLEND, "war3mapImported\\CronusF-2.blp", 255, 255, 255, 0, 255, 255, 255, 255)
            call RemoveSavedInteger(ht, StringHash("CronusT"), GetHandleId(u))
            call SaveBoolean(ht, StringHash("CronusTDmg"), GetHandleId(u), false)
            set e = LoadEffectHandle(ht, GetHandleId(z), 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            set e = LoadEffectHandle(ht, GetHandleId(z), 101)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call UnitRemoveAbility(u, 'B00W')
            call UnitRemoveAbility(u, 'A0KB')
            call EnableAbilityEx(u, 'A05T', true)
            call UnitRemoveAbility(u, 'A0KC')
            call EnableAbilityEx(u, 'A05U', true)
            call UnitRemoveAbility(u, 'A0KD')
            call EnableAbilityEx(u, 'A05W', true)
            call UnitRemoveAbility(u, 'A0KE')
            call EnableAbilityEx(u, 'A05Y', true)
            call EnableAbilityEx(u, 'A063', true)
            set FUnit = u
            call ForGroup(g, function period5_1)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set g = null
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 20 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Cronus_3.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 10 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Cronus_3-1.mp3")
            call SoundStart("war3mapImported\\Cronus_3-2.mp3")
            call SoundStart("war3mapImported\\Cronus_3-3.mp3")
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 3, 1, 0, 255, 0, 255)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count >= 20 and count <= 50 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then 
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                set a = LoadReal(ht, GetHandleId(z), 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 0, 255, 0, 255)
                call Effect("war3mapImported\\Chongfengnew.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\ltccc.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 0)
                call Effect("war3mapImported\\Midoliyasd.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 50 then
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
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A05T' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1_1)
        endif

        if abilId == 'A0KB' then 
            set z = CreateTimer()
            call SaveBoolean(ht, StringHash("CronusQ"), GetHandleId(u), true)
            call SaveInteger(ht, StringHash("CronusT"), GetHandleId(u), LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) == 3 then
                call EnableAbilityEx(u, 'A0KE', true)
                call RemoveSavedInteger(ht, StringHash("CronusT"), GetHandleId(u))
            endif
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period1_2)
        endif

        if abilId == 'A05U' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period2_1)
        endif

        if abilId == 'A0KC' then 
            set z = CreateTimer()
            call SaveBoolean(ht, StringHash("CronusW"), GetHandleId(u), true)
            call SaveInteger(ht, StringHash("CronusT"), GetHandleId(u), LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) == 3 then
                call EnableAbilityEx(u, 'A0KE', true)
                call RemoveSavedInteger(ht, StringHash("CronusT"), GetHandleId(u))
            endif
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period2_2)
        endif

        if abilId == 'A05W' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period3_1)
        endif

        if abilId == 'A0KD' then 
            set z = CreateTimer()
            call SaveBoolean(ht, StringHash("CronusR"), GetHandleId(u), true)
            call SaveInteger(ht, StringHash("CronusT"), GetHandleId(u), LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) + 1)
            if LoadInteger(ht, StringHash("CronusT"), GetHandleId(u)) == 3 then
                call EnableAbilityEx(u, 'A0KE', true)
                call RemoveSavedInteger(ht, StringHash("CronusT"), GetHandleId(u))
            endif
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period3_2)
        endif

        if abilId == 'A05Y' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0KE' then 
            set z = CreateTimer()
            call SaveBoolean(ht, StringHash("CronusT"), GetHandleId(u), true)
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period4_2)
        endif

        if abilId == 'A062' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call SaveReal(ht, GetHandleId(z) , - 1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A063' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
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