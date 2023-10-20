scope diegospell initializer init
   
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
            call SoundStart("war3mapImported\\Diego_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 1)
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.2)
            call Effect("war3mapImported\\SatomiWind.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1.35, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\CF2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 0.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapImported\\star-magic.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
        endif
        if count <= 15 then
            set x = PolarX(GetUnitX(u), 80, a)
            set y = PolarY(GetUnitY(u), 80, a)
            call SetUnitXY(u, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 300, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0CZ'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\WindCirclefaster.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(50))
                call Effect("war3mapImported\\wind3.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(GetRandomReal(40, 60)))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(1, 1.5))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2 
        local real h
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Diego_2.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
            set x = PolarX(GetUnitX(u), 50, a)
            set y = PolarY(GetUnitY(u), 50, a)
            call Effect("war3mapImported\\wind3.mdl", x, y, 100, a, - 90, 0, 1, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\CF2.mdl", x, y, 0, a, 0, 0, 0.5, 1, 255, 255, 255, PercentTo255(60))
            set x = PolarX(GetUnitX(u), 150, a)
            set y = PolarY(GetUnitY(u), 150, a)
            call Effect("war3mapImported\\rasengan_eff4.mdl", x, y, 100, a, - 90, 0, 0.8, 1, 255, 255, 255, PercentTo255(40))
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.75, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\[DoFT]DiegoBox.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 0.8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x2 = PolarX(GetEffectX(e), dist / 30, a)
            set y2 = PolarY(GetEffectY(e), dist / 30, a)
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetEffectXY(e, x2, y2, 1)
            if count > 15 then
                call SetSpecialEffectZ(e, h - 10)
            else
                call SetSpecialEffectZ(e, h + 10)
            endif
        endif
        if count == 30 then 
            set e = LoadEffectHandle(ht, zid, 100)
            call Effect("war3mapImported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\[A]BY_Wood_XianHuo_2.mdl", GetEffectX(e), GetEffectY(e), 200, randomAngle(), 0, 0, 6, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
            call Effect("war3mapImported\\[A]Explodeorange.mdl", GetEffectX(e), GetEffectY(e), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 600, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, (1 + GetUnitAbilityLevel(u, 'A0D0')) * GetHeroStr(u, true))
                endif 
            endloop
            call GroupClear(gGroup)
        endif
        if count == 35 then
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
        set e = null
    endfunction

    private function period3_1 takes nothing returns nothing
        local unit u = GetEnumUnit()

        call SetUnitTimeScale(u, 1)
        call PauseUnit(u, false)

        set u = null
    endfunction

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x 
        local real y
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 then
            call SoundStart("war3mapImported\\Diego_3.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            set x = PolarX(GetUnitX(u), 70, GetUnitFacing(u) - 120)
            set y = PolarY(GetUnitY(u), 70, GetUnitFacing(u) - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind2.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, GetUnitFacing(u), 0, 0, 1, 5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 2.8, 5.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 1, 2.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 1.6, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 2.2, 1.6, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
        endif
        if count <= 60 then
            set i = 1
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
                set i = i + 1
            endloop
        endif
        if count >= 20 and count <= 270 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count <= 60 then
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), (count - 20) * 25, null)
                call GroupRemoveUnit(gGroup, u)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                        call PauseUnit(gUnit, true)
                        if not IsUnitInGroup(gUnit, g) then
                            call SetUnitTimeScale(gUnit, 0)
                            call GroupAddUnit(g, gUnit)
                        endif
                    endif
                endloop
                call GroupClear(gGroup)
            else
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1000, null)
                call GroupRemoveUnit(gGroup, u)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                        call PauseUnit(gUnit, true)
                        if not IsUnitInGroup(gUnit, g) then
                            call SetUnitTimeScale(gUnit, 0)
                            call GroupAddUnit(g, gUnit)
                        endif
                    endif
                endloop
                call GroupClear(gGroup)
            endif
        endif
        if count == 60 then
            set e = LoadEffectHandle(ht, zid, 104)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 80 then
            set e = LoadEffectHandle(ht, zid, 103)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 100 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectVertexColour(e, 255, 255, 255, 0)
            set e = LoadEffectHandle(ht, zid, 102)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 200 then
            call SoundStart("war3mapImported\\Diego_3-1.mp3")
        endif
        if count == 230 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 250 then
            call ForGroup(g, function period3_1)
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

    private function period4_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local effect e = LoadEffectHandle(ht, zid, 100)
        local integer count = LoadInteger(ht, zid, 0)
        local real dist = LoadReal(ht, zid, 0)
        local real a = GetSpecialEffectYaw(e)
        local real x = PolarX(GetEffectX(e), dist / 20, a)
        local real y = PolarY(GetEffectY(e), dist / 20, a)
        local real h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, h - 50)
        if count == 20 then
            call Effect("war3mapImported\\[A]bloodex.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call GroupEnumUnitsInRange(gGroup, x, y, 400, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then 
                    call DamageUnit(u, gUnit, ((6 + 2 * GetUnitAbilityLevel(u, 'A0D2')) * GetHeroStr(u, true)) / 40)
                    call IssueImmediateOrderById(gUnit, 851972)
                endif 
            endloop
            call GroupClear(gGroup)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set e = null
    endfunction

    private function period4_1 takes unit u, real x, real y returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real a = randomAngle()
        local real x2 = PolarX(x, 800, a)
        local real y2 = PolarY(y, 800, a)
        local real dist = Distance(x2, y2, x, y)

        call SaveUnitHandle(ht, zid, 0, u)
        set a = Angle(x2, y2, x, y)
        call Effect("war3mapImported\\[DoFT]DiegoKnife.mdl", x2, y2, 1010, a, - 40, 0, 2, 1, 255, 255, 255, 255)
        call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        call SaveInteger(ht, zid, 0, 0)
        call SaveReal(ht, zid, 0, dist)
        call TimerStart(z, 0.02, true, function period4_2)

        set z = null
    endfunction

    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local real x2 
        local real y2
        local real a2

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Diego_4.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 10)
        endif
        if count <= 40 then
            set a2 = randomAngle()
            set x2 = PolarX(x, GetRandomReal(- 400, 400), a2)
            set y2 = PolarY(y, GetRandomReal(- 400, 400), a2)
            call period4_1(u, x2, y2)
        endif
        if count == 40 then
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

    private function period5_4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local real dist = LoadReal(ht, zid, 0)
        local real a = GetSpecialEffectYaw(e)
        local real x = PolarX(GetEffectX(e), dist / 20, a)
        local real y = PolarY(GetEffectY(e), dist / 20, a)
        local real h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, h - 35)
        if count == 20 then
            call Effect("war3mapImported\\[A]bloodex.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set e = null
    endfunction

    private function period5_3 takes effect e, real x, real y returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)
        local real dist = Distance(GetEffectX(e), GetEffectY(e), x, y)

        call SaveEffectHandle(ht, zid, 0, e)
        call SaveInteger(ht, zid, 0, 0)
        call SaveReal(ht, zid, 0, dist)
        call TimerStart(z, 0.02, true, function period5_4)

        set z = null
    endfunction

    private function period5_2 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local effect e = LoadEffectHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local real a = GetSpecialEffectYaw(e)
        local real x = PolarX(GetEffectX(e), 20, a)
        local real y = PolarY(GetEffectY(e), 20, a)
        local real h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call SetEffectXY(e, x, y, 0)
        call SetSpecialEffectZ(e, h - 30)
        if count == 20 then
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set e = null
    endfunction

    private function period5_1 takes effect e returns nothing
        local timer z = CreateTimer()
        local integer zid = GetHandleId(z)

        call SaveEffectHandle(ht, zid, 0, e)
        call SaveInteger(ht, zid, 0, 0)
        call TimerStart(z, 0.02, true, function period5_2)

        set z = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local unit t = LoadUnitHandle(ht, zid, 1)
        local group g = LoadGroupHandle(ht, zid, 2)
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
            call SoundStart("war3mapImported\\Diego_5.mp3")
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wavejojo.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\wind2.mdx", x, y, 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\Sprint_Cast_Base.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 9, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 2.8, 9.2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1.8, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.7)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 1.6, 1.4, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call SaveEffectHandle(ht, zid, 103, bj_lastCreatedEffect)
            call Effect("war3mapimported\\Room.mdx", x, y, 0, randomAngle(), 0, 0, 2.2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call SaveEffectHandle(ht, zid, 104, bj_lastCreatedEffect)
        endif
        if count <= 40 then
            set i = 1
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SetSpecialEffectVertexColour(e, PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(30, 50)), PercentTo255(GetRandomReal(40, 60)))
                set i = i + 1
            endloop
        endif
        if count == 40 then
            set e = LoadEffectHandle(ht, zid, 104)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\Diego_5-1.mp3")
        endif
        if count == 60 then
            set e = LoadEffectHandle(ht, zid, 103)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 80 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectVertexColour(e, 255, 255, 255, 0)
            set e = LoadEffectHandle(ht, zid, 102)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count == 200 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count >= 200 and count <= 290 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call SaveInteger(ht, zid, 10, LoadInteger(ht, zid, 10) + 1)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), 1000, a2)
                set y = PolarY(GetUnitY(t), 1000, a2)
                set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
                call Effect("war3mapImported\\[DoFT]DiegoKnife.mdl", x, y, 1300, a, - 40, 0, 2, 6.2 - LoadInteger(ht, zid, 10) * 0.04, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid, 200 + LoadInteger(ht, zid, 10), bj_lastCreatedEffect)
                call period5_1(bj_lastCreatedEffect)
            endif
        endif
        if count <= 450 then
            set e = LoadEffectHandle(ht, zid, 100)
            if count <= 40 then
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), count * 25, null)
                call GroupRemoveUnit(gGroup, u)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                        call PauseUnit(gUnit, true)
                        if not IsUnitInGroup(gUnit, g) then
                            call SetUnitTimeScale(gUnit, 0)
                            call GroupAddUnit(g, gUnit)
                        endif
                    endif
                endloop
                call GroupClear(gGroup)
            else
                call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1000, null)
                call GroupRemoveUnit(gGroup, u)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if IsUnitAlive(gUnit) and not IsUnitInvulnerable(gUnit) then
                        call PauseUnit(gUnit, true)
                        if not IsUnitInGroup(gUnit, g) then
                            call SetUnitTimeScale(gUnit, 0)
                            call GroupAddUnit(g, gUnit)
                        endif
                    endif
                endloop
                call GroupClear(gGroup)
            endif
        endif
        if count == 450 then
            set e = LoadEffectHandle(ht, zid, 101)
            call SetSpecialEffectAnimationByIndex(e, 1)
            set i = 1
            loop
                exitwhen i > LoadInteger(ht, zid, 10)
                set e = LoadEffectHandle(ht, zid, 200 + i)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 400, 400), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 400, 400), a2)
                call period5_3(e, x, y)
                set i = i + 1
            endloop
        endif
        if count == 480 then
            call ForGroup(g, function period3_1)
            call DestroyGroup(g)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroStr(u, true))
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
        local real a2
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Diego_6.mp3")
            set x = PolarX(GetUnitX(u), 70, a - 120)
            set y = PolarY(GetUnitY(u), 70, a - 120)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 2)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 3)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 30 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), - 200, a)
            set y = PolarY(GetUnitY(t), - 200, a)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectZ(e, GetAxisZ(x, y))
            call SetSpecialEffectYaw(e, a)
            call SetSpecialEffectAnimationByIndex(e, 3)
        endif
        if count >= 30 and count <= 230 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), a2)
                call Effect("war3mapimported\\Hit.mdx", x, y, GetRandomReal(50, 100), randomAngle(), 0, 0, GetRandomReal(1.25, 1.65), 1.5, 255, 100, 0, 150)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.7, 1))
                set a2 = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), a2)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), a2)
                call Effect("war3mapimported\\EnergyBurst2.mdx", x, y, GetRandomReal(50, 100), randomAngle(), 0, 0, GetRandomReal(1.35, 1.75), 1.5, 255, 255, 255, PercentTo255(60))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.5, 1))
            endif
        endif
        if count == 240 then
            call Effect("war3mapimported\\EarthDetonation.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapimported\\[A]NewSparksEX.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\wavejojo.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\windexploreeffect(bigger).mdx", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[a]dustexplosion.mdx", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 15, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 250 then 
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
        set e = null
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Diego_7.mp3")
            set x = PolarX(GetUnitX(u), 70, a)
            set y = PolarY(GetUnitY(u), 70, a)
            call Effect("war3mapimported\\kizaruhitBlue.mdx", x, y, 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[DoFT]DiegoTheWorld.mdx", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 2)
        endif
        if count == 20 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 1)
        endif
        if count <= 25 then
            set e = LoadEffectHandle(ht, zid, 100)
            set dist = Distance(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
            if dist > 120 then
                set x = PolarX(GetEffectX(e), dist / 15, a)
                set y = PolarY(GetEffectY(e), dist / 15, a)
                call SetEffectXY(e, x, y, 0)
            else
                call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
            endif
            call SetSpecialEffectZ(e, GetAxisZ(GetEffectX(e), GetEffectY(e)))
        endif
        if count == 25 then
            call SoundStart("war3mapImported\\Satomi_4-5.mp3")
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Dls1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\zxd1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 30 then 
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

        if abilId == 'A0CZ' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A0D0' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period2)
        endif

        if abilId == 'A0D1' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A0D2' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0D3' then
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
            call SaveGroupHandle(ht, GetHandleId(z), 2, CreateGroup())
            call TimerStart(z, 0.02, true, function period5)
        endif

        if abilId == 'A0D4' then
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

        if abilId == 'A0D5' then
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