scope tendokisaraspell initializer init
   
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
            call SoundStart("war3mapImported\\Kisara_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\GetsugaBlueNew.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.2, 0.6, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 80, a)
            set y = PolarY(GetEffectY(e), 80, a)
            call SetEffectXY(e, x, y, 1)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A014'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", x, y, 25, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\Energy Release2.mdl", x, y, 150, a, - 90, 0, 1, 1, 255, 255, 255, 255)
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
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kisara_2.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count == 25 then
            call SetUnitAnimationByIndex(u, 9)
        endif
        if count <= 40 then 
            if dist > 140 then 
                call SetUnitX(u, PolarX(GetUnitX(u), dist / 30, a))
                call SetUnitY(u, PolarY(GetUnitY(u), dist / 30, a))
            else
                call SetUnitX(u, PolarX(GetUnitX(t), - 120, a))
                call SetUnitY(u, PolarY(GetUnitY(t), - 120, a))
            endif
        endif
        if count == 40 then
            call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\animeslashfinal.mdx", GetUnitX(u), GetUnitY(u), 50, a - 30, 0, 0, 3, 1, 102, 102, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\IceNova.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A016')) * GetHeroAgi(u, true))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kisara_3.mp3")
            call SoundStart("war3mapImported\\Kisara_3-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\[DoFT]blinkcasterWhite.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 15 then 
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\[DoFT]blinkcasterWhite.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\SBXZAFB2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\shirouichigosl2.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (1 + 0.5 * GetUnitAbilityLevel(u, 'A01D')) * GetHeroAgi(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
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
            call SoundStart("war3mapImported\\Kisara_4.mp3")
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 10 or count == 20 or count == 30 or count == 40 then
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count == 30 then
            call Effect("war3mapImported\\az-blue-lizi-shangsheng.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 50 then
            call Effect("war3mapImported\\FreezingRing.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\IceNova.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitFacingEx(u, a, true)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 70 then
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.4)
        endif
        if count == 90 then
            call Effect("war3mapImported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call Effect("war3mapImported\\az_jingzi_jiansheng01_e1.mdx", x, y, 50, GetUnitFacing(u), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 100 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A013')) * GetHeroAgi(u, true))
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
            call SoundStart("war3mapImported\\Kisara_5.mp3")
            call SetUnitAnimationByIndex(u, 10)
            set x = PolarX(GetUnitX(t), - 800, a)
            set y = PolarY(GetUnitY(t), - 800, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 or count == 100 or count == 120 then
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.5), 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count <= 120 then
            set x = PolarX(GetUnitX(u), 5, a)
            set y = PolarY(GetUnitY(u), 5, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 120 then
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\Black.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, PercentTo255(40))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            call Effect("war3mapImported\\[A]ZoroEf0.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call TimeScaleEffect(bj_lastCreatedEffect, 1, 1)
            call Effect("war3mapImported\\[DoFT]DevilSlamAddetivRed.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitTimeScale(u, 0.85)
            call Effect("war3mapImported\\animeslashfinal.mdx", GetUnitX(u), GetUnitY(u), 50, a - 30, 0, 0, 4, 1, 255, 51, 51, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.2)
        endif
        if count == 230 then
            call Effect("war3mapImported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 50, a + 30, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_hit-red-blade.mdx", GetUnitX(t), GetUnitY(t), 50, a - 30, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\afbredcharge.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[DoFT]blood132.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\az_axe_e1.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 51, 51, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
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
            call RemoveUnit(LoadUnitHandle(ht, zid, 2))
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
            call SoundStart("war3mapImported\\Kisara_6.mp3")
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 140, a)
            set y = PolarY(GetUnitY(t), - 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\[A]WhiteSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2.5, 1, 255, 51, 51, 255)
        endif
        if count == 10 or count == 20 or count == 30 then 
            call Effect("war3mapImported\\BloodEX-Special-2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.8))
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 50 then
            call Effect("war3mapImported\\Dimension Slash2.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 60 then 
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Kisara_7.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\az-blue-lizi-shangsheng.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count == 15 then
            call Effect("war3mapImported\\FreezingRing.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\IceNova.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitFacingEx(u, a, true)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.4)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 30 then
            call Effect("war3mapImported\\[DoFT]chushou_by_wood_effect_blood_xuebao.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call Effect("war3mapImported\\az_jingzi_jiansheng01_e1.mdx", x, y, 0, GetUnitFacing(u), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 40 then 
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

        if abilId == 'A014' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A016' then
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

        if abilId == 'A01D' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A013' then
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

        if abilId == 'A00X' then
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

        if abilId == 'A017' then
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

        if abilId == 'A01X' then
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