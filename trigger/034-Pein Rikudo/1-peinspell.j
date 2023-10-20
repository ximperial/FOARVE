scope peinspell initializer init
   
    private function period1 takes nothing returns nothing
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
        if count == 1 then
            call SoundStart("war3mapImported\\Pain_1.mp3")
            call SoundStart("war3mapImported\\Pain_1-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then 
            call SetUnitXY(u, x, y, 1)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\zxd2.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), - 90, 0, 7, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\Mr.War3_SLTZ.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 500, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0E4'))
                endif
            endloop
            call GroupClear(gGroup)
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
            call SoundStart("war3mapImported\\Pain_2.mp3")
            call SetUnitAnimationByIndex(u, 14)
        endif
        if count <= 15 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(t), dist / 10, a + 180)
                set y = PolarY(GetUnitY(t), dist / 10, a + 180)
                call SetUnitXY(t, x, y, 0)
            else
                set x = PolarX(GetUnitX(u), 120, a)
                set y = PolarY(GetUnitY(u), 120, a)
                call SetUnitXY(t, x, y, 0)
            endif
        endif
        if count == 10 then
            call SoundStart("war3mapImported\\Pain_2-1.mp3")
        endif
        if count == 15 then 
            call Effect("war3mapImported\\zxd5.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 20 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A0E5')) * GetHeroStr(u, true))
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
            call SoundStart("war3mapImported\\Pain_4.mp3")
            call SoundStart("war3mapImported\\Pain_4-1.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\BlackBlink.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 5 then
            call SetUnitXY(u, x, y, 1)
        endif
        if count >= 5 and count <= 50 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) + 15, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\zxd1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(2, 3), 1, 255, 255, 255, 255)
            endif
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Pain_4-2.mp3")
        endif
        if count == 50 then 
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_YeYe_Eat_DiBanZhaKai.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\zxd6.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 700, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null 
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (6 + 2 * GetUnitAbilityLevel(u, 'A0E7')) * GetHeroStr(u, true))
                    call IssueImmediateOrderById(gUnit, 851972)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 80 then
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitFlyHeight(u, 0, 0)
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
        local integer i
        local unit d
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Pain_5.mp3")
            set x = PolarX(GetUnitX(t), 700, 60)
            set y = PolarY(GetUnitY(t), 700, 60)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 10, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN1Tendo.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 100, e)
            set x = PolarX(GetUnitX(t), 700, 120)
            set y = PolarY(GetUnitY(t), 700, 120)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 11, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN2Chikushido.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 101, e)
            set x = PolarX(GetUnitX(t), 700, 180)
            set y = PolarY(GetUnitY(t), 700, 180)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 12, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN3Ningendo.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 102, e)
            set x = PolarX(GetUnitX(t), 700, 240)
            set y = PolarY(GetUnitY(t), 700, 240)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 13, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN4Gakido.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 103, e)
            set x = PolarX(GetUnitX(t), 700, 300)
            set y = PolarY(GetUnitY(t), 700, 300)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 14, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN5Jigokudo.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 104, e)
            set x = PolarX(GetUnitX(t), 700, 360)
            set y = PolarY(GetUnitY(t), 700, 360)
            set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
            set d = CreateUnit(GetOwningPlayer(u), 'h00A', x, y, a)
            call SetUnitAnimationByIndex(d, 14)
            call SaveUnitHandle(ht, zid, 15, d)
            set e = AddSpecialEffectTarget("war3mapImported\\PainPathsN6Asura.mdx", d, "head")
            call SaveEffectHandle(ht, zid, 105, e)
        endif
        if count <= 25 then 
            set i = 0
            loop
                exitwhen i > 5
                set d = LoadUnitHandle(ht, zid, 10 + i)
                set a = Angle(GetUnitX(d), GetUnitY(d), GetUnitX(t), GetUnitY(t))
                set dist = Distance(GetUnitX(d), GetUnitY(d), GetUnitX(t), GetUnitY(t))
                if dist > 140 then 
                    set x = PolarX(GetUnitX(d), dist / 15, a)
                    set y = PolarY(GetUnitY(d), dist / 15, a)
                    call SetUnitXY(d, x, y, 0)
                else
                    set x = PolarX(GetUnitX(t), - 120, a)
                    set y = PolarY(GetUnitY(t), - 120, a)
                    call SetUnitXY(d, x, y, 0)
                endif
                if count > 15 then
                    call SetUnitFlyHeight(d, GetUnitFlyHeight(d) - 45, 0)
                else
                    call SetUnitFlyHeight(d, GetUnitFlyHeight(d) + 30, 0)
                endif
                set i = i + 1
            endloop
        endif
        if count == 20 then
            call SoundStart("war3mapImported\\Pain_5-1.mp3")
        endif
        if count == 25 then 
            call Effect("war3mapimported\\AizenJHSY.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\zxd6.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 35 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueImmediateOrderById(t, 851972)
            set i = 0
            loop
                exitwhen i > 5
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call DestroyEffect(e)
                set i = i + 1
            endloop
            set i = 0 
            loop
                exitwhen i > 5
                set d = LoadUnitHandle(ht, zid, 10 + i)
                call RemoveUnit(d)
                set i = i + 1
            endloop
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set d = null
        set e = null
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 then
            call SoundStart("war3mapImported\\Pain_6.mp3")
            call SoundStart("war3mapImported\\Pain_6-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1500, 3, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\peincsdniao.mdx", GetUnitX(u), GetUnitY(u), 300, a, 0, 0, 1, 2.2, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 100 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 30, a)
            set y = PolarY(GetEffectY(e), 30, a)
            call SetEffectXY(e, x, y, 1)
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
            call SaveInteger(ht, zid , 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid , 1, 0)
                call Effect("war3mapimported\\BY_Wood_Eff_Ord_YeYe_Elp_XiaoQiDan_BaoZha_1.mdx", x, y, 25, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 100 then
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
            call SoundStart("war3mapImported\\Pain_7.mp3")
            call SetUnitAnimationByIndex(u, 13)
            call Effect("war3mapImported\\Chibaku Tensei.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 2.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.65)
            call AnimEffect(bj_lastCreatedEffect, 1, 1.2)
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Pain_4-1.mp3")
        endif
        if count == 85 then 
            call Effect("war3mapImported\\zxd5.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 8 * GetHeroStr(u, true))
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

        if abilId == 'A0E4' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0E5' then
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

        if abilId == 'A0E7' then
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

        if abilId == 'A0E8' then
            set z = CreateTimer()
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0E9' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0EA' then
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
        
        set z = null
        set u = null
        set t = null
    endfunction
        
    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope