scope omashuspell initializer init
   
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
            call SoundStart("war3mapImported\\Shu_1-1.mp3")
            call SoundStart("war3mapImported\\Shu_1-2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 15)
            call SetUnitTimeScale(u, 2)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u) , 80, a)
            set y = PolarY(GetUnitY(u) , 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, GetHeroInt(u, true) + 90 * GetUnitAbilityLevel(u, 'A05E'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapImported\\File00005630.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 50, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FantasyBattle (1520).mdl", GetUnitX(u) , GetUnitY(u) , 150, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
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
            call SoundStart("war3mapImported\\Shu_2-1.mp3")
            call SoundStart("war3mapImported\\Shu_1-2.mp3")
            call SetUnitAnimationByIndex(u, 15)
        endif
        if count == 1 or count == 5 or count == 10 then
            call Effect("war3mapImported\\File00005630.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 15 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 10, a)
                set y = PolarY(GetUnitY(u) , dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , -120, a)
                set y = PolarY(GetUnitY(t) , -120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 15 then
            call Effect("war3mapImported\\1062.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitTimeScale(u, 1.5)
            call SaveReal(ht, GetHandleId(z) , 0, a)
        endif
        if count >= 15 and count <= 30 then
            set a = LoadReal(ht, GetHandleId(z) , 0) + 12
            set x = PolarX(GetUnitX(u) , 120, a)
            set y = PolarY(GetUnitY(u) , 120, a)
            call SetUnitXY(t, x, y, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
        endif
        if count == 20 then
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\FantasyBattle (1520).mdl", GetUnitX(u) , GetUnitY(u) , 200, randomAngle() , 0, 0, 5, 1, 255, 255, 255, 255)
        endif
        if count == 30 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A05F')) * GetHeroInt(u, true))
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Shu_2-2.mp3")
            call SoundStart("war3mapImported\\Shu_2-3.mp3")
            call SetUnitAnimationByIndex(u, 18)
            call SetUnitTimeScale(u, 1.4)
        endif
        if count == 1 or count == 5 or count == 10 or count == 15 or count == 20 then
            call Effect("war3mapImported\\File00005630.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\0614.mdl", GetUnitX(u) , GetUnitY(u) , 50, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(t) , 30, a)
            set y = PolarY(GetUnitY(t) , 30, a)
            call SetUnitXY(t, x, y, 2)
            set x = PolarX(GetUnitX(t) , -120, a)
            set y = PolarY(GetUnitY(t) , -120, a)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 15 then
            call SetUnitAnimationByIndex(u, 17)
        endif
        if count == 20 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 25 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A05K')) * GetHeroInt(u, true))
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

    private function period4 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Shu_4-7.mp3")
            set x = PolarX(GetUnitX(t) , 120, a)
            set y = PolarY(GetUnitY(t) , 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a + 180, true)
            call SetUnitAnimationByIndex(u, 3)
        endif
        if count == 1 or count == 5 or count == 15 or count == 25 then
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Shu_4-8.mp3")
            set x = PolarX(GetUnitX(t) , 120, a)
            set y = PolarY(GetUnitY(t) , 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 19)
            call SetUnitFacingEx(u, a + 180, true)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Shu_4-9.mp3")
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\0227.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BD_YEQI03.mdl", GetUnitX(u) , GetUnitY(u) , 0, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
        endif
        if count == 45 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\File00000012.mdl", GetUnitX(t) , GetUnitY(t) , 500, a, 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\FantasyBattle (1520).mdl", GetUnitX(t) , GetUnitY(t) , 300, a, 0, 0, 6, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zm (280).mdl", GetUnitX(t) , GetUnitY(t) , 300, a, 0, 0, 3.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A05M')) * GetHeroInt(u, true))
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
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local integer i
        local group g2
        local unit d
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Shu_5-1.mp3")
            call ShakeCamera(2, GetOwningPlayer(u) , 10)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\fanty (86).mdl", GetUnitX(u) , GetUnitY(u) , 50, GetUnitFacing(u) , 0, 0, 2, 3, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid , 100, bj_lastCreatedEffect)
            set d = CreateUnit(GetOwningPlayer(u) , 'h0CO', GetUnitX(u) , GetUnitY(u) , a)
            call SetUnitPropWindow(d, 0)
            call UnitApplyTimedLife(d, 'BTLF', 2.5)
            call SaveUnitHandle(ht, zid , 10, d)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count == 25 or count == 50 or count == 75 then
            set d = LoadUnitHandle(ht, zid, 10)
            call SelectUnitForPlayerSingle(d, GetOwningPlayer(u))
        endif
        if count <= 100 then
            set d = LoadUnitHandle(ht, zid, 10)
            if GetUnitFacing(u) != GetUnitFacing(d) then
                call SetUnitFacingEx(u, GetUnitFacing(d) , true)
                set e = LoadEffectHandle(ht, zid, 100)
                call SetSpecialEffectYaw(e, GetUnitFacing(u))
            endif
        endif
        if count == 100 then
            call SoundStart("war3mapImported\\Shu_5-2.mp3")
            call ShakeCamera(2, GetOwningPlayer(u) , 15)
            call SelectUnitForPlayerSingle(u, GetOwningPlayer(u))
            call Effect("war3mapImported\\0810.mdl", GetUnitX(u) , GetUnitY(u) , 200, GetUnitFacing(u) , 0, 0, 4, 3, 255, 255, 255, 255)
            call Effect("war3mapImported\\File00002384.mdl", GetUnitX(u) , GetUnitY(u) , 200, GetUnitFacing(u) , - 90, 0, 1.5, 3, 255, 255, 255, 255)
        endif
        if count >= 100 and count <= 200 then
            set g2 = CreateGroup()
            set i = 1
            loop
                exitwhen i > 10
                set x = PolarX(GetUnitX(u) , 140 * i, GetUnitFacing(u))
                set y = PolarY(GetUnitY(u) , 140 * i, GetUnitFacing(u))
                call GroupEnumUnitsInRange(g2, x, y, 300, null)
                loop
                    set gUnit = GroupForEachUnit(g2)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) then
                        if not IsUnitInGroup(gUnit, g) then
                            call DamageUnit(u, gUnit, 15 * GetHeroInt(u, true) / 100)
                            call GroupAddUnit(g, gUnit)
                        endif
                        call stunUnit(gUnit, 0.05)
                    endif
                endloop
                set i = i + 1
            endloop
            call GroupClear(g)
            call DestroyGroup(g2)
        endif
        if count == 200 then
            set i = 1
            loop
                exitwhen i > 7
                set x = PolarX(GetUnitX(u) , 200 * i, GetUnitFacing(u))
                set y = PolarY(GetUnitY(u) , 200 * i, GetUnitFacing(u))
                call Effect("war3mapImported\\FantasyBattle (1643).mdl", x, y, 200, GetUnitFacing(u) , 0, 0, 3, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 205 then
            call SetUnitTimeScale(u, 1)
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
        set g2 = null
        set d = null
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
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Shu_6-2.mp3")
            set x = PolarX(GetUnitX(t) , 120, a)
            set y = PolarY(GetUnitY(t) , 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a + 180, true)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 3.5, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\0631.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 3.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\0203.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 2, 255, 255, 255, 255)
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\zm (280).mdl", GetUnitX(u) , GetUnitY(u) , 200, randomAngle() , 0, 0, 4, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Shu_6-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\File00002085.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\File00002105.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 7, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\36.mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 4.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\zm (280).mdl", GetUnitX(t) , GetUnitY(t) , 200, randomAngle() , 0, 0, 7, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.65)
        endif
        if count == 60 then 
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
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

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real dist = LoadReal(ht, zid, 2)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real x2 
        local real y2 

        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Shu_7.mp3")
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 0.5)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call Effect("Abilities\\Spells\\Undead\\DeathPact\\DeathPactTarget.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\kaizokusfxbyvalk4.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.4, 1, 255, 255, 255, 255)
        endif
        if count <= 25 then
            set x2 = PolarX(GetUnitX(u) , dist / 25, a)
            set y2 = PolarY(GetUnitY(u) , dist / 25, a)
            call SetUnitXY(u, x2, y2, 1)
            if count > 15 then
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
            else
                call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 200 / 15, 0)
            endif
        endif
        if count == 25 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Cleave.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(u) , GetUnitY(u) , 0, randomAngle() , 0, 0, 1.3, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 500, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 8 * GetHeroInt(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
            call SetUnitTimeScale(u, 1)
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
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A05E' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A05F' then
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

        if abilId == 'A05K' then
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

        if abilId == 'A05M' then
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

        if abilId == 'A05P' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A05Q' then
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

        if abilId == 'A05R' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, x)
            call SaveReal(ht, GetHandleId(z) , 1, y)
            call SaveReal(ht, GetHandleId(z) , 2, dist)
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