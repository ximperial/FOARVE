scope kidospell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 15 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 14)
            call Effect("", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0JJ'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\PinoEffect1.mdx", x, y, 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\tx-smoke1.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call EnableAbilityEx(u, 'A0JM', false)
            call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 1)
            if GetUnitAbility(u, 'A0JM') != null then
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 0, 2)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 1, 2)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 2, 2)
            endif
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
        endif
        if count == 165 or (count >= 15 and LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 0) then
            if LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 1 then
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0) 
                call DisableAbilityEx(u, 'A0JM', false)
            endif
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 110 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_2.mp3") 
            call Effect("war3mapimported\\DTJJ.mdx", GetUnitX(u) , GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.5) 
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
        endif
        if count == 15 then
            call Effect("war3mapImported\\bossbirth.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255) 
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255) 
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.3)
        endif
        if count == 20 then
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Hyde_2-2.mp3")
            call SoundStart("war3mapImported\\Hyde_2-3.mp3")
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count == 35 or count == 60 or count == 80 then
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 7, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 45 or count == 70 or count == 90 then
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 7, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\bloodslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1.7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85) 
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Hyde_2-4.mp3")
            call SoundStart("war3mapImported\\Hyde_2-5.mp3")
            call SetUnitAnimationByIndex(u, 13)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Hyde_2-6.mp3") 
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1)
        endif
        if count <= 90 then
            if dist >= 140 then
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
            endif
        endif
        if count >= 90 and count <= 110 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0) 
        endif
        if count == 110 then 
            call SetUnitFlyHeight(u, 0, 400 / 0.4)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call EnableAbilityEx(u, 'A0JM', false)
            call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 2)
            call SaveUnitHandle(ht, StringHash("HydeSkill"), GetHandleId(u), t)
            if GetUnitAbility(u, 'A0JM') != null then
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 0, 0)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 1, 0)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 2, 0)
            endif
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0JK')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif 
        if count == 260 or (count >= 110 and LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 0) then
            if LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 2 then 
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0) 
                call DisableAbilityEx(u, 'A0JM', false)
            endif
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
        if count <= 60 then
            call PauseUnit(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(u, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_3.mp3") 
            call SoundStart("war3mapImported\\Hyde_3-1.mp3")
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 8) 
            call SetUnitFacingEx(u, a, true)
        endif
        if count <= 30 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Knife1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Knife2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 35 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 22)
            call SetUnitTimeScale(u, 1.3)
        endif
        if count == 45 then
            call SoundStart("war3mapImported\\Hyde_3-2.mp3") 
            call SoundStart("war3mapImported\\Hyde_3-3.mp3")
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count >= 45 and count <= 60 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 30, 0)
        endif
        if count == 60 then
            call SetUnitFlyHeight(t, 0, 450 / 0.6)
            call Effect("war3mapImported\\UwU.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call EnableAbilityEx(u, 'A0JM', false)
            call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 3)
            call SaveUnitHandle(ht, StringHash("HydeSkill"), GetHandleId(u), t)
            if GetUnitAbility(u, 'A0JM') != null then
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 0, 0)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 1, 0)
                call SetAbilityIntegerLevelField(GetUnitAbility(u, 'A0JM'), ABILITY_ILF_TARGET_TYPE, 2, 0)
            endif
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0JL')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count == 220 or (count >= 60 and LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 0) then
            if LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 3 then 
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0) 
                call DisableAbilityEx(u, 'A0JM', false)
            endif
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
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_4.mp3")
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 1.2)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(u), 65, a)
            set y = PolarY(GetUnitY(u), 65, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (2.5 + 0.5 * GetUnitAbilityLevel(u, 'A0JM')) * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z) , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                set x = PolarX(GetUnitX(u) , - 50, a)
                set y = PolarY(GetUnitY(u) , - 50, a)
                call Effect("war3mapImported\\PinoEffect2.mdx", x, y, 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
                call TimeScaleEffect(bj_lastCreatedEffect, 0.1, 0.3)
                call Effect("war3mapImported\\MomijiThunder_red.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.3)
            endif 
        endif
        if count == 20 then
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
 
    private function period4_1 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Hyde_4-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 0)
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 10 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 13)
            call SetUnitTimeScale(u, 1.2)
            call SoundStart("war3mapImported\\Hyde_2-3.mp3")
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 7.25, 1, 255, 255, 255, 255)
        endif
        if count == 25 or count == 55 or count == 75 then
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, GetRandomInt(13, 14))
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Hyde_4-2.mp3")
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\bloodslash.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Hyde_4-3.mp3")
            call SoundStart("war3mapImported\\Hyde_2-3.mp3")
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), a, 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\bloodslash.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 100 then
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            if count <= 40 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 10, 0)
            endif
            if count >= 80 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 15, 0)
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 105 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2.5 + 0.5 * GetUnitAbilityLevel(u, 'A0JM')) * GetHeroAgi(u, true))
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
        if count <= 50 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_4-4.mp3")
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 0)
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapimported\\bossbirth.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
        endif
        if count == 10 then
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255) 
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 1.3)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Hyde_2-3.mp3") 
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
        endif
        if count == 15 or count == 25 then
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
        endif
        if count == 20 or count == 30 then
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\bloodslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
        endif 
        if count <= 30 then
            if dist >= 140 then
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
        if count >= 30 and count <= 50 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0) 
        endif
        if count == 50 then 
            call SetUnitFlyHeight(u, 0, 400 / 0.4)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2.5 + 0.5 * GetUnitAbilityLevel(u, 'A0JM')) * GetHeroAgi(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
 
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_5.mp3")
            call SoundStart("war3mapImported\\Hyde_5-1.mp3") 
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\UwU2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.4, 2, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 21)
        endif
        if count == 40 then
            call Effect("war3mapImported\\UwU5.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Hyde_5-2.mp3") 
            call SoundStart("war3mapImported\\Hyde_5-3.mp3")
            call SetUnitAnimationByIndex(u, 22)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 15 * GetHeroAgi(u, true))
                    call knockupUnit(gUnit, 1.4, 1000)
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 60 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
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
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real a2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_3-3.mp3")
            call SoundStart("war3mapImported\\Hyde_5-4.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 15)
            call SaveReal(ht, zid, 0, a)
        endif
        if count == 5 then
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call ShakeCamera(0.5, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Hit_DaJi_Add.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Hit.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 10 and count <= 50 then
            set a = LoadReal(ht, zid, 0)
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.25, 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.25))
            endif
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Hyde_5-5.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
        endif
        if count == 25 or count == 45 or count == 65 or count == 85 or count == 100 or count == 120 then
            call SetUnitAnimationByIndex(u, GetRandomInt(13, 14))
        endif
        if count == 30 or count == 40 or count == 85 or count == 100 then
            call SoundStart("war3mapImported\\Hyde_2-5.mp3")
        endif
        if count == 30 or count == 50 or count == 70 then
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 6, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 50 or count == 125 then
            call SoundStart("war3mapImported\\Hyde_2-1.mp3")
        endif
        if count == 35 or count == 45 or count == 55 or count == 65 then
            call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 6, 1.5, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 50, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 50, GetUnitFacing(u))
            call Effect("war3mapImported\\bloodslash.mdx", x, y, 100, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 60 or count == 90 or count == 120 then
            call SoundStart("war3mapImported\\Hyde_2-3.mp3")
        endif
        if count >= 20 and count <= 70 then
            set x = PolarX(GetUnitX(u), 20, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u), 20, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 70 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 75 then
            call SoundStart("war3mapImported\\Hyde_5-6.mp3")
            call ShakeCamera(2, GetOwningPlayer(u), 15)
            call ShakeCamera(2, GetOwningPlayer(t), 15)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
            call SaveReal(ht, zid, 0, GetUnitX(t))
            call SaveReal(ht, zid, 1, GetUnitY(t))
        endif
        if count == 85 or count == 95 or count == 105 or count == 120 or count == 130 then
            set x = LoadReal(ht, zid, 0)
            set y = LoadReal(ht, zid, 1)
            set a2 = randomAngle()
            set x = PolarX(x, GetRandomReal(- 500, 500), a2)
            set y = PolarY(y, GetRandomReal(- 500, 500), a2)
            call SetUnitXY(t, x, y, 1)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            if GetRandomInt(1, 2) == 1 then
                call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 6, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_3_0.5s.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 40, 0, 1.25, 1.5, 233, 80, 80, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            else
                call Effect("war3mapImported\\Knife2.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 6, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_3_0.5s.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), - 60, 0, 1.25, 1.5, 233, 80, 80, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            endif
            call Effect("war3mapImported\\DustWindFasterExact.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\bloodslash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 125 then
            call SoundStart("war3mapImported\\Hyde_5-7.mp3")
        endif
        if count >= 135 and count <= 155 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0) 
        endif
        if count == 155 then 
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 160 then
            call SoundStart("war3mapImported\\Ryuzaki_5.mp3")
            call SoundStart("war3mapImported\\Hyde_5-8.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapimported\\shanguangbiubiu.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 4, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 175 then
            call SaveInteger(ht, zid, 100, GetRandomInt(1, 2))
            if LoadInteger(ht, zid, 100 ) == 1 then
                call SoundStart("war3mapImported\\Hyde_5-9.mp3")
            else
                call SoundStart("war3mapImported\\Hyde_5-11.mp3")
            endif
            call Effect("war3mapImported\\UwU2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 185 then
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 200 then
            if LoadInteger(ht, zid, 100 ) == 1 then
                call SoundStart("war3mapImported\\Hyde_5-10.mp3")
            else
                call SoundStart("war3mapImported\\Hyde_5-12.mp3")
            endif
        endif
        if count == 205 then
            call SoundStart("war3mapImported\\Hyde_5-3.mp3")
            call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[Plagiat]Effect43.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 210 then
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

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_6.mp3")
            call SoundStart("war3mapImported\\Hyde_6-1.mp3")
            call SetUnitXY(u, x, y, 1)
            call SetUnitAnimationByIndex(u, 21)
        endif
        if count == 5 then
            call Effect("war3mapImported\\az_coco_t2.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Hyde_6-2.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.8)
        endif
        if count <= 80 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\model (349).mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            endif
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    set a = Angle(GetUnitX(gUnit), GetUnitY(gUnit), GetUnitX(u), GetUnitY(u))
                    if Distance(GetUnitX(gUnit), GetUnitY(gUnit), GetUnitX(u), GetUnitY(u)) > 160 then 
                        set x = PolarX(GetUnitX(gUnit), 5, a)
                        set y = PolarY(GetUnitY(gUnit), 5, a)
                        call SetUnitPosition(gUnit, x, y) 
                    else
                        set x = PolarX(GetUnitX(u), - 140, a)
                        set y = PolarY(GetUnitY(u), - 140, a)
                        call SetUnitPosition(gUnit, x, y)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 85 then
            call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\[Plagiat]Effect43.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 100, GetUnitFacing(u), 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Knife1.mdx", GetUnitX(u), GetUnitY(u), 100, GetUnitFacing(u) + 180, 0, 0, 10, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 650, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 11 * GetHeroAgi(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 90 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction
 
    private function period8 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hyde_7.mp3")
            call SoundStart("war3mapImported\\Hyde_5.mp3")
            call SoundStart("war3mapImported\\Hyde_7-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\[DoFT]DevilSlamAddetivRed.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 14)
            call Effect("", GetUnitX(u), GetUnitY(u ), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call DamageUnit(u, gUnit, 8 * GetHeroAgi(u, true))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\by_wood_effect_d2_shadowfiend_shadowraze_1.mdx", x, y, 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A0JJ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif
        
        if abilId == 'A0JK' then
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
        
        if abilId == 'A0JL' then
            if t != null then
                set z = CreateTimer()
                call PauseUnit(u, true)
                call SetUnitInvulnerable(u, true)
                call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                call SaveInteger(ht, GetHandleId(z), 0, 0)
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call TimerStart(z, 0.02, true, function period3)
            else
                call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetUnitXY(u, x, y, 1)
                call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
      
        if abilId == 'A0JM' then
            if LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 1 then
                set z = CreateTimer()
                call DisableAbilityEx(u, abilId, false)
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0)
                call SetAbilityIntegerLevelField(GetSpellAbility(), ABILITY_ILF_TARGET_TYPE, 0, 0)
                call SetAbilityIntegerLevelField(GetSpellAbility(), ABILITY_ILF_TARGET_TYPE, 1, 0)
                call SetAbilityIntegerLevelField(GetSpellAbility(), ABILITY_ILF_TARGET_TYPE, 2, 0)
                call PauseUnit(u, true)
                call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                call SaveInteger(ht, GetHandleId(z), 0, 0)
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call SaveReal(ht, GetHandleId(z), 0, a)
                call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
                call TimerStart(z, 0.02, true, function period4)
            elseif LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 2 then
                set t = LoadUnitHandle(ht, StringHash("HydeSkill"), GetHandleId(u))
                call DisableAbilityEx(u, abilId, false)
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0)
                if FilterGeneral(u, t) then
                    set z = CreateTimer()
                    call PauseUnit(u, true)
                    call SetUnitInvulnerable(u, true)
                    call PauseUnit(t, true)
                    call SetUnitInvulnerable(t, true)
                    call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                    call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                    call SaveInteger(ht, GetHandleId(z), 0, 0)
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call TimerStart(z, 0.02, true, function period4_1)
                else
                    call SetUnitCurrentMana(u, GetUnitCurrentMana(u) + 25 * GetUnitAbilityLevel(u, abilId))
                endif
            elseif LoadInteger(ht, StringHash("HydeSkill"), GetHandleId(u)) == 3 then
                set t = LoadUnitHandle(ht, StringHash("HydeSkill"), GetHandleId(u))
                call DisableAbilityEx(u, abilId, false)
                call SaveInteger(ht, StringHash("HydeSkill"), GetHandleId(u), 0)
                if FilterGeneral(u, t) then
                    set z = CreateTimer()
                    call PauseUnit(u, true)
                    call SetUnitInvulnerable(u, true)
                    call PauseUnit(t, true)
                    call SetUnitInvulnerable(t, true)
                    call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                    call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                    call SaveInteger(ht, GetHandleId(z), 0, 0)
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call TimerStart(z, 0.02, true, function period4_2)
                else
                    call SetUnitCurrentMana(u, GetUnitCurrentMana(u) + 25 * GetUnitAbilityLevel(u, abilId))
                endif
            endif
        endif
        
        if abilId == 'A0JN' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if t != null then
                call PauseUnit(t, true)
                call SetUnitInvulnerable(t, true)
                call SaveUnitHandle(ht, GetHandleId(z), 1, t)
                call TimerStart(z, 0.02, true, function period6)
            else
                call SaveReal(ht, GetHandleId(z), 0, x)
                call SaveReal(ht, GetHandleId(z), 1, y)
                call TimerStart(z, 0.02, true, function period5)
            endif
        endif

        if abilId == 'A0JO' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period7)
        endif
    
        if abilId == 'A0JP' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period8)
        endif

        set z = null
        set u = null
        set t = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope