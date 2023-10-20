scope yamajispell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Yamaji_1.mp3")
            call SoundStart("war3mapImported\\Yamaji_1-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            if GetUnitTypeId(u) == 'H0FV' then
                call SetUnitAnimationByIndex(u, 4)
            else
                call SetUnitAnimationByIndex(u, 3)
            endif
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 25, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count == 5 then
            call Effect("war3mapImported\\File0000 (84).mdl", GetUnitX(u), GetUnitY(u), 100, GetUnitFacing(u), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 10 then 
            call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 400, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 700, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 1000, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 400, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 700, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 1000, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0BA'))
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
        if count <= 220 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Yamaji_2.mp3")
            call SoundStart("war3mapImported\\Yamaji_2-1.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 10 then
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 80 then 
            call SoundStart("war3mapImported\\Yamaji_2-2.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.5) 
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 120 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 205 then
            call SetUnitTimeScale(u, 0.85)
        endif
        if count <= 220 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.6, 1), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
                call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1.2), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 50)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
            endif
        endif
        if count == 220 then 
            call SoundStart("war3mapImported\\Yamaji_2-3.mp3")
            set x = PolarX(GetUnitX(t), 50, a)
            set y = PolarY(GetUnitY(t), 50, a)
            call Effect("war3mapImported\\[A]earthdom(nocolor).mdl", x, y, 100, a, - 90, 0, 1.7, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\az_hitheavy.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]hit-white-guangxiao.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\qqqqqr.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\az-zidan.mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", x, y, 100, a, - 180, 0, 2.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0BB')) * GetHeroStr(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call SaveReal(ht, zid, 0, a)
        endif
        if count >= 220 and count <= 250 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then 
                call SaveInteger(ht, zid, 1, 0)
                set a = LoadReal(ht, zid, 0)
                set x = PolarX(GetUnitX(t), 50, a)
                set y = PolarY(GetUnitY(t), 50, a)
                call Effect("war3mapImported\\wind3.mdl", x, y, 150, a, - 90, 0, GetRandomReal(0.85, 1.25), 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1.2, 1.75))
            endif
        endif
        if count == 250 then 
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    function period3_1 takes nothing returns nothing
        local unit u = GetEnumUnit()

        call PauseUnit(u, false)
        call UnitApplyTimedLife(u, 'BTLF', 12)

        set u = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
            call SoundStart("war3mapImported\\Yamaji_2-4.mp3")
            call SoundStart("war3mapImported\\Yamaji_2-5.mp3")
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.75)
            call Effect("war3mapImported\\az_coco_t2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.2, 4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\blink-yellow2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 1 or count == 40 or count == 80 or count == 120 or count == 160 then
            call Effect("war3mapImported\\[A]Explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 110 then
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 0.5) 
        endif
        if count >= 50 and count <= 170 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 8 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetUnitY(u), GetRandomReal(- 600, 600), randomAngle())
                set bj_lastCreatedUnit = CreateUnit(GetOwningPlayer(u), 'h0FW', x, y, randomAngle())
                call SetUnitAnimation(bj_lastCreatedUnit, "birth")
                call SetUnitVertexColor(bj_lastCreatedUnit, PercentTo255(10), PercentTo255(10), PercentTo255(10), 255) 
                call PauseUnit(bj_lastCreatedUnit, true)
                call AddSpecialEffectTarget("Environment\\LargeBuildingFire\\LargeBuildingFire1.mdl", bj_lastCreatedUnit, "chest")
                call SetUnitBaseDamageByIndex(bj_lastCreatedUnit, 0, GetHeroStr(u, true) / 3)
                call UnitAddGuard(u, bj_lastCreatedUnit, 0.5, 600, 1200, 1400)
                call GroupAddUnit(g, bj_lastCreatedUnit)
            endif
        endif
        if count == 150 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        endif
        if count == 154 then 
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
        endif
        if count == 158 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 162 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 166 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 120, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 170 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 150, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 174 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 180, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 178 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 210, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 182 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 240, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 186 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 270, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 190 then
            set x = PolarX(GetUnitX(u), - 200, a)
            set y = PolarY(GetUnitY(u), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 4.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8) 
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 300, - 180, 0, 3.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 195 then
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4, 1.5, 255, PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)  
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 200 then 
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            call SetUnitXY(u, x, y, 0)
            call ForGroup(g, function period3_1)
            call DestroyGroup(g)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2 + GetUnitAbilityLevel(u, 'A0BB')) * GetHeroStr(u, true))
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real dmg

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
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
            call SoundStart("war3mapImported\\Yamaji_4.mp3")
            call SoundStart("war3mapImported\\Yamaji_4-1.mp3")
            if GetUnitTypeId(u) != 'H0FV' then
                call SetUnitAnimationByIndex(u, 2)
            else
                call SetUnitAnimationByIndex(u, 5)
            endif
            call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.3, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1.5, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count == 1 or count == 15 or count == 30 then
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
        endif
        if count == 80 then
            if GetUnitTypeId(u) != 'H0FV' then
                call SetUnitAnimationByIndex(u, 7)
                call SetUnitTimeScale(u, 0.7)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Yamaji_4-2.mp3")
        endif
        if count >= 100 and count <= 300 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 10 or iterator == 20 then 
                if iterator == 20 then 
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(60))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                endif
                set x = PolarX(GetUnitX(t), GetRandomReal(- 600, 600), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 600, 600), randomAngle())
                call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", x, y, 0, randomAngle(), 0, 0, 0.6, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", x, y, 100, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(80), PercentTo255(50), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif
        if count == 330 or count == 350 or count == 370 then
            call Effect("war3mapImported\\EscanorCruelSunExpAfb1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(70))
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 370 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0BD')) * GetHeroStr(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local unit u = LoadUnitHandle(ht, zid, 0)

        if not IsUnitInvulnerable(u) then
            set count = count + 1
            call SaveInteger(ht, zid, 0, count)
        endif
        if count >= 250 or not IsUnitAlive(u) or GetUnitAbilityLevel(u, 'B00J') == 0 then
            call UnitRemoveAbility(u, 'A0BE')
            call UnitRemoveAbility(u, 'B00J')
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 50 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart( "war3mapImported\\Yamaji_5.mp3" )
            call Effect("war3mapimported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.6, 1.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapimported\\[A]FireEruption2.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\FireEffectOrange.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SoundStart( "war3mapImported\\Yamaji_5-1.mp3" )
            if GetUnitTypeId(u) != 'H0FV' then
                call MorphUnit(u, 'H0FV')
            endif
            call DisableAbilityEx(u, 'A0BF', true)
            call UnitAddAbility(u, 'A0EX')
            call UnitMakeAbilityPermanent(u, true, 'A0EX')
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\qjbuff.mdl", u, "origin"))
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
        endif
        if count > 50 and GetUnitAbilityLevel(u, 'B01T') == 0 and IsUnitAlive(u) then 
            call MorphUnit(u, 'H0FU')
            call UnitRemoveAbility(u, 'A0EX')
            call EnableAbilityEx(u, 'A0BF', true)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
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
            call SoundStart("war3mapImported\\Yamaji_4-7.mp3")
            set x = PolarX(GetUnitX(t), - 700, a)
            set y = PolarY(GetUnitY(t), - 700, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.4, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 1 or count == 30 or count == 60 or count == 90 then
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.15, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 50 then
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count >= 50 and count <= 100 then
            set x = PolarX(GetUnitX(u), 5, a)
            set y = PolarY(GetUnitY(u), 5, a)
            call SetUnitX(u, x)
            call SetUnitY(u, y)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Yamaji_4-8.mp3")
            call SoundStart("war3mapImported\\Yamaji_4-9.mp3")
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 110 then 
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\Genryuusai_onearmed.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.5, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacing(u, a + 180)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 115 then
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a, 0, 0, 1.4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 120 then
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a - 30, 0, 0, 1.75, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 150, a - 30, 0, 0, 1.4, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 120 and count <= 160 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Yamaji_4-10.mp3")
            set x = PolarX(GetUnitX(t), 300, a)
            set y = PolarY(GetUnitY(t), 300, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 200 or count == 220 or count == 240 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, GetUnitFacing(u), 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(u), 20, a)
            set y = PolarY(GetUnitY(u), 20, a)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 200 and count <= 230 then
            set x = PolarX(GetUnitX(u), 20, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 20, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 215 then
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(u), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\effect2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.75, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 220 and count <= 265 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(u), 50, a)
                set y = PolarY(GetUnitY(u), 50, a)
                call Effect("war3mapImported\\[A]SlamWithOut.mdl", x, y, 50, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 230 and count == 290 then
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count >= 230 and count <= 270 then
            set x = PolarX(GetUnitX(u), 10, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 10, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 270 then
            call SoundStart("war3mapImported\\Yamaji_4-11.mp3")
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacing(u, a)
        endif
        if count == 260 or count == 290 or count == 310 or count == 330 then
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, a, 0, 0, 0.7, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set x = PolarX(GetUnitX(u), 20, a)
            set y = PolarY(GetUnitY(u), 20, a)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 300 then
            call SetUnitTimeScale(u, 0.5)
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count >= 290 and count <= 340 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 330 then
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, 0, 0, 3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 90, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 334 then
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, 0, 0, 3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 60, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 338 then
            call SoundStart("war3mapImported\\Yamaji_4-12.mp3") 
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, 0, 0, 3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a - 30, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1, 255, PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\AZ_hit-red.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.3)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 342 then
            set x = PolarX(GetUnitX(t), - 300, a)
            set y = PolarY(GetUnitY(t), - 300, a)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 350 then
            call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)  
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 4, 1.5, 255, PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)  
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 360 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 14 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call RemoveUnit(LoadUnitHandle(ht, zid, 2))
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
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
            call SoundStart("war3mapImported\\Yamaji_6.mp3")
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 30 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.3)
            call Effect("war3mapImported\\Genryuusai.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 5)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count <= 170 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1.2), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.8)) 
                if count >= 80 then 
                    call Effect("war3mapImported\\WindExploreEffect(Bigger).mdl", GetUnitX(u), GetUnitY(u), 300, randomAngle(), - 90, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.75))
                    call Effect("war3mapImported\\WindExploreEffect(Bigger).mdl", GetUnitX(u), GetUnitY(u), 300, randomAngle(), - 90, 0, GetRandomReal(1.5, 2), 1, 255, 255, 255, PercentTo255(GetRandomReal(20, 60)))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.75))
                endif
            endif
        endif
        if count == 170 then
            call SoundStart("war3mapImported\\Yamaji_3.mp3")
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitTimeScale(u, 0)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\HakenSaber2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count == 180 or count == 200 or count == 220 or count == 240 or count == 260 or count == 280 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Yamaji_6-1.mp3")
        endif
        if count == 220 then
            call SetUnitTimeScale(u, 0.2)
        endif
        if count == 250 then
            call SoundStart("war3mapImported\\Yamaji_6-2.mp3")
        endif
        if count == 270 then
            call SetUnitTimeScale(u, 0.45)
        endif
        if count == 280 then
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\chongfeng2.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            set x = PolarX(GetUnitX(u), 100, a)
            set y = PolarY(GetUnitY(u), 100, a)
            call Effect("war3mapImported\\dash sfx.mdl", x, y, 50, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(30))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            set x = PolarX(GetUnitX(u), - 250, a)
            set y = PolarY(GetUnitY(u), - 250, a)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_5.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 290 then
            call Effect("war3mapImported\\[A]GrassPisses.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 180, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, - 180, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\[A]shockwave big.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 0.6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 300 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroStr(u, true))
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

    private function period9 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
            call SoundStart("war3mapImported\\Yamaji_7-4.mp3")
            call SetUnitAnimationByIndex(u, 0)
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Yamaji_7-5.mp3")
        endif
        if count == 220 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 250 then
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count <= 270 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 10 or iterator == 15 then 
                if iterator == 15 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\FireEffectOrange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, PercentTo255(60))
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                endif
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.75, 1.2), 1, 255, 255, 255, PercentTo255(GetRandomReal(30, 70)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.8)) 
                call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.25), 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6)) 
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.35), 1, 255, PercentTo255(80), PercentTo255(50), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.4, 0.6))
            endif
        endif
        if count == 270 then
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 4, 1, 255, PercentTo255(70), 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 180, 0, 3.5, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\BY_Wood_GongChengSiPai_1.mdl", GetUnitX(t), GetUnitY(t), 150, a + 180, - 180, 0, 2, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call Effect("war3mapImported\\wind3.mdl", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, a, 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 270 and count <= 300 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 25, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e), 25, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then 
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetEffectX(e), 50, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 50, GetSpecialEffectYaw(e))
                call Effect("war3mapImported\\[A]BY_Wood_huoquan.mdl", x, y, 150, a, 0, 0, 1.7, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
                call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 150, a, - 90, 0, 1.25, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\[A]BY_Wood_Kong.mdl", x, y, 150, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\FireEffectOrange.mdl", x, y, 150, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            endif
        endif
        if count == 300 then
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
        set e = null
    endfunction

    private function period10 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
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
            call SoundStart("war3mapImported\\Yamaji_7.mp3")
            if GetUnitTypeId(u) == 'H0FV' then
                call SetUnitAnimationByIndex(u, 0)
            else 
                call SetUnitAnimationByIndex(u, 1)
            endif
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 1 or count == 30 or count == 60 or count == 90 or count == 120 or count == 150 then
            call Effect("war3mapImported\\[A]Explodeorange.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4) 
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Yamaji_7-1.mp3")
            if GetUnitTypeId(u) == 'H0FV' then
                call SetUnitAnimationByIndex(u, 8)
            else 
                call SetUnitAnimationByIndex(u, 2)
            endif
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Yamaji_7-2.mp3")
            call SetUnitTimeScale(u, 0.7)
        endif
        if count == 150 and count == 160 or count == 170 or count == 180 or count == 190 then 
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6) 
            call Effect("war3mapImported\\wind3.mdl", x, y, 50, a, - 90, 0, 1.2, 1, 255, 255, 255, PercentTo255(40))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 150 and count <= 170 then
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
        if count == 170 then
            if GetUnitTypeId(u) == 'H0FV' then
                call SetUnitAnimationByIndex(u, 7)
                call SetUnitTimeScale(u, 0.9)  
            else
                call SetUnitAnimationByIndex(u, 3)
                call SetUnitTimeScale(u, 1) 
            endif
            call SetUnitFacingEx(u, a, true)
        endif
        if count >= 170 and count <= 230 then
            set x = PolarX(GetUnitX(u), 5, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 5, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 195 then
            if GetUnitTypeId(u) == 'H0FV' then
                set x = PolarX(GetUnitX(t), - 100, GetUnitFacing(u))
                set y = PolarY(GetUnitY(t), - 100, GetUnitFacing(u))
                call Effect("war3mapImported\\animeslashfinal.mdl", x, y, 100, GetUnitFacing(u), 0, - 270, 2, 1, 255, PercentTo255(80), PercentTo255(50), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)  
                call Effect("war3mapImported\\[A]HibikiSlam.mdl", x, y, 100, GetUnitFacing(u), 0, 0, 1.5, 1, 255, PercentTo255(80), PercentTo255(50), PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
                call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(u), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                set x = PolarX(GetUnitX(t), 50, GetUnitFacing(u))
                set y = PolarY(GetUnitY(t), 50, GetUnitFacing(u))
                call Effect("war3mapImported\\az_hit-red-blade.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            else
                set x = PolarX(GetUnitX(t), - 200, GetUnitFacing(u))
                set y = PolarY(GetUnitY(t), - 200, GetUnitFacing(u))
                call Effect("war3mapImported\\File0000 (85).mdl", x, y, 100, GetUnitFacing(u), 0, 0, 2, 1, 255, 255, 255, PercentTo255(50))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\az-zidan.mdl", GetUnitX(t), GetUnitY(t), 150, GetUnitFacing(u), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
                call Effect("war3mapImported\\qqqqqr.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            endif
        endif
        if count == 205 then
            call SoundStart("war3mapImported\\Yamaji_7-3.mp3")
        endif
        if count == 220 then
            call SetUnitFacing(u, a)
        endif
        if count == 230 then
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            set x = PolarX(GetUnitX(t), 50, a + 180)
            set y = PolarY(GetUnitY(t), 50, a + 180)
            call Effect("war3mapImported\\az_hit-red-blade.mdl", x, y, 100, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
            call Effect("war3mapImported\\AZ_Jugg_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 210, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call Effect("war3mapImported\\AZ_Jugg_E1.mdl", GetUnitX(t), GetUnitY(t), 100, a + 150, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 240 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            if GetUnitTypeId(u) == 'H0FV' then
                call DamageUnit(u, t, 9 * GetHeroStr(u, true))
            else
                call DamageUnit(u, t, 8 * GetHeroStr(u, true))
            endif
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0BA' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif
        
        if abilId == 'A0BB' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FV' then
                call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
                call TimerStart(z, 0.02, true, function period3)
            else
                call TimerStart(z, 0.02, true, function period2)
            endif
        endif
        
        if abilId == 'A0BC' then
            call SoundStart("war3mapImported\\Yamaji_3.mp3")
        endif
        
        if abilId == 'A0BD' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if t != u then
                call PauseUnit(u, true)
                call SetUnitInvulnerable(u, true)
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period4)
            else
                call SoundStart("war3mapImported\\Yamaji_4-3.mp3")
                call UnitAddAbility(u, 'A0BE')
                call UnitMakeAbilityPermanent(u, true, 'A0BE')
                call TimerStart(z, 0.02, true, function period5)
            endif
        endif
        
        if abilId == 'A0BF' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A0EX' then
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
            call TimerStart(z, 0.02, true, function period7)
        endif

        if abilId == 'A0BG' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H0FV' then
                call TimerStart(z, 0.02, true, function period9)
            else
                call TimerStart(z, 0.02, true, function period8)
            endif
        endif

        if abilId == 'A0BH' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
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