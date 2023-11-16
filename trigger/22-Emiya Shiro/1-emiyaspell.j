scope emiyaspell initializer init

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
            call SoundStart("war3mapImported\\Emiya_1.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 1.35, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 0.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroAgi(u, true) + 90 * GetUnitAbilityLevel(u, 'A0D6'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, 1.25, 1.5, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u) , GetUnitY(u) , 100, a, - 90, 0, 1.5 , 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                call Effect("war3mapImported\\zxd6.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Emiya_2.mp3")
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitTimeScale(u, 2)
        endif
        if count <= 120 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 5 or iterator == 10 then
                if iterator == 10 then
                    call SaveInteger(ht, zid, 1, 0)
                    call SetUnitAnimation(u, "attack")
                endif
                call Effect("war3mapImported\\akiha_claw_blugreen.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , -35, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\akiha_claw_red.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , -35, 0, 1.2, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t) , GetUnitY(t) , 40, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t) , GetUnitY(t) , 150, randomAngle() , - 45, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(t) , GetUnitY(t) , 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, GetRandomReal(3, 5) , 1, GetRandomInt(1, 255) , GetRandomInt(1, 255) , GetRandomInt(1, 255) , PercentTo255(GetRandomReal(40, 80)))
                call Effect("war3mapImported\\EarthSmash.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
            endif
        endif
        if count == 120 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0D7')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local effect e
        local texttag tt

        if count <= 400 then
            set count = count + 1
            call SaveInteger(ht, zid, 0, count)
        else
            if not IsUnitInvulnerable(u) then
                set count = count + 1
                call SaveInteger(ht, zid, 0, count)
            endif
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Emiya_3.mp3")
            call SaveSoundHandle(ht, zid , 10, DummySound)
        endif
        if count <= 400 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 10 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\lb_hdg.mdx", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, PercentTo255(GetRandomReal(80, 100)))
            endif
        endif
        if count == 400 then
            set x = PolarX(GetUnitX(u) , 10, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 10, GetUnitFacing(u))
            call Effect("war3mapimported\\RhoAias.mdx", x, y , 50, GetUnitFacing(u) , 0, 0, 1.5 , 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid , 100, bj_lastCreatedEffect)
            set tt = CreateTextTag()
            call SetTextTagText(tt, "", 0.0253)
            call SetTextTagPos(tt, GetUnitX(u) , GetUnitY(u) , 50)
            call SetTextTagColor(tt, 255, 220, 0, 255)
            call SetTextTagPermanent(tt, false)
            call SaveTextTagHandle(ht, zid , 1000, tt)
            call SaveReal(ht, StringHash("EmiyaE") , GetHandleId(u) , (6 + GetUnitAbilityLevel(u, 'A0D8')) * GetHeroAgi(u, true))
        endif
        if count >= 400 and count <= 650 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(u) , 10, GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , 10, GetUnitFacing(u))
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, GetUnitFlyHeight(u) + 50)
            call SetSpecialEffectOrientation(e, GetUnitFacing(u) , 0, 0) 
            set tt = LoadTextTagHandle(ht, zid, 1000)
            call SetTextTagPos(tt, GetUnitX(u) , GetUnitY(u) , 50)
            call SetTextTagText(tt, "|cff23abbdShield : " + I2S(R2I(LoadReal(ht, StringHash("EmiyaE") , GetHandleId(u)))) , 0.0253)
            call SetTextTagVisibility(tt, IsUnitVisible(u, GetLocalPlayer()))
        endif
        if count == 650 or(count > 400 and LoadReal(ht, StringHash("EmiyaE") , GetHandleId(u)) <= 0) or not IsUnitAlive(u) then
            call RemoveSavedReal(ht, StringHash("EmiyaE") , GetHandleId(u))
            call StopSound(LoadSoundHandle(ht, zid , 10) , true, false)
            call DestroyEffect(e)
            set tt = LoadTextTagHandle(ht, zid, 1000)
            call DestroyTextTag(tt)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
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
            call SoundStart("war3mapImported\\Emiya_4.mp3")
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 10 then
            call SetUnitTimeScale(u, 0)
        endif
        if count <= 40 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(0.65, 2) , 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(1.65, 3) , 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
                call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(2, 4) , 1, GetRandomInt(1, 255) , GetRandomInt(1, 255) , GetRandomInt(1, 255) , PercentTo255(GetRandomReal(40, 80)))
            endif
        endif
        if count == 40 then
            call Effect("war3mapImported\\remiliasq.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 40 and count <= 70 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e) , dist / 30, a)
            set y = PolarY(GetEffectY(e) , dist / 30, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectHeight(e, 50)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\dtred.mdl", GetEffectX(e) , GetEffectY(e) , 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\wind3.mdl", GetEffectX(e) , GetEffectY(e) , 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 70 then 
            call SoundStart("war3mapImported\\Emiya_4-1.mp3")
            call Effect("war3mapImported\\BY_Wood_Effect_Order_MoBai_Dev_BianShen_KuoSan2.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\chushou_by_wood_effect_unusual_kof_caoti_huozhu.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_tormentedsoul_t1.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0D9')) * GetHeroAgi(u, true))
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
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Emiya_5.mp3")
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Emiya_5-1.mp3")
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
        endif
        if count == 100 then
            call SetUnitAnimationByIndex(u, 5)
        endif
        if count >= 20 and count <= 160 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , - 45, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\lb_hdg.mdl", GetUnitX(u) , GetUnitY(u) , 150, a, - 90, 0, GetRandomReal(1, 1.5) , 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\WaveFxVert.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, GetRandomReal(3, 6) , 1, GetRandomInt(1, 255) , GetRandomInt(1, 255) , GetRandomInt(1, 255) , PercentTo255(GetRandomReal(25, 80)))
                if count >= 100 then
                    call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, GetRandomReal(0.65, 1.65) , 1, 255, 255, 255, 255)
                    call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                    call Effect("war3mapImported\\akiha_claw_blugreen.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , - 35, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\akiha_claw_red.mdl", GetUnitX(t) , GetUnitY(t) , 100, randomAngle() , - 35, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\EarthSmash.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, GetRandomReal(1, 2) , 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 160 then
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 3.3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 1.8, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t) , GetUnitY(t) , 0, a, 0, 0, 2.4, 1, 255, 255, 255, 255)
        endif
        if count == 170 then 
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
    endfunction

    private function period6_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 1)
        local group g = LoadGroupHandle(ht, zid, 2)
        local integer count = LoadInteger(ht, zid, 0)
        local real x = PolarX(GetEffectX(e) , 70, GetSpecialEffectYaw(e))
        local real y = PolarY(GetEffectY(e) , 70, GetSpecialEffectYaw(e))
        local integer hit
        local integer pid = GetPlayerId(GetOwningPlayer(u))
        
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 1)
        call SetSpecialEffectHeight(e, GetEffectHeight(e))
        call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
        loop
            set gUnit = GroupForEachUnit(gGroup)
            exitwhen gUnit == null
            if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                set hit = LoadInteger(ht, StringHash("EmiyaF_" + I2S(pid)) , GetHandleId(gUnit))
                if hit < 10 then
                    call Effect("war3mapImported\\BloodEX.mdl", GetUnitX(gUnit) , GetUnitY(gUnit) , 50, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                    call DamageUnit(u, gUnit, 11 * GetHeroAgi(u, true) / 10)
                    call stunUnit(gUnit, 0.1)
                    call GroupAddUnit(g, gUnit)
                    set hit = hit + 1
                    call SaveInteger(ht, StringHash("EmiyaF_" + I2S(pid)) , GetHandleId(gUnit) , hit)
                endif
            endif
        endloop
        call GroupClear(gGroup)
        if count >= 20 then
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
        set g = null
    endfunction

    private function period6_1 takes unit u, effect e returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        call SaveUnitHandle(ht, zid, 0, u)
        call SaveEffectHandle(ht, zid, 1, e)
        call SaveInteger(ht, zid, 0, 0)
        call SaveGroupHandle(ht, zid, 2, CreateGroup())
        call TimerStart(z, 0.02, true, function period6_2)
        set z = null
    endfunction

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local integer index = LoadInteger(ht, zid, 2)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local real h
        local integer i
        local effect e
        local integer pid

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Emiya_6.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 12)
        endif
        if count <= 100 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                set x = PolarX(GetUnitX(u) , -50, a)
                set y = PolarY(GetUnitY(u) , -50, a)
                if GetRandomInt(1, 2) == 1 then
                    set x = PolarX(GetUnitX(u) , GetRandomReal(0, 450) , a + 90)
                    set y = PolarY(GetUnitY(u) , GetRandomReal(0, 450) , a + 90)
                else
                    set x = PolarX(GetUnitX(u) , GetRandomReal(0, 450) , a - 90)
                    set y = PolarY(GetUnitY(u) , GetRandomReal(0, 450) , a - 90)
                endif
                set h = GetRandomReal(50, 200)
                call Effect("war3mapImported\\ToonBoomBlue.mdl", x, y, h, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\LongSword.mdl", x, y, h, a, 0, 0, 1.25, 2.4 - count * 0.02, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid, 100 + index, bj_lastCreatedEffect)
                set index = index + 1
                call SaveInteger(ht, zid, 2, index)
                set x = PolarX(GetUnitX(u) , -50, a)
                set y = PolarY(GetUnitY(u) , -50, a)
                if GetRandomInt(1, 2) == 1 then
                    set x = PolarX(GetUnitX(u) , GetRandomReal(0, 450) , a + 90)
                    set y = PolarY(GetUnitY(u) , GetRandomReal(0, 450) , a + 90)
                else
                    set x = PolarX(GetUnitX(u) , GetRandomReal(0, 450) , a - 90)
                    set y = PolarY(GetUnitY(u) , GetRandomReal(0, 450) , a - 90)
                endif
                set h = GetRandomReal(50, 200)
                call Effect("war3mapImported\\ToonBoomBlue.mdl", x, y, h, a, 0, 0, 1.5, 1.5, 255, 255, 255, 255)
                call Effect("war3mapImported\\LongSword.mdl", x, y, h, a, 0, 0, 1.25, 3.4 - count * 0.02, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid, 100 + index, bj_lastCreatedEffect)
                set index = index + 1
                call SaveInteger(ht, zid, 2, index)
            endif
        endif
        if count <= 100 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 2000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if not IsUnitInGroup(gUnit, g) then 
                    call GroupAddUnit(g, gUnit)
                endif
                call SetUnitMoveSpeed(gUnit, GetUnitDefaultMoveSpeed(gUnit) * 0.1)
            endloop
            call GroupClear(gGroup)
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Emiya_6-1.mp3")
            call ForGroup(g, function ResetMoveSpeed)
            call DestroyGroup(g)
            set pid = GetPlayerId(GetOwningPlayer(u))
            call FlushChildHashtable(ht, StringHash("EmiyaF_" + I2S(pid)))
        endif
        if count >= 100 and count <= 140 then
            set index = index - 1
            call SaveInteger(ht, zid, 2, index)
            set e = LoadEffectHandle(ht, zid, 100 + index)
            call period6_1(u, e)
        endif
        if count == 140 then
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
        set g = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid , - 1) then
            call SaveReal(ht, zid , - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid , - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Emiya_7.mp3")
            call SoundStart("war3mapImported\\Emiya_7-1.mp3")
            set x = PolarX(GetUnitX(u) , -100, a)
            set y = PolarY(GetUnitY(u) , -100, a)
            call Effect("war3mapImported\\EX Light.mdl", x, y, 0, randomAngle() , 0, 0, 1, 5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTBlueNoRingWhite.mdl", x, y, 100, randomAngle() , 0, 0, 2.5, 1, 255, 15, 15, 255)
            call Effect("war3mapImported\\herosaber.mdl", x, y, 0, a, 0, 0, 1, 12, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 10)
            call SaveEffectHandle(ht, zid , 100, bj_lastCreatedEffect)
        endif
        if count == 50 or count == 100 or count == 150 or count == 200 or count == 250 or count == 300 then
            set e = LoadEffectHandle(ht, zid , 100)
            call Effect("war3mapImported\\EX Light.mdl", GetEffectX(e) , GetEffectY(e) , 0, randomAngle() , 0, 0, 1, 5, 255, 255, 255, 255)
        endif
        if count <= 500 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                set e = LoadEffectHandle(ht, zid , 100)
                call Effect("war3mapImported\\DustWaveAnimate2.mdl", GetEffectX(e) , GetEffectY(e) , 0, randomAngle() , 0, 0, GetRandomReal(0.65, 3) , 1, 255, 255, 0, PercentTo255(GetRandomReal(20, 40)))
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count == 500 then
            call SoundStart("war3mapImported\\Emiya_7-2.mp3")
            set e = LoadEffectHandle(ht, zid , 100)
            call SetSpecialEffectAnimationByIndex(e, 1)
            call Effect("", GetEffectX(e) , GetEffectY(e) , 0, GetSpecialEffectYaw(e) , 0, 0, 1, 1.2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid , 101, bj_lastCreatedEffect)
        endif
        if count >= 500 and count <= 550 then
            set e = LoadEffectHandle(ht, zid , 101)
            set x = PolarX(GetEffectX(e) , 50, GetSpecialEffectYaw(e))
            set y = PolarY(GetEffectY(e) , 50, GetSpecialEffectYaw(e))
            call SetEffectXY(e, x, y, 1)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\poweraura.mdl", GetEffectX(e) , GetEffectY(e) , 150, GetSpecialEffectYaw(e) , - 70, 0, 1 + (count - 500) * 0.06, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\AncientExplodeOrange&Yellow.mdl", GetEffectX(e) , GetEffectY(e) , 0, GetSpecialEffectYaw(e) , 0, 0, 0.5 + (count - 500) * 0.02, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 550 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroAgi(u, true))
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

        if abilId == 'A0D6' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0D7' then
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

        if abilId == 'A0D8' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0D9' then
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

        if abilId == 'A0DA' then
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

        if abilId == 'A0DB' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveInteger(ht, GetHandleId(z) , 2, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period6)
        endif
        
        if abilId == 'A0DC' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveUnitHandle(ht, GetHandleId(z) , 1, t)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , -1, GetUnitState(t, UNIT_STATE_LIFE))
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