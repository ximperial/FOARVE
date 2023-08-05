scope Allmightspell initializer init 

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0) + 1
        local integer iterator = LoadInteger(ht, zid, 1)

        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Allmight_1.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Allmight_1-1.mp3")
            call ShakeCamera(0.5, GetOwningPlayer(u), 10)
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\earthdetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0J0'))
                endif
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Allmight_2.mp3")
            call SetUnitAnimationByIndex(u, 13)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 5 or count == 15 or count == 25 then
            call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
        endif
        if count <= 30 then
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
        if count == 35 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call Effect("war3mapImported\\[Plagiat]Effect249.mdx", GetUnitX(t), GetUnitY(t), 100, a + 180, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]cherry blossom impact.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\[A]sandpoff123.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
        endif
        if count == 40 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0J1')) * GetHeroStr(u, true))
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
            call SoundStart("war3mapImported\\Allmight_3.mp3") 
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 1.1) 
            call SaveReal(ht, zid, 100, a) 
        endif
        if count >= 10 and count <= 50 then
            if count <= 30 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 15, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 15, 0)
            endif
            set a = LoadReal(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 5, a)
            set y = PolarY(GetUnitY(t), - 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.25, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SBXZAFB2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call Effect("war3mapImported\\[A]Sand3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 60 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0J2')) * GetHeroStr(u, true))
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Allmight_4.mp3") 
            call ShakeCamera(4, GetOwningPlayer(u), 10)
            call ShakeCamera(4, GetOwningPlayer(t), 10)
            set x = PolarX(GetUnitX(t), - 120, a) 
            set y = PolarY(GetUnitY(t), - 120, a) 
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.5)  
            call Effect("war3mapImported\\Tornado vino.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 4, 255, 255, 255, 255) 
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 40 then
            call SetUnitTimeScale(u, 0)
        endif
        if count <= 200 then 
            set x = PolarX(GetUnitX(t), 4, a)
            set y = PolarY(GetUnitY(t), 4, a)
            call SetUnitXY(t, x, y, 2) 
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            set e = LoadEffectHandle(ht, zid, 100)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\wind2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(2.5, 3.5), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255) 
            endif
        endif
        if count == 185 then
            call SetUnitTimeScale(u, 1.3)
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count >= 185 and count <= 205 then
            if count <= 195 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
            endif
        endif
        if count == 205 then
            call SoundStart("war3mapImported\\Allmight_4-1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 15)
            call ShakeCamera(1, GetOwningPlayer(t), 15)
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.25, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapimported\\Dls1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapimported\\SZBYAFB2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 210 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0J3')) * GetHeroStr(u, true))
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 975 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Allmight_5.mp3") 
            call SoundStart("war3mapImported\\Allmight_5-1.mp3") 
            call SoundStart("war3mapImported\\Allmight_5-2.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\DLS1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count <= 95 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Allmight_5-2.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\DLS1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 100 and count <= 180 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 190 then
            call SoundStart("war3mapImported\\Allmight_5-2.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\DLS1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 240 then
            call SoundStart("war3mapImported\\Allmight_5-3.mp3")
        endif
        if count >= 250 and count <= 300 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 390 then
            call SoundStart("war3mapImported\\Allmight_5-2.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\DLS1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\punchshot.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 425 then
            call SoundStart("war3mapImported\\Allmight_5-4.mp3")
        endif
        if count >= 425 and count <= 925 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.5), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1.3, 2.4), 1.5, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
                call Effect("war3mapImported\\AgusWind.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(2, 3.5), 1, 255, 255, 255, 255)
                call Effect("war3mapimported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.8, 1.5), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 925 then
            call SoundStart("war3mapImported\\Allmight_5-5.mp3")
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf') 
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapimported\\SuperBigExplosion2.mdx", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\Tornado vino.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count >= 930 and count <= 990 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set e = LoadEffectHandle(ht, zid, 101)
            set x = GetUnitX(t)
            set y = GetUnitY(t)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.05)
            if count <= 970 then
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 40, 0)  
            else
                call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 80, 0) 
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Wid_KuoSan_2.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, GetRandomReal(0.6, 1), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 975 then
            call SoundStart("war3mapImported\\Allmight_5-6.mp3")
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
        endif
        if count == 990 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapimported\\zxd1.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SoundStart("war3mapImported\\Allmight_5-7.mp3")
        endif
        if count == 1190 then
            call SoundStart("war3mapImported\\Allmight_5-8.mp3")
        endif
        if count == 1235 then
            call SoundStart("war3mapImported\\Allmight_5-9.mp3")
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
            call SoundStart("war3mapImported\\Allmight_6.mp3")
            call SoundStart("war3mapImported\\Allmight_6-1.mp3")
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count == 510 then
            call SoundStart("war3mapImported\\Allmight_6-2.mp3")
        endif
        if count <= 810 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1.4), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\Dustwavevin.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.85), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "death")
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                if count >= 720 then
                    call Effect("war3mapImported\\[A]supershinythingyGon.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.9, 1.55), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                    call Effect("war3mapImported\\valkdustnew.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 1, 255, 255, 255, 255)
                else
                    call Effect("war3mapImported\\dtkuning.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(1, 1.65), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                endif
            endif
        endif
        if count >= 720 and count <= 810 then
            if dist > 140 then 
                call SetUnitX(u, PolarX(GetUnitX(u), dist / 40, a))
                call SetUnitY(u, PolarY(GetUnitY(u), dist / 40, a))
            else
                call SetUnitX(u, PolarX(GetUnitX(t), - 120, a))
                call SetUnitY(u, PolarY(GetUnitY(t), - 120, a))
            endif 
        endif
        if count == 720 then
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 730 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 780 then
            call SetUnitTimeScale(u, 0.8)
        endif
        if count == 810 then
            call Effect("war3mapimported\\SuperBigExplosion2.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("Abilities\\Spells\\Other\\Doom\\DoomDeath.mdx", GetUnitX(t), GetUnitY(t), 150, a, - 90, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]GonFef.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Natsu ef roar.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 820 then 
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

    private function period7 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Allmight_7.mp3")
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 then
            call Effect("war3mapImported\\SBXZAFB2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\dtkuning.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, GetRandomReal(0.9, 1.25), 1, 255, 255, 255, PercentTo255(60)) 
        endif
        if count == 50 then 
            call SoundStart("war3mapImported\\Allmight_4-1.mp3")
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255) 
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\blackblink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255) 
            call Effect("war3mapImported\\Tornado vino.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
            call Effect("war3mapimported\\XZDL.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9) 
            call Effect("war3mapimported\\az_tormentedsoul_t1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle() , 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 8 * GetHeroStr(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
   
    private function action takes nothing returns nothing
        local timer z 
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()
   
        if abilId == 'A0J0' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif 

        if abilId == 'A0J1' then
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
       
        if abilId == 'A0J2' then
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
       
        if abilId == 'A0J3' then
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

        if abilId == 'A0J4' then
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
       
        if abilId == 'A0J5' then
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
            call TimerStart(z, 0.02, true, function period6)
        endif
       
        if abilId == 'A0J6' then
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

        set z = null
        set u = null
        set t = null
    endfunction
   
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope
