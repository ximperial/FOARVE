scope toshispell initializer init
   
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_1.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 5)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 6)
            call SetUnitTimeScale(u, 1.2)
            set i = 0
            loop
                exitwhen i > 3
                set x = PolarX(GetUnitX(u) , 50, a)
                set y = PolarY(GetUnitY(u) , 50, a)
                set x = PolarX(x, GetRandomReal(50, 150) , a + GetRandomReal(- 90, 90))
                set y = PolarY(y, GetRandomReal(50, 150) , a + GetRandomReal(- 90, 90))
                call Effect("war3mapimported\\ice-danmu.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid , 100 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count <= 15 then
            set i = 0
            loop
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid , 100 + i)
                set x = PolarX(GetEffectX(e) , 80, a)
                set y = PolarY(GetEffectY(e) , 80, a)
                call SetEffectXY(e, x, y, 1)
                call SetSpecialEffectHeight(e, 50)
                call GroupEnumUnitsInRange(gGroup, x , y , 250, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, GetHeroInt(u, true) + 90 * GetUnitAbilityLevel(u, 'A00E'))
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
                exitwhen i > 3
                set e = LoadEffectHandle(ht, zid , 100 + i)
                call SetSpecialEffectAnimation(e, "death")
                call Effect("war3mapImported\\AFBBXKS.mdl", GetEffectX(e) , GetEffectY(e) , 0, randomAngle() , 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
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

    private function period2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x , y)
        local real x2 
        local real y2
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_2.mp3")
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(u) , GetUnitY(u))
            call SetUnitAnimationByIndex(u, 3)
            call SetUnitTimeScale(u, 1.5)
        endif
        if count == 10 then
            set x2 = PolarX(x, - 100, a)
            set y2 = PolarY(y, - 100, a)
            call SetUnitXY(u, x2 , y2, 1)
            set i = 0
            loop 
                exitwhen i > 5
                set x2 = PolarX(GetUnitX(u) , 200, a + 20 * i)
                set y2 = PolarY(GetUnitY(u) , 200, a + 20 * i)
                call Effect("war3mapImported\\bingk.mdl", x2, y2, 25, a + 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                set x2 = PolarX(GetUnitX(u) , 450, a + 20 * i)
                set y2 = PolarY(GetUnitY(u) , 450, a + 20 * i)
                call Effect("war3mapImported\\bingk.mdl", x2, y2, 25, a + 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                set x2 = PolarX(GetUnitX(u) , 200, a + 20 * i)
                set y2 = PolarY(GetUnitY(u) , 200, a + 20 * i)
                call Effect("war3mapImported\\[Effect]534.mdl", x2, y2, 25, a + 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set x2 = PolarX(GetUnitX(u) , 450, a + 20 * i)
                set y2 = PolarY(GetUnitY(u) , 450, a + 20 * i)
                call Effect("war3mapImported\\[Effect]534.mdl", x2, y2, 25, a + 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set i = i + 1
            endloop
            set i = 0
            loop 
                exitwhen i > 5
                set x2 = PolarX(GetUnitX(u) , 200, a - 20 * i)
                set y2 = PolarY(GetUnitY(u) , 200, a - 20 * i)
                call Effect("war3mapImported\\bingk.mdl", x2, y2, 25, a - 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                set x2 = PolarX(GetUnitX(u) , 450, a - 20 * i)
                set y2 = PolarY(GetUnitY(u) , 450, a - 20 * i)
                call Effect("war3mapImported\\bingk.mdl", x2, y2, 25, a - 20 * i, 0, 0, 1.35, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2)
                set x2 = PolarX(GetUnitX(u) , 200, a - 20 * i)
                set y2 = PolarY(GetUnitY(u) , 200, a - 20 * i)
                call Effect("war3mapImported\\[Effect]534.mdl", x2, y2, 25, a - 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set x2 = PolarX(GetUnitX(u) , 450, a - 20 * i)
                set y2 = PolarY(GetUnitY(u) , 450, a - 20 * i)
                call Effect("war3mapImported\\[Effect]534.mdl", x2, y2, 25, a - 20 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                set i = i + 1
            endloop
        endif
        if count == 15 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u) , GetUnitY(u) , 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, (1 + GetUnitAbilityLevel(u, 'A0C8')) * GetHeroInt(u, true))
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
        local real slope

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_4.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1.4)
            call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\Invisibility\\InvisibilityTarget.mdl", u, "weapon"))
            call DestroyEffect(AddSpecialEffectTarget("war3mapImported\\blueauralance.mdl", u, "weapon"))
            set x = PolarX(GetUnitX(t) , -700, a)
            set y = PolarY(GetUnitY(t) , -700, a)
            set dist = Distance(x, y, GetUnitX(t) , GetUnitY(t))
            call Effect("", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call SaveReal(ht, zid, 100, dist)
        endif
        if count == 15 then
            call SoundStart("war3mapImported\\Toshiro_4-1.mp3")
        endif
        if count <= 25 then
            set dist = LoadReal(ht, zid, 100)
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e) , dist / 20, a)
            set y = PolarY(GetEffectY(e) , dist / 20, a)
            call SetEffectXY(e, x, y, 0)
            if count > 15 then
                call SetSpecialEffectHeight(e, GetEffectHeight(e) - 30)
            else
                call SetSpecialEffectHeight(e, GetEffectHeight(e) + 20)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                set slope = Slope(x, y, GetEffectHeight(e) , GetUnitX(t) , GetUnitY(t) , 0)
                call Effect("war3mapImported\\hitsugayabfardragonline.mdl", x , y, GetEffectHeight(e) , a , slope, 0, 7, 1, 255, 255, 255, 150)
                call Effect("war3mapImported\\az_cocochristmas_d_impact.mdl", x , y, GetEffectHeight(e) , a , slope, 0, 5, 1, 255, 255, 255, 150)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif
        if count == 25 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            set i = 0
            loop
                exitwhen i > 3
                set x = PolarX(GetUnitX(t) , 250, i * 90)
                set y = PolarY(GetUnitY(t) , 250, i * 90)
                call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 0, i * 90, 0, 0, 5, 2, 255, 255, 255, 175)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
                set i = i + 1
            endloop
        endif
        if count == 30 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A0CA')) * GetHeroInt(u, true))
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
        local real x
        local real y
        local effect e
        local effect e2
        local integer i
        local lightning l

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_5.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 60, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 120, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 180, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 240, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 300, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
            call Effect("war3mapImported\\ice_snow_inc.mdl", GetUnitX(t) , GetUnitY(t) , 20, 360, 0, 0, 3, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.4)
            call SaveEffectHandle(ht, zid, 105, bj_lastCreatedEffect)
        endif
        if count <= 20 then
            set i = 0
            loop
                exitwhen i > 5
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e) , 30, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e) , 30, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 0)
                call SetSpecialEffectHeight(e, 20)
                set i = i + 1
            endloop
        endif
        if count == 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            set e2 = LoadEffectHandle(ht, zid, 101)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 200, l)

            set e = LoadEffectHandle(ht, zid, 101)
            set e2 = LoadEffectHandle(ht, zid, 102)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 201, l)

            set e = LoadEffectHandle(ht, zid, 102)
            set e2 = LoadEffectHandle(ht, zid, 103)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 202, l)

            set e = LoadEffectHandle(ht, zid, 103)
            set e2 = LoadEffectHandle(ht, zid, 104)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 203, l)

            set e = LoadEffectHandle(ht, zid, 104)
            set e2 = LoadEffectHandle(ht, zid, 105)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 204, l)

            set e = LoadEffectHandle(ht, zid, 105)
            set e2 = LoadEffectHandle(ht, zid, 100)
            set l = AddLightningEx("MBUR", true, GetEffectX(e) , GetEffectY(e) , GetEffectHeight(e) , GetEffectX(e2) , GetEffectY(e2) , GetEffectHeight(e2))
            call SetLightningColour(l, 180, 255, 255, 255)
            call SetLightningTexture(l, "Replaceabletextures\\Weather\\snowline.blp")
            call SaveLightningHandle(ht, zid, 205, l)
        endif
        if count == 50 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10)
            call Effect("war3mapImported\\icestolb.mdl", GetUnitX(t) , GetUnitY(t) , 0, randomAngle() , 0, 0, 1, 2, 255, 255, 255, 200)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 2.5)
        endif
        if count == 60 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroInt(u, true))
            call VisionArea(GetOwningPlayer(u) , 1200, 3, GetUnitX(t) , GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyLightning(LoadLightningHandle(ht, zid, 200))
            call DestroyLightning(LoadLightningHandle(ht, zid, 201))
            call DestroyLightning(LoadLightningHandle(ht, zid, 202))
            call DestroyLightning(LoadLightningHandle(ht, zid, 203))
            call DestroyLightning(LoadLightningHandle(ht, zid, 204))
            call DestroyLightning(LoadLightningHandle(ht, zid, 205))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
        set t = null
        set e = null
        set e2 = null
        set l = null
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_6.mp3")
            call ShakeCamera(2, GetOwningPlayer(u) , 10)
            call ShakeCamera(2, GetOwningPlayer(t) , 10)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\icefirst.mdl", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 4, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call Effect("war3mapImported\\sbss_bingdongxili.mdl", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 1.5, 3, 255, 255, 255, 255)
            call Effect("war3mapImported\\icestomp.mdl", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 1.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
        endif
        if count == 125 then
            call ShakeCamera(1, GetOwningPlayer(u) , 15)
            call ShakeCamera(1, GetOwningPlayer(t) , 15)
            set i = 0
            loop
                exitwhen i > 5
                set x = PolarX(GetUnitX(t) , 300, 60 * i)
                set y = PolarY(GetUnitY(t) , 300, 60 * i)
                call Effect("war3mapImported\\sxbbtx2.mdl", x, y, 0, 60 * i, 0, 0, 1.5, 2, 255, 255, 255, 255)
                call Effect("war3mapImported\\icefirst.mdl", GetUnitX(t) , GetUnitY(t) , 120 * i, randomAngle() , 0, 0, 3, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
        endif
        if count == 135 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
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
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Toshiro_7.mp3")
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\icefirst.mdl", GetUnitX(t) , GetUnitY(t) , 25, randomAngle() , 0, 0, 2.5, 3, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            set i = 0
            loop
                exitwhen i > 9
                set x = PolarX(GetUnitX(t) , 600, 36 * i)
                set y = PolarY(GetUnitY(t) , 600, 36 * i)
                set a = Angle(x, y, GetUnitX(t) , GetUnitY(t))
                call Effect("war3mapImported\\sxbbtx2.mdl", x, y, 0, a, 0, 0, 2, 2, 255, 255, 255, 255)
                call AnimEffect(bj_lastCreatedEffect, 1, 1.4)
                set i = i + 1
            endloop
        endif
        if count == 75 then
            call ShakeCamera(1, GetOwningPlayer(u) , 10)
            call ShakeCamera(1, GetOwningPlayer(t) , 10) 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroInt(u, true))
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

    private function action takes nothing returns nothing
        local timer z
        local unit u = GetTriggerUnit()
        local unit t = GetSpellTargetUnit()
        local real x = GetSpellTargetX()
        local real y = GetSpellTargetY()
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , x, y)
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , x, y)
        local integer abilId = GetSpellAbilityId()

        if abilId == 'A00E' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0C8' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, x)
            call SaveReal(ht, GetHandleId(z) , 1, y)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0CA' then
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

        if abilId == 'A0CB' then
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

        if abilId == 'A0CC' then
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

        if abilId == 'A0CD' then
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