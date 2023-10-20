scope Inorispell initializer init

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
            call SoundStart("war3mapImported\\Kirito_2-2.mp3")
            call SetUnitAnimationByIndex(u, 5)
            call SetUnitTimeScale(u, 2.5)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Dus_Kuosan_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Inori_1.mp3")
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\kdls2.mdx", GetUnitX(u), GetUnitY(u), 50, GetUnitFacing(u), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\dingzhi_by_wood_effect_kuosanqiliu.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\BY_Wood_Effect_Order_DanGe_DaoGuang_BaoZha_1_2_2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0JQ'))
                endif
            endloop
            call GroupClear(gGroup)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
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
            call SoundStart("war3mapImported\\Inori_2.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 0.9)
        endif
        if count <= 20 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u) , dist / 15, a)
                set y = PolarY(GetUnitY(u) , dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t) , - 120, a)
                set y = PolarY(GetUnitY(t) , - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call Effect("war3mapimported\\tx-smoke1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Kirito_2-2.mp3")
            call SoundStart("war3mapImported\\Musashi_4-1.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 1)
            call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapimported\\File00010078.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 35 or count == 50 or count == 65 then
            call SoundStart("war3mapImported\\Kirito_2-2.mp3")
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call SetUnitXY(t, x, y, 2)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapimported\\SlashCRITLOW.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\VergilSlashes.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\ZK-Knife light1_2.mdx", GetUnitX(u), GetUnitY(u), 100, a, 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Inori_2-1.mp3")
            call SoundStart("war3mapImported\\Kirito_2-2.mp3")
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call SetUnitXY(t, x, y, 2)
            call Effect("war3mapImported\\blackblink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 140, a)
            set y = PolarY(GetUnitY(t), 140, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call Effect("war3mapImported\\model (24).mdx", x, y, 100, a, 0, 0, 7, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\File00002085.mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\dingzhi_by_wood_effect_kuosanqiliu.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
        endif
        if count == 95 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0JR')) * GetHeroInt(u, true))
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

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x = LoadReal(ht, GetHandleId(z), 0)
        local real y = LoadReal(ht, GetHandleId(z), 1)

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Inori_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 11)
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Inori_4-1.mp3")
            call Effect("war3mapImported\\bingk.mdx", x, y, 0, randomAngle(), 0, 0, 4.5, 1.5, 255, 0, 255, 255)
            call AnimEffectEx(bj_lastCreatedEffect, "death", 0.9)
            call Effect("war3mapImported\\[A]zhendi-water.mdx", x, y, 0, randomAngle(), 0, 0, 3, 1.5, 255, 0, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 0, randomAngle(), 0, 0, 3, 1.5, 255, 0, 255, 175)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[Plagiat]Effect373.mdx", x, y, 25, randomAngle(), 0, 0, 3, 1.5, 255, 0, 255, 175)
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A0JT')) * GetHeroInt(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 15 then
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
      
    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = GetUnitFacing(u)
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 10 then
            call SoundStart("war3mapImported\\Inori_5.mp3")
            call SetUnitAnimationByIndex(u, 9)
            set x = PolarX(GetUnitX(u), 120, a)
            set y = PolarY(GetUnitY(u), 120, a)
            call Effect("war3mapImported\\OmaShu.mdx", x, y, 0, a + 180, 0, 0, 1, 6, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 8)
            call Effect("war3mapImported\\BD_YEQI03.mdx", x, y, 0, randomAngle(), 0, 0, 3, 6, 255, 255, 255, 255)
            call Effect("AshuraAura.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 6, 255, 255, 255, 255)
        endif
        if count == 35 then
            call SoundStart("war3mapImported\\Inori_5-1.mp3")
        endif
        if count == 150 then
            call SoundStart("war3mapImported\\Inori_5-2.mp3")
        endif
        if count >= 30 and count <= 275 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 1200, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 15 * GetHeroInt(u, true) / 245) 
                    call Effect("war3mapImported\\UDeathBlu.mdx", GetUnitX(gUnit), GetUnitY(gUnit), 50, randomAngle(), 0, 0, 0.8, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 275 then
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
   
    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Inori_6.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count >= 10 and count <= 110 then
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
                call Effect("war3mapImported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 0, 255, 255)
                call Effect("war3mapImported\\[Plagiat]Effect568_2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 0, 255, 255)
            endif
        endif
        if count == 110 then
            call SoundStart("war3mapImported\\Inori_6-1.mp3")
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count == 180 then
            call SoundStart("war3mapImported\\Inori_6-2.mp3")
            call SoundStart("war3mapImported\\Inori_4-1.mp3")
            call SoundStart("war3mapImported\\Inori_6-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call ShakeCamera(1, GetOwningPlayer(t), 5)
            set i = 1
            loop
                exitwhen i > 12
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), randomAngle())
                call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 2, 255, 0, 255, 175)
                call TimeScaleEffect(bj_lastCreatedEffect, GetRandomReal(0.1, 0.35), 0.2)
                set i = i + 1
            endloop
            call Effect("war3mapImported\\[Plagiat]Effect373.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 2, 255, 0, 255, 175)
            call TimeScaleEffect(bj_lastCreatedEffect, 0.8, 0.3)
        endif
        if count == 185 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroInt(u, true))
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

    private function period6 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real x = LoadReal(ht, GetHandleId(z), 0)
        local real y = LoadReal(ht, GetHandleId(z), 1)
        local integer i

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Inori_7.mp3")
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Inori_4-1.mp3")
            call SoundStart("war3mapImported\\Inori_6-3.mp3")
            call ShakeCamera(1, GetOwningPlayer(u), 5)
            call Effect("war3mapimported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\bingk.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3.5, 1.5, 255, 0, 255, 255)
            call AnimEffectEx(bj_lastCreatedEffect, "death", 0.6)
            call Effect("war3mapImported\\[A]zhendi-water.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 0, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            set i = 1
            loop
                exitwhen i > 9
                set x = PolarX(GetUnitX(u), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(u), GetRandomReal(- 300, 300), randomAngle())
                call Effect("war3mapImported\\az_nevermoreice_x.mdl", x, y, 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 1.5, 255, 0, 255, 175)
                set i = i + 1
            endloop
            call Effect("war3mapImported\\[Plagiat]Effect373.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 0, 255, 175)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 600, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 8 * GetHeroInt(u, true))
                endif
            endloop
            call GroupClear(gGroup)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
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
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()
   
        if abilId == 'A0JQ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif 
    
        if abilId == 'A0JR' then 
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

        if abilId == 'A0JT' then 
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

        if abilId == 'A0JU' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0JV' then 
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0JW' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
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