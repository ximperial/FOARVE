scope alphaspell initializer init
   
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
        if count == 1 then
            call SoundStart("war3mapImported\\Alpha_1.mp3")
            call SoundStart("war3mapImported\\AlphaSE1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing2hotei.mdl", x , y , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 5 then
            call SoundStart("war3mapImported\\AlphaSE2.mp3")
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing2hotei.mdl", x , y , 100, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroAgi(u, true) + 90 * GetUnitAbilityLevel(u, 'A052'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\tx-smoke1.mdl", x, y, 0, a , 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\glchj.mdl", x, y, 0, a , 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", x, y, 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                if GetRandomInt(1, 2) == 1 then
                    set x = PolarX(GetUnitX(u) , 200, a + 70)
                    set y = PolarY(GetUnitY(u) , 200, a + 70)
                    call Effect("war3mapImported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei.mdl", x, y, 0, randomAngle() , 0 , 0, 1, 1, 255, 255, 255, 255)
                else
                    set x = PolarX(GetUnitX(u) , 200, a - 70)
                    set y = PolarY(GetUnitY(u) , 200, a - 70)
                    call Effect("war3mapImported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei-red.mdl", x, y, 0, randomAngle() , 0 , 0, 1, 1, 255, 255, 255, 255)
                endif
            endif
            if GetRandomInt(1, 2) == 1 then
                call Effect("war3mapImported\\DGDDXZ4.mdl", x, y, 100, randomAngle() , GetRandomReal(-40, -20) , 0, 0.75, 1, 70, 70, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            else
                call Effect("war3mapImported\\DGDDXZ4.mdl", x, y, 100, randomAngle() , GetRandomReal(-40, -20) , 0, 0.75, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Alpha_1-1.mp3")
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
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x 
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Satomi_4.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 0.9)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Alpha_2.mp3")
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\punchshot.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 0.75, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 20 or count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            if GetRandomInt(1, 2) == 1 then
                call SetUnitAnimationByIndex(u, 6)
            else
                call SetUnitAnimationByIndex(u, 5)
            endif
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\VergilSlashesWhite.mdl", GetUnitX(u) , GetUnitY(u) , 150, a , 0 , 0, 7, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\Light_Hit-Red.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\AlphaSE3.mp3")
        endif
        if count == 55 then
            call SoundStart("war3mapImported\\AlphaSE4.mp3")
        endif
        if count == 75 then
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei-red.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0 , 0, 1.25, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 20 and count <= 95 then
            set x = PolarX(GetUnitX(t) , 900 / 75, a)
            set y = PolarY(GetUnitY(t) , 900 / 75, a)
            call SetUnitXY(t, x, y, 2)
            if count >= 75 then
                set dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
                if dist > 140 then
                    set x = PolarX(GetUnitX(u) , dist / 5, a)
                    set y = PolarY(GetUnitY(u) , dist / 5, a)
                    call SetUnitXY(u, x, y, 0)
                else
                    set x = PolarX(GetUnitX(t) , -120, a)
                    set y = PolarY(GetUnitY(t) , -120, a)
                    call SetUnitXY(u, x, y, 0)
                endif
                if count > 85 then
                    call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
                else
                    call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 20, 0)
                endif
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 1, 1, 216, 66, 66, PercentTo255(60))
                call Effect("war3mapImported\\hakensaber2.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , 0, 0, 1.5, 1, 216, 66, 66, PercentTo255(40))
            endif
        endif
        if count == 85 then
            call SoundStart("war3mapImported\\AlphaSE5.mp3")
        endif
        if count == 95 then
            call SoundStart("war3mapImported\\AlphaSE6.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.25, 1.5, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.75, 0.4)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 105 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A053')) * GetHeroAgi(u, true))
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
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x 
        local real y 
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alpha_3.mp3")
            set x = PolarX(GetUnitX(t) , -600, a)
            set y = PolarY(GetUnitY(t) , -600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.85)
        endif
        if count == 10 or count == 25 or count == 40 or count == 55 or count == 70 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SoundStart("war3mapImported\\AlphaSE7.mp3")
            set i = 1
            loop
                exitwhen i > 2
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\DGDDXZ4.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , GetRandomReal(-40, -20) , 0, 0.75, 1, 70, 70, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                else
                    call Effect("war3mapImported\\DGDDXZ4.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , GetRandomReal(-40, -20) , 0, 0.75, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                endif
                set i = i + 1
            endloop
        endif
        if count == 10 then
            call Effect("war3mapImported\\AlphaEff1-red.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 10 and count <= 40 then 
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
        endif
        if count == 25 then
            call Effect("war3mapImported\\AlphaEff1.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 25 and count <= 55 then 
            set e = LoadEffectHandle(ht, zid, 101)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
        endif
        if count == 40 then
            call Effect("war3mapImported\\AlphaEff1-red.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapImported\\AlphaEff1-red.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 90, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 51, 46, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 40 and count <= 70 then 
            set e = LoadEffectHandle(ht, zid, 102)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
            set e = LoadEffectHandle(ht, zid, 103)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
        endif
        if count == 55 then
            call Effect("war3mapImported\\AlphaEff1.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
            call Effect("war3mapImported\\AlphaEff1.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 90, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 105, bj_lastCreatedEffect)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 55 and count <= 85 then 
            set e = LoadEffectHandle(ht, zid, 104)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
            set e = LoadEffectHandle(ht, zid, 105)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
        endif
        if count == 70 then
            call Effect("war3mapImported\\AlphaEff1.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 0, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 106, bj_lastCreatedEffect)
            call Effect("war3mapImported\\AlphaEff1-red.mdl", GetUnitX(u) , GetUnitY(u) , 200, a , 0 , 90, 1.5, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 107, bj_lastCreatedEffect)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 51, 46, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 51, 46, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count >= 70 and count <= 100 then 
            set e = LoadEffectHandle(ht, zid, 106)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
            set e = LoadEffectHandle(ht, zid, 107)
            set x = PolarX(GetEffectX(e) , 40, a)
            set y = PolarY(GetEffectY(e) , 40, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 200)
        endif
        if count == 85 then
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 216, 66, 66, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 3, 1.5, 51, 46, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\AlphaSE7.mp3")
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing2hotei.mdl", x , y , 100, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 100 and count <= 120 then
            set x = PolarX(GetUnitX(u) , 50, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 50, GetUnitFacing(u))
            if count > 110 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 110 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.5, 0.4)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.75, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 6, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\AlphaSE6.mp3")
        endif
        if count == 130 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A054')) * GetHeroAgi(u, true))
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
        set e = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a2
        local real x 
        local real y 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alpha_4.mp3")
            call SoundStart("war3mapImported\\AlphaSE8.mp3")
            set x = PolarX(GetUnitX(t) , - 600, a)
            set y = PolarY(GetUnitY(t) , - 600, a)
            call SetUnitXY(u, x, y, 0)
            set x = PolarX(GetUnitX(t) , -400, a)
            set y = PolarY(GetUnitY(t) , -400, a)
            call Effect("war3mapImported\\AlphaEff2.mdl", x , y , 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
            call Effect("war3mapImported\\BY_Wood_Effect_YuBanMeiQin_Lightning_LuoLei-red.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0 , 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 10 then
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\AlphaSE9.mp3")
            set x = PolarX(GetUnitX(t) , 400, a)
            set y = PolarY(GetUnitY(t) , 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 1.75)
            set a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
            call SetUnitFacing(u, a)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call Effect("war3mapImported\\AlphaEff3.mdl", GetUnitX(t) , GetUnitY(t) , 100, a + 90 , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.45)
            call Effect("war3mapImported\\DTJJ.mdl", GetUnitX(t) , GetUnitY(t) , 50, a + 90 , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\AlphaSE6.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 7, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\OkitaAlterEff1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 70 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A056')) * GetHeroAgi(u, true))
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
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
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
            call SoundStart("war3mapImported\\Alpha_5.mp3")
            call ShakeCamera(3, GetOwningPlayer(u) , 5)
            call ShakeCamera(3, GetOwningPlayer(t) , 5)
            set x = PolarX(GetUnitX(t) , -600, a)
            set y = PolarY(GetUnitY(t) , -600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 16)
            call SetUnitTimeScale(u, 0.75)
            call Effect("war3mapImported\\AlphaEff4.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 3.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 3.5, 255, 255, 255, 0)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
        endif
        if count == 10 or count == 40 or count == 70 or count == 100 or count == 130 then
            call SoundStart("war3mapImported\\AlphaSE2.mp3")
        endif
        if count <= 150 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 2 / 150)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAlpha(e, PercentTo255(count * 0.4))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , 0, 0, 4, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 0.75))
                set x = PolarX(GetUnitX(u) , GetRandomReal(-400, 400) , randomAngle())
                set y = PolarY(GetUnitY(u) , GetRandomReal(-400, 400) , randomAngle())
                call Effect("war3mapImported\\az-leiji.mdl", x , y , 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                set x = PolarX(GetUnitX(u) , GetRandomReal(-400, 400) , randomAngle())
                set y = PolarY(GetUnitY(u) , GetRandomReal(-400, 400) , randomAngle())
                call Effect("war3mapImported\\az-leiji.mdl", x , y , 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count == 160 then
            call SoundStart("war3mapImported\\AlphaSE7.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 1.25)
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing2hotei.mdl", x , y , 100, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count >= 160 and count <= 180 then
            set x = PolarX(GetUnitX(u) , 50, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 50, GetUnitFacing(u))
            if count > 170 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 170 then
            call SoundStart("war3mapImported\\AlphaSE10.mp3")
            call Effect("war3mapImported\\AlphaEff3.mdl", GetUnitX(t) , GetUnitY(t) , 100, GetUnitFacing(u) + 60 , 0, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\DTJJ.mdl", GetUnitX(t) , GetUnitY(t) , 50, GetUnitFacing(u) + 60 , 0, 0, 1.25, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.5)
        endif
        if count == 190 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 7, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\OkitaAlterEff1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\zxd6.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 210 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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
        set e = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a2
        local real x
        local real y
        local real h
        local real x2 
        local real y2
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Alpha_6.mp3")
            call SoundStart("war3mapImported\\AlphaSE11.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call ShakeCamera(1, GetOwningPlayer(t) , 5)
            set x = PolarX(GetUnitX(t) , -600, a)
            set y = PolarY(GetUnitY(t) , -600, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 10)
            call SetUnitTimeScale(u, 2)
            call SaveReal(ht, zid, 0, GetUnitX(u))
            call SaveReal(ht, zid, 1, GetUnitY(u))
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LeiJiZhiQing2hotei.mdl", x , y , 100, a, 0, 0, 1.25, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(u) , 1000 / 20, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 1000 / 20, GetUnitFacing(u))
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\AlphaSE12.mp3")
            call ShakeCamera(3, GetOwningPlayer(u) , 10)
            call ShakeCamera(3, GetOwningPlayer(t) , 10)
            call SaveReal(ht, zid, 2, 20)
        endif
        if count >= 20 and count <= 70 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = LoadReal(ht, zid, 0)
                set y = LoadReal(ht, zid, 1)
                set x2 = PolarX(x, 20 * (count - 20) , GetUnitFacing(u))
                set y2 = PolarY(y, 20 * (count - 20) , GetUnitFacing(u))
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\DGDDXZ4.mdl", x2, y2, 150, randomAngle() , GetRandomReal(-40, -20) , 0, 0.85, 1.5, 70, 70, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.75))
                else
                    call Effect("war3mapImported\\DGDDXZ4.mdl", x2, y2, 150, randomAngle() , GetRandomReal(-40, -20) , 0, 0.85, 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.75))
                endif
                call Effect("war3mapImported\\BY_Wood_ThundergodWrath_2_2.mdl", x2 , y2 , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                set a2 = LoadReal(ht, zid, 2)
                set x2 = PolarX(x, 25 * (count - 20) , GetUnitFacing(u) + a2)
                set y2 = PolarY(y, 25 * (count - 20) , GetUnitFacing(u) + a2)
                if GetRandomInt(1, 2) == 1 then
                    call Effect("war3mapImported\\Hotei_Effect_blink.mdl", x2 , y2 , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                else
                    call Effect("war3mapImported\\BY_Wood_BlinkDagger_2.mdl", x2 , y2 , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                endif
                call SaveReal(ht, zid, 2, -LoadReal(ht, zid, 2))
            endif
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\AlphaSE13.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 0.75)
            call SetUnitFacing(u, a)
        endif
        if count == 120 then
            call Effect("war3mapImported\\blackblink1.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 25)
            call SetUnitTimeScale(u, 1.25)
            call SetUnitXY(u, GetUnitX(t) , GetUnitY(t) , 0)
            call SetUnitFlyHeight(u, 700, 0)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, 0)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 140 and count <= 160 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 70, 0)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAlpha(e, PercentTo255((count - 140) * 3.5))
        endif
        if count == 160 then
            call ShakeCamera(2, GetOwningPlayer(u) , 15)
            call ShakeCamera(2, GetOwningPlayer(t) , 15)
            call SetUnitFlyHeight(u, 0, 0)
        endif
        if count == 160 or count == 170 or count == 180 then
            call Effect("war3mapImported\\BY_Wood_ThundergodWrath_2_2.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LuoLei2hotei.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\OkitaAlterEff1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\AlphaEff5.mdl", GetUnitX(t) , GetUnitY(t) , 10, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\ltccc5.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltccc5red.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 200 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
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
        set e = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
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
            call SoundStart("war3mapImported\\AlphaSE15.mp3")
            call ShakeCamera(3, GetOwningPlayer(u) , 5)
            call ShakeCamera(3, GetOwningPlayer(t) , 5)
            set x = PolarX(GetUnitX(t) , -400, a)
            set y = PolarY(GetUnitY(t) , -400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 19)
            call SetUnitTimeScale(u, 1.25)
            call Effect("war3mapImported\\AlphaEff4.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 5, 255, 255, 255, 0)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call SaveReal(ht, zid, 0, a)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Alpha_7.mp3")
            call SetUnitAnimationByIndex(u, 20)
            call SetUnitTimeScale(u, 1)
        endif
        if count <= 150 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 2 / 150)
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAlpha(e, PercentTo255(count * 0.4))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\windcirclefaster.mdl", GetUnitX(u) , GetUnitY(u) , 100, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                set x = PolarX(GetUnitX(u) , GetRandomReal(-500, 500) , randomAngle())
                set y = PolarY(GetUnitY(u) , GetRandomReal(-500, 500) , randomAngle())
                call Effect("war3mapImported\\az-leiji.mdl", x , y , 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", x , y , 150, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                set x = PolarX(GetUnitX(u) , GetRandomReal(-500, 500) , randomAngle())
                set y = PolarY(GetUnitY(u) , GetRandomReal(-500, 500) , randomAngle())
                call Effect("war3mapImported\\az-leiji.mdl", x , y , 0, randomAngle() , 0, 0, 1, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
                call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", x , y , 150, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 1))
            endif
        endif
        if count >= 150 and count <= 180 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\VergilSlashesWhite.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , GetRandomReal(-40, -20) , 0, 7, 1.5, 51, 46, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\VergilSlashesWhite.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , GetRandomReal(-40, -20) , 0, 7, 1.5, 216, 66, 66, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 2, 1.5, 51, 46, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\slashcritlow-white.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 2, 1.5, 216, 66, 66, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\Light_Hit-Red.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            endif
        endif
        if count == 160 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            call Effect("war3mapImported\\AlphaEff6.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, 255)
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.6)
        endif
        if count >= 160 and count <= 170 then
            set a = LoadReal(ht, zid, 0) - 18
            set x = PolarX(GetUnitX(t) , 400, a)
            set y = PolarY(GetUnitY(t) , 400, a)
            call SetUnitXY(u, x, y, 0)
            call SaveReal(ht, zid, 0, a)
        endif
        if count == 180 then
            call ShakeCamera(2, GetOwningPlayer(u) , 20)
            call ShakeCamera(2, GetOwningPlayer(t) , 20)
        endif
        if count == 180 or count == 200 or count == 220 or count == 240 then
            call Effect("war3mapImported\\BY_Wood_ThundergodWrath_2_2.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\Hotei_Effect_YuBanMeiQin_Lightning_LuoLei2hotei.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\OkitaAlterEff1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_Stf_DaJi_1_3Red.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\AlphaEff5.mdl", GetUnitX(t) , GetUnitY(t) , 10, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\ltccc5.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ltccc5red.mdl", GetUnitX(t) , GetUnitY(t) , 50, randomAngle() , 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 250 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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
        set e = null
    endfunction

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A052' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A053' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A054' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A056' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A057' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A058' then
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

        if abilId == 'A059' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
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