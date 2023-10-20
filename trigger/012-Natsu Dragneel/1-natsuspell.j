scope natsuspell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local effect e
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\blazingwind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 120, a)
            set y = PolarY(GetUnitY(u), 120, a)
            call Effect("war3mapImported\\mc natsu.mdl", x, y, 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(gUnit, u) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A000'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\natsufire1.mdl", x, y, 50 + count * 10, a, - 90, 0, 1 + count * 0.1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\dtrednoring.mdl", x, y, 50 + count * 10, a, - 90, 0, 1 + count * 0.1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
        set g = null
    endfunction

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_2.mp3")
            call SetUnitAnimation(u, "attack")
        endif
        if count == 20 or count == 40 or count == 60 then
            call SetUnitAnimation(u, "attack")
        endif
        if count <= 80 then
            set x = PolarX(GetUnitX(u), 25, a)
            set y = PolarY(GetUnitY(u), 25, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (1 + GetUnitAbilityLevel(u, 'A001')) * GetHeroStr(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\Natsu Fire.mdl", GetUnitX(u), GetUnitY(u), 0, a + 100, 0, 0, 1, 0.8, 255, 255, 255, 255)
                call MoveEffect(bj_lastCreatedEffect, 20, 0.6, a + 100)
                call Effect("war3mapImported\\Natsu Fire.mdl", GetUnitX(u), GetUnitY(u), 0, a - 100, 0, 0, 1, 0.8, 255, 255, 255, 255)
                call MoveEffect(bj_lastCreatedEffect, 20, 0.6, a - 100)
                call Effect("war3mapImported\\Holy_Fire_Slam2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 80 then
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        if count <= 300 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_4.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\Holy_Fire_Slam3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\fireeffectorange.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, AddSpecialEffectTarget("war3mapImported\\EffecktNatsuHand1.mdl", u, "hand right"))
            call SaveEffectHandle(ht, GetHandleId(z), 11, AddSpecialEffectTarget("war3mapImported\\EffecktNatsuHand1.mdl", u, "hand left"))
        endif
        if count == 20 or count == 60 or count == 100 or count == 140 or count == 180 or count == 220 or count == 260 or count == 300 then
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 153, 51, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count >= 120 and count <= 300 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\fireeffectorange.mdl", GetUnitX(u), GetUnitY(u), 150, a, - 90, 0, GetRandomReal(0.8, 1.5), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\fireshockrun1.mdl", GetUnitX(u), GetUnitY(u), 50, a + GetRandomReal(- 30, 30), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
                call MoveEffect(bj_lastCreatedEffect, 30, 0.6, GetSpecialEffectYaw(bj_lastCreatedEffect))
            endif
        endif
        if count == 300 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A004')) * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 10))
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 11))
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count >= 300 and count <= 330 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\fireshockrun1.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, GetRandomReal(1.2, 2), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 330 then
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Kong.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.3, 1, 255, 255, 255, 255)
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
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_5.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count <= 40 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 30, a)
                set y = PolarY(GetUnitY(u), dist / 30, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, GetRandomReal(0.3, 0.5), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Natsu_5-1.mp3")
            call Effect("war3mapImported\\by_wood_effect_yuzhiboyou_fire_babangouyu_1_kong.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[A]AZ_TormentedSoul_T1_3.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\qj3.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2.2, 1, 255, 255, 255, 255) 
            call Effect("war3mapImported\\qj3.mdl", GetUnitX(t), GetUnitY(t), 100, a + 120, 0, 0, 2.2, 1, 255, 255, 255, 255) 
            call Effect("war3mapImported\\qj3.mdl", GetUnitX(t), GetUnitY(t), 100, a + 240, 0, 0, 2.2, 1, 255, 255, 255, 255) 
        endif
        if count == 50 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z), 1)
        local effect e 
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_6.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 9)
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, GetHandleId(z), 10, bj_lastCreatedEffect)
        endif
        if count == 10 or count == 25 then
            call Effect("war3mapImported\\WindCircleFaster.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.4, 1, 255, 153, 51, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]BY_Wood_Flame_explosion_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 25 and count <= 75 then
            set e = LoadEffectHandle(ht, GetHandleId(z), 10)
            set x = PolarX(GetEffectX(e), 40, a)
            set y = PolarY(GetEffectY(e), 40, a)
            call SetEffectXY(e, x, y, 1)
            set x = GetEffectX(e)
            set y = GetEffectY(e)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
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
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BreathOfFireMissile.mdl", x, y, 50 + (count - 25) * 5, a, 0, 0, 1 + (count - 25) * 0.05, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\fireleaf.mdl", x, y, (count - 25) * 3, a, 0, 0, 1 + (count - 25) * 0.03, 1, 255, 255, 255, 255)
                call Effect("Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 75 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
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

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local real a = LoadReal(ht, GetHandleId(z), 0)
        local real dist = LoadReal(ht, GetHandleId(z), 1)
        local real x
        local real y
        local integer count = LoadInteger(ht, GetHandleId(z), 0) + 1
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)

        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Natsu_7.mp3")
            call SetUnitAnimation(u, "spell three")
            call SetUnitTimeScale(u, 0.6)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
        endif
        if count == 10 then
            call SetUnitAnimation(u, "spell slam six")
        endif
        if count <= 30 then
            set x = PolarX(GetUnitX(u), dist / 30, a)
            set y = PolarY(GetUnitY(u), dist / 30, a)
            call SetUnitXY(u, x, y, 1)
            if count > 20 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 40, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(0.6, 1.2), 1, 255, 204, 153, PercentTo255(80))
                call Effect("war3mapImported\\hellblast.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(0.4, 0.9), 1, 255, 255, 255, PercentTo255(60))
                call Effect("war3mapImported\\FireNova.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(0.4, 0.9), 1, 255, 255, 255, PercentTo255(90))
                call Effect("war3mapImported\\laxusspark2.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, GetRandomReal(0.4, 0.9), 1, 255, 255, 255, PercentTo255(70))
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Natsu_7-1.mp3") 
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_YueYun_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.6, 1, 255, 255, 255, 255)
        endif
        if count == 35 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 8 * GetHeroStr(u, true))
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 40 then
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

        if abilId == 'A000' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A001' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A004' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A005' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A006' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A007' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveReal(ht, GetHandleId(z), 1, dist)
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