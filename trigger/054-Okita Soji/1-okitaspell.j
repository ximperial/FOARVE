scope okitaspell initializer init
   
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\OkitaAlter_1.mp3")
            call SoundStart("war3mapImported\\OkitaAlter_1-1.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\eslash2.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, - 90, 3, 1, 255, 50, 50, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\TZJQ5.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 2, 1, 255, 50, 50, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, zid, 101)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A04R'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\AFBRedCharge.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\cf2.mdl", x, y, 0, a, 0, 0, 0.75, 1, 225, 50, 50, 255)
                call Effect("war3mapImported\\dc-slashslam.mdl", x, y, 0, a, 0, 0, 1, 1, 250, 40, 40, 255)
            endif
        endif
        if count == 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SoundStart("war3mapImported\\SojiAlter_4.mp3")
            call SetUnitAnimationByIndex(u, 11)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call Effect("war3mapImported\\az_pafeathermoon_b.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 10, a)
                set y = PolarY(GetUnitY(u), dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 10, a)
                set y = PolarY(GetUnitY(t), 10, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Chtholly_1-2.mp3")
            call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 25 and count <= 45 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\SojiAlter_4-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call SetUnitTimeScale(u, 2)
        endif
        if count == 55 or count == 65 or count == 75 or count == 85 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\OkitaAlterSE1.mp3")
            else
                call SoundStart("war3mapImported\\OkitaAlterSE2.mp3")
            endif
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\OkitaAlterSE3.mp3")
            else
                call SoundStart("war3mapImported\\OkitaAlterSE4.mp3")
            endif
            call SetUnitAnimation(u, "attack")
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 50, 0)
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            if GetRandomInt(1, 2) == 1 then
                call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, - 40, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DYoumu_BladeEx.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 40, 0, 7, 1, 255, 255, 255, 255)
            else
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 40, 1.5, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\DYoumu_BladeEx.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 40, 0, 7, 1, 255, 255, 255, 255)
                else
                    call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\DYoumu_BladeEx.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
                endif
            endif
            call Effect("war3mapImported\\bloodslash.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[DoFT]hero_skeletonking_n2s_e_star.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), GetRandomReal(- 50, - 30), 0, 5, 1, 255, 20, 20, 255)
        endif
        if count == 95 then
            call SoundStart("war3mapImported\\OkitaAlterSE5.mp3")
            call SoundStart("war3mapImported\\OkitaAlterSE6.mp3")
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            call Effect("war3mapImported\\animeslashfinal.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 0, - 90, 4, 1.5, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
        endif
        if count == 115 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            set i = 0
            loop
                exitwhen i > 3
                call Effect("war3mapImported\\yydlz.mdl", GetUnitX(t), GetUnitY(t), 200 * i, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set i = i + 1
            endloop
            call Effect("war3mapImported\\OkitaAlterEff1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 120 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A04S')) * GetHeroAgi(u, true))
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
        if count <= 70 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\SojiAlter_2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 10 or count == 20 or count == 35 or count == 45 or count == 70 then
            if GetRandomInt(1, 2) == 1 then
                call SoundStart("war3mapImported\\Hyde_2-1.mp3")
            else
                if GetRandomInt(1, 2) == 1 then
                    call SoundStart("war3mapImported\\Hyde_2-3.mp3")
                else
                    call SoundStart("war3mapImported\\Hyde_2-5.mp3")
                endif
            endif
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimation(u, "attack")
            if GetRandomInt(1, 2) == 1 then
                call Effect("war3mapImported\\Knife1.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1, 255, 255, 255, 255)
            else
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\OkitaAlterEff2.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1, 255, 255, 255, 255)
                else
                    if GetRandomInt(1, 2) == 1 then
                        call Effect("war3mapImported\\Knife2.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1, 255, 255, 255, 255)
                    else
                        call Effect("war3mapImported\\OkitaAlterEff3.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1, 255, 255, 255, 255)
                    endif
                endif
            endif
            call Effect("war3mapImported\\afbxnntx.mdl", GetUnitX(u), GetUnitY(u), 200, randomAngle(), GetRandomReal(- 20, 20), 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\[DoFT]hero_skeletonking_n2s_e_star.mdl", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 150, randomAngle(), GetRandomReal(- 50, - 30), 0, 5, 1, 255, 20, 20, 255)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\OkitaAlter_3.mp3")
        endif
        if count <= 50 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 60 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimation(u, "attack")
        endif
        if count == 75 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0CS')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SoundStart("war3mapImported\\Hyde_3-3.mp3")
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 11)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 then
            call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\OkitaAlter_7.mp3")
            call SoundStart("war3mapImported\\OkitaAlter_6-1.mp3")
            call SetUnitTimeScale(u, 1.5)
        endif
        if count >= 25 and count <= 125 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call SetUnitAnimation(u, "attack")
                call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, - 40, 1.5, 1, 255, 255, 255, 255)
                else
                    if GetRandomInt(1, 2) == 1 then
                        call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 40, 1.5, 1, 255, 255, 255, 255)
                    else
                        call Effect("war3mapImported\\BY_Wood_DanGe_ZhanJi_DaoGuang_6_1-Red.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                    endif
                endif
                call Effect("war3mapImported\\DGDDXZ4.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), - 45, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\[DoFT]hero_skeletonking_n2s_e_star.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 50, - 30), 0, 5, 1, 255, 20, 20, 255)
                call Effect("war3mapImported\\zhanji-redx-shu3.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), GetRandomReal(- 40, 40), 0, 5, 4 - (count - 25) * 0.02, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.2)
                call TimeScaleEffect(bj_lastCreatedEffect, 1, 2.6 - (count - 25) * 0.02)
            endif
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\OkitaAlter_5-2.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapImported\\OkitaAlterEff4.mdl", GetUnitX(t), GetUnitY(t), 200, a + 70, 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 140 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A04T')) * GetHeroAgi(u, true))
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
        local real a2
        local integer i
        local effect e

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
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SoundStart("war3mapImported\\SojiAlter_5.mp3")
            set x = PolarX(GetUnitX(t), - 1000, a)
            set y = PolarY(GetUnitY(t), - 1000, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 12)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 or count == 20 or count == 30 then
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 240, 150, 60, PercentTo255(40))
            call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 20, 20, PercentTo255(60))
            call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_3.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\k4.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 0)
        endif
        if count <= 40 then
            set x = PolarX(GetUnitX(u), 15, a)
            set y = PolarY(GetUnitY(u), 15, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, PercentTo255(100 - count * 2.5))
        endif
        if count == 40 then
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\white-qiquan-juhuang_red.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\white-qiquan-juhuang_yellow.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\SojiAlter_5-1.mp3")
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 4, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count >= 50 and count <= 150 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a2)
                call Effect("war3mapImported\\OkitaAlterEff4.mdl", x, y, 100, a2, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\effect2.mdl", x, y, 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\az_pafeathermoon_b.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\jxpx.mdl", x, y, 0, a2, 0, 0, 2, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                set a2 = Angle(x, y, GetUnitX(t), GetUnitY(t))
                set x = PolarX(GetUnitX(t), 20, a2)
                set y = PolarY(GetUnitY(t), 20, a2)
                call SetUnitXY(t, x, y, 2)
            endif
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\SojiAlter_5-2.mp3")
            set x = PolarX(GetUnitX(t), 300, a)
            set y = PolarY(GetUnitY(t), 300, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 12)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\[DoFT]e_slashred.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, 0, 3.5, 1.5, 0, 0, 0, 255)
            call Effect("war3mapImported\\[DoFT]e_slashred.mdl", GetUnitX(u), GetUnitY(u), 200, a, 0, 0, 3, 1.5, 255, 150, 60, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\TZJQ5.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 150 and count <= 170 then
            set x = PolarX(GetUnitX(u), 30, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 30, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, PercentTo255(40 + (count - 150) * 3))
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 100 + GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_1.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 170 then
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitFacing(u, a)
        endif
        if count >= 170 and count <= 240 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set i = LoadInteger(ht, zid, 10) + 1
                call SaveInteger(ht, zid, 10, i)
                call CinematicFilterGenericEx(GetOwningPlayer(u), 1, BLEND_MODE_BLEND, "ImageSpell\\OkitaAlter" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
                call CinematicFilterGenericEx(GetOwningPlayer(t), 1, BLEND_MODE_BLEND, "ImageSpell\\OkitaAlter" + I2S(i) + ".blp", 255, 255, 255, 0, 255, 255, 255, 255)
            endif
        endif
        if count == 180 then
            call SoundStart("war3mapImported\\SojiAlter_5-3.mp3")
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 220 then
            call Effect("war3mapImported\\exshexian5black.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\exshexian5white.mdl", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 1, 2, 255, 255, 0, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            set i = 1
            loop
                exitwhen i > 6
                set x = PolarX(GetUnitX(u), 300 * i, a)
                set y = PolarY(GetUnitY(u), 300 * i, a)
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", x, y, 300, randomAngle(), - 90, 0, 3, 1, 0, 0, 0, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                if i == 1 or i == 3 or i == 5 then
                    call Effect("war3mapImported\\zxd3.mdl", x, y, 400, a, - 90, 0, 6, 1, 0, 0, 0, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                else
                    call Effect("war3mapImported\\zxd3.mdl", x, y, 400, a, - 90, 0, 6, 1, 255, 255, 0, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                endif
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_5_2.mdl", x, y, 300, randomAngle(), - 90, 0, 3, 1, 255, 255, 0, 220)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
                set i = i + 1
            endloop
        endif
        if count == 240 then
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
        local real a2
        local integer i

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
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SoundStart("war3mapImported\\OkitaAlter_6-2.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Cloud_6-1.mp3")
            call Effect("war3mapImported\\OkitaAlterEff4.mdl", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(u), 40, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 40, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, PercentTo255(100 - count * 5))
        endif
        if count == 20 then
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 6, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
        endif
        if count == 20 or count == 120 or count == 220 then
            call SoundStart("war3mapImported\\OkitaAlter_6-1.mp3")
        endif
        if count >= 20 and count <= 320 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), a2)
                call Effect("war3mapImported\\OkitaAlterEff4.mdl", x, y, 100, a2, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, 150, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\effect2.mdl", x, y, 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                call Effect("war3mapImported\\az_pafeathermoon_b.mdl", x, y, 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\jxpx.mdl", x, y, 0, a2, 0, 0, 2, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\az_hitheavy.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif
        if count == 320 then
            call Effect("war3mapImported\\LaxusLighthing.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 330 then
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 350 then
            call SoundStart("war3mapImported\\Cloud_6-3.mp3")
            call Effect("war3mapImported\\OkitaAlterEff4.mdl", GetUnitX(t), GetUnitY(t), 100, GetUnitFacing(u) + 70, 0, 0, 4, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\SKSKSK2.mdl", GetUnitX(t), GetUnitY(t), 100, GetUnitFacing(u), 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_2_2_2.mdl", GetUnitX(t), GetUnitY(t), 0, GetUnitFacing(u), 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count >= 340 and count <= 360 then
            set x = PolarX(GetUnitX(u), 30, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 30, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 360 then
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
        local real a2
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SoundStart("war3mapImported\\Hyde_3-3.mp3")
            call SoundStart("war3mapImported\\Cloud_6-1.mp3")
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 10, a)
                set y = PolarY(GetUnitY(u), dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 20 then
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 5, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 5, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 20 or count == 25 or count == 30 or count == 35 then
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 20 and count <= 40 then
            set x = PolarX(GetUnitX(t), 15, a)
            set y = PolarY(GetUnitY(t), 15, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\SojiAlter_4-2.mp3")
        endif
        if count == 40 or count == 55 or count == 70 then
            call SoundStart("war3mapImported\\OkitaAlter_1-1.mp3")
            call SetUnitAnimation(u, "attack")
            call Effect("war3mapImported\\eslash2.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, - 90, 3, 1, 255, 50, 50, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\TZJQ5.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 2, 1, 255, 50, 50, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count >= 40 and count <= 50 or count >= 55 and count <= 65 or count >= 70 and count <= 80 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), dist / 10, a)
            set y = PolarY(GetEffectY(e), dist / 10, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            set e = LoadEffectHandle(ht, zid, 101)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\AFBRedCharge.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\cf2.mdl", x, y, 0, a, 0, 0, 0.75, 1, 225, 50, 50, 255)
                call Effect("war3mapImported\\dc-slashslam.mdl", x, y, 0, a, 0, 0, 1, 1, 250, 40, 40, 255)
            endif
        endif
        if count == 50 or count == 65 or count == 80 then
            call SoundStart("war3mapImported\\Cloud_6-3.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            set x = PolarX(GetUnitX(t), 100, a)
            set y = PolarY(GetUnitY(t), 100, a)
            call SetUnitXY(t, x, y, 2)
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\bloodslash.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 5, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 85 then
            call SoundStart("war3mapImported\\Fujiren_2.mp3")
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a + 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_1_1.mdl", GetUnitX(u), GetUnitY(u), 0, a - 30, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 90 and count <= 110 then
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
        if count == 110 then
            call SoundStart("war3mapImported\\OkitaAlter_1-1.mp3")
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\bloodslash.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFBRedCharge.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 4, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 4, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), GetRandomReal(- 60, - 40), 0, 4, 1, 255, 20, 20, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 120 then
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

        if abilId == 'A04R' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A04S' then
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

        if abilId == 'A0CS' then
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

        if abilId == 'A04T' then
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

        if abilId == 'A04U' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), -1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A04V' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), -1, GetUnitState(t, UNIT_STATE_LIFE))
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A04W' then
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