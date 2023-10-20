scope flamekianaspell initializer init
   
    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local unit u = LoadUnitHandle(ht, GetHandleId(z) , 0)
        local group g = LoadGroupHandle(ht, GetHandleId(z) , 1)
        local integer count = LoadInteger(ht, GetHandleId(z) , 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z) , 1)
        local real a = LoadReal(ht, GetHandleId(z) , 0)
        local real x
        local real y

        set count = count + 1
        call SaveInteger(ht, GetHandleId(z) , 0, count)
        call PauseUnit(u, true)
        if count == 1 then
            call SoundStart("war3mapImported\\FlameKiana_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 7)
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
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A0KF'))
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z) , 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, GetHandleId(z) , 1, 0)
                call Effect("war3mapImported\\ApiK.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wid_ChongFengQiLiu.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, PercentTo255(60))
                call Effect("war3mapImported\\glchj.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, GetHandleId(z))
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local real dmg
   
        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\FlameKiana_2.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\SlashFire.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count <= 30 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 50 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\SlashFire.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5 , 1, 255, 255, 255, 255)
        endif
        if count >= 55 and count <= 65 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 70 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\SlashFire.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 75 and count <= 95 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 100 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\SlashFire.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 105 and count <= 125 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 130 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\SlashFire.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 135 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01L') > 0)
            call DamageUnit(u, t, (dmg + 1 + GetUnitAbilityLevel(u, 'A0KG')) * GetHeroAgi(u, true))
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
        local unit u = LoadUnitHandle(ht, GetHandleId(z), 0)
        local unit t = LoadUnitHandle(ht, GetHandleId(z), 1)
        local integer count = LoadInteger(ht, GetHandleId(z), 0)
        local integer iterator = LoadInteger(ht, GetHandleId(z), 1)
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real randomA
        local real dmg
         
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\FlameKiana_3.mp3")
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 18)
            call SetUnitTimeScale(u, 0.9)
            call SaveReal(ht, GetHandleId(z), 0, GetUnitX(t))
            call SaveReal(ht, GetHandleId(z), 1, GetUnitY(t))
        endif
        if count == 30 then
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 45, 0, 4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 9)
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
        endif
        if count == 50 then
            call SoundStart("war3mapImported\\FlameKiana_3-1.mp3")
        endif
        if count >= 50 and count <= 130 then
            set iterator = iterator + 1
            call SaveInteger(ht, GetHandleId(z), 1, iterator)
            if iterator == 10 or iterator == 20 then
                if iterator == 20 then
                    call SaveInteger(ht, GetHandleId(z), 1, 0)
                    call SetUnitAnimationByIndex(u, 32)
                endif
                set x = LoadReal(ht, GetHandleId(z), 0)
                set y = LoadReal(ht, GetHandleId(z), 1)
                set randomA = randomAngle()
                set x = PolarX(x, GetRandomReal(200, 400), randomA)
                set y = PolarY(y, GetRandomReal(200, 400), randomA)
                call SetUnitXY(t, x, y, 2)
                set randomA = randomAngle()
                set x = PolarX(GetUnitX(t), 140, randomA)
                set y = PolarY(GetUnitY(t), 140, randomA)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
                if GetRandomInt(1, 2) == 1 then
                    set randomA = GetRandomReal(15, 25)
                    call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 2.5, 1, 255, 255, 255, 255)
                    set randomA = GetRandomReal(- 40, - 20)
                    call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 4, 1, 255, 255, 255, 255)
                else
                    if GetRandomInt(1, 2) == 1 then
                        set randomA = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 2.5, 1, 255, 255, 255, 255)
                        set randomA = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 4, 1, 255, 255, 255, 255)
                        set randomA = GetRandomReal(15, 25)
                    else
                        set randomA = GetRandomReal(15, 25)
                        call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 2.5, 1, 255, 255, 255, 255)
                        set randomA = GetRandomReal(- 40, - 20)
                        call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), randomA, 0, 4, 1, 255, 255, 255, 255)
                    endif
                endif
            endif
        endif
        if count == 135 then
            set x = LoadReal(ht, GetHandleId(z), 0)
            set y = LoadReal(ht, GetHandleId(z), 1)
            call SetUnitXY(t, x, y, 0)
            set randomA = randomAngle()
            set x = PolarX(GetUnitX(t), 140, randomA)
            set y = PolarY(GetUnitY(t), 140, randomA)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 20)
            call SetUnitTimeScale(u, 1)
        endif
        if count >= 140 and count <= 160 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 24, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
        endif
        if count == 165 then
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitFlyHeight(u, 0, 0)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 180 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01L') > 0)
            call DamageUnit(u, t, (dmg + 1.5 + 0.5 * GetUnitAbilityLevel(u, 'A0KH')) * GetHeroAgi(u, true))
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
      
    private function period4 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
        local real dmg
   
        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\FlameKiana_4.mp3")
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count <= 20 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 40 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 45, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5 , 1, 255, 255, 255, 255)
        endif
        if count >= 45 and count <= 65 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 70 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 75 and count <= 95 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 100 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count >= 105 and count <= 125 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 130 then
            set x = PolarX(GetUnitX(t), - 400, a) 
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 140 then
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1)
        endif
        if count == 170 then
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 5, 1, 255, 255, 255, 255)
        endif
        if count == 190 then
            call SetUnitTimeScale(u, 0)
        endif
        if count == 230 then
            call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 250 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call SetUnitInvulnerable(u, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01L') > 0)
            call DamageUnit(u, t, (dmg + 6 + 2 * GetUnitAbilityLevel(u, 'A0KI')) * GetHeroAgi(u, true))
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y
        local real dmg
   
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
            call SoundStart("war3mapImported\\FlameKiana_5.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0) 
            call SetUnitAnimationByIndex(u, 21)
            call Effect("war3mapImported\\BolaApi2.mdx", GetUnitX(t), GetUnitY(t), 400, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "birth")
        endif
        if count == 20  then
            call Effect("war3mapImported\\BolaApi1.mdx", GetUnitX(t), GetUnitY(t), 600, randomAngle(), 0, 0, 3.5, 1, 255, 255, 255, 255)
        endif
        if count == 50 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 4, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 23)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\FlameKiana_5-1.mp3") 
        endif
        if count == 100 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 2, 255, 255, 255, 255)
            call Effect("war3mapImported\\BolaApi1.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, 255)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.5)
        endif
        if count == 180 then
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 0, a + 90, 0, 0, 5, 1, 255, 255, 255, 255)
        endif
        if count == 220 then 
            call Effect("war3mapImported\\TanahTerbelah.mdx", GetUnitX(t), GetUnitY(t), 0, a + 90  , 0, 0, 1, 2.5, 255, 255, 255, 255)
        endif
        if count == 270 then
            call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 2, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapImported\\[A]FireEruption2.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2.5, 2, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\[A]az_axe_ef1.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 2, 255, PercentTo255(80), PercentTo255(50), 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 275 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01L') > 0)
            call DamageUnit(u, t, (dmg + 15) * GetHeroAgi(u, true))
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
        local real dmg
   
        set count = count + 1
        call SaveInteger(ht, GetHandleId(z), 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\FlameKiana_6.mp3")
            set x = PolarX(GetUnitX(t), - 800, a)
            set y = PolarY(GetUnitY(t), - 800, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 14)
            call SetUnitTimeScale(u, 0.3)
            call Effect("war3mapImported\\ChargeKiana.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 4, 4.5 , 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call Effect("war3mapImported\\Muramasa1.mdx", GetUnitX(u), GetUnitY(u), 25, a, 0, 0, 2, 4.5 , 255, 255, 255, 255)
        endif
        if count == 180 then
            call Effect("war3mapImported\\TanahTerbelah.mdx", GetUnitX(t) , GetUnitY(t) , 25, a , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            call SaveReal(ht, GetHandleId(z), 0, a)
        endif
        if count >= 180 and count <= 220 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(u), 45, a)
            set y = PolarY(GetUnitY(u), 45, a)
            if count > 200 then
                call SetUnitXY(u, x, y, 1)
            else
                call SetUnitXY(u, x, y, 0)
            endif
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then 
                call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", x, y, 100, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(80), PercentTo255(50), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif
        if count == 230 then
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            set dmg = B2I(GetUnitAbilityLevel(u, 'B01L') > 0)
            call DamageUnit(u, t, (dmg + 11) * GetHeroAgi(u, true))
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
      
    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
   
        set count = count + 1
        call SaveInteger(ht, zid, 0, count) 
        if count <= 10 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart( "war3mapImported\\FlameKiana_7-1.mp3" )
            call EnableAbilityEx(u, 'A0KM', true)
            call DisableAbilityEx(u, 'A0KK', true)
            call Effect("war3mapimported\\Flamestrike I.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, PercentTo255(70))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 1.55, 1, 255, 255, 255, PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 0.9, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.5)
            call Effect("war3mapimported\\wind4.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.25, 1, 255, PercentTo255(60), PercentTo255(60), PercentTo255(80))
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
        endif
        if count == 10 then
            call PauseUnit(u, false)
        endif
        if count > 10 and GetUnitAbilityLevel(u, 'B01L') == 0 and IsUnitAlive(u) then 
            call DisableAbilityEx(u, 'A0KM', true)
            call EnableAbilityEx(u, 'A0KK', true)
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
        local unit u = LoadUnitHandle(ht, zid , 0)
        local unit t = LoadUnitHandle(ht, zid , 1)
        local integer count = LoadInteger(ht, zid , 0)
        local integer iterator = LoadInteger(ht, zid , 1)
        local real a = Angle(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real dist = Distance(GetUnitX(u) , GetUnitY(u) , GetUnitX(t) , GetUnitY(t))
        local real x
        local real y
           
        set count = count + 1
        call SaveInteger(ht, zid , 0, count)
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
            call SoundStart("war3mapImported\\FlameKiana_6-1.mp3")
            set x = PolarX(GetUnitX(t), - 400, a)
            set y = PolarY(GetUnitY(t), - 400, a)
            call SetUnitXY(u, x, y, 0) 
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 16)
        endif
        if count >= 10 and count <= 30 then
            set x = PolarX(GetUnitX(u), - 5 , GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , - 5 , GetUnitFacing(u))
            call SetUnitXY (u, x, y, 0) 
        endif
        if count >= 30 and count <= 60 then
            if dist >= 140 then
                set x = PolarX(GetUnitX(u), dist / 10, a)
                set y = PolarY(GetUnitY(u), dist / 10, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 60 then
            set x = PolarX(GetUnitX(t), - 200, a) 
            set y = PolarY(GetUnitY(t), - 200, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255) 
        endif
        if count >= 60 and count <= 140 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 140 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5 , 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 155 or count == 195 or count == 235 or count == 275 or count == 315 then
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5 , 1, 255, 255, 255, 255)
        endif
        if count >= 155 and count <= 175 or count >= 195 and count <= 215 or count >= 235 and count <= 255 or count >= 275 and count <= 295 or count >= 315 and count <= 335  then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 365 then
            call SetUnitFlyHeight(u, 400, 0)
            call SetUnitFlyHeight(t, 400, 0)
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 1.5 , 1, 255, 255, 255, 255)
        endif
        if count == 405  or count == 485  or count == 565 or count == 645  then
            call SetUnitAnimationByIndex(u, 4)
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u), a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a  , 45, 0, 6 , 1, 255, 255, 255, 255)
        endif
        if count == 445  or count == 525  or count == 605  or count == 685 then
            call SetUnitAnimationByIndex(u, 4)
            set x = PolarX(GetUnitX(t), - 100, a) 
            set y = PolarY(GetUnitY(t), - 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitAnimationByIndex(u, 1)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), a, 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(u), a, 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), a  , - 45, 0, 6 , 1, 255, 255, 255, 255)
        endif
        if count >= 405 and count <= 425 or count >= 445 and count <= 465 or count >= 485 and count <= 505 or count >= 525 and count <= 545 or count >= 565 and count <= 585  or count >= 605 and count <= 625 or count >= 645 and count <= 665 or count >= 685 and count <= 705 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 735 then
            call SetUnitAnimationByIndex(u, 4)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitXY(u, x, y, 0)
        endif
        if count == 745 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 0, a , 0, 0, 2 , 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(t), GetUnitY(t), 0 , a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count >= 770 and count <= 820 then
            set x = PolarX(GetUnitX(u), - 5 , GetUnitFacing(u))
            set y = PolarY(GetUnitY(u) , - 5 , GetUnitFacing(u))
            call SetUnitXY (u, x, y, 0) 
        endif
        if count >= 820 and count <= 1080 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 3, a)
                set y = PolarY(GetUnitY(t), 3, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 25 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    call Effect("war3mapImported\\BY_Wood_Eff_Ord_DanGe_Wav_Kuosan_1_2_0.25s.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 3, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 1100 then
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\KianaSlash.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), - 45, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\KianaFireLow.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 3, 1, 255, 255, 255, 255)
        endif
        if count >= 1100 and count <= 1150 then
            set x = PolarX(GetUnitX(t), 10, a)
            set y = PolarY(GetUnitY(t), 10, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 1150 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 50, a, 0, 0, 2.5 , 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 1250 then
            call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2 , 1, 255, 255, 255, 255) 
        endif 
        if count == 1300 then
            call SetUnitAnimationByIndex(u, 2)
            call SetUnitTimeScale(u, 0.4)
            set x = PolarX(GetUnitX(u), - 150, a)
            set y = PolarY(GetUnitY(u), - 150, a)
            set x = PolarX(GetUnitX(u), - 50, a)
            set y = PolarY(GetUnitY(u), - 50, a)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call Effect("war3mapImported\\TanahTerbelah.mdx", GetUnitX(t) , GetUnitY(t) , 25, a , 0, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count >= 1300 and count <= 1350 then
            set a = LoadReal(ht, GetHandleId(z), 0)
            set x = PolarX(GetUnitX(u), 25, a)
            set y = PolarY(GetUnitY(u), 25, a)
            call SetUnitXY(u, x, y, 0)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call Effect("war3mapImported\\[A]FireEruption2.mdl", x, y, 100, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
                call Effect("war3mapImported\\[A]az_axe_ef1.mdl", x, y, 100, randomAngle(), 0, 0, 1.3, 1, 255, PercentTo255(80), PercentTo255(50), 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            endif
        endif  
        if count >= 1500 and count <= 1850 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 10 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 1850 then
            call Effect("war3mapImported\\Muramasa1.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 5, 23, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
        endif
        if count >= 2000 and count <= 2900 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 30 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 2, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
            endif
        endif
        if count == 2200 then
            call SoundStart("war3mapImported\\FlameKiana_6-2.mp3")
        endif
        if count == 2275 then
            call SoundStart("war3mapImported\\FlameKiana_6-3.mp3")
        endif
        if count == 2400 then
            call SoundStart("war3mapImported\\FlameKiana_6-4.mp3")
        endif   
        if count == 2650 then
            call SoundStart("war3mapImported\\FlameKiana_6-5.mp3")
        endif
        if count == 2900 then
            call SoundStart("war3mapImported\\FlameKiana_6-6.mp3")
        endif
        if count == 2900 or count == 3150  then
            call SetUnitTimeScale(u, 0.4)
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 15 then 
                    call Effect("war3mapImported\\Flamestrike I.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                    call Effect("war3mapImported\\ApiKecil.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 3, 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                endif
            endif 
        endif
        if count >= 3150 and count <= 3300 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 25, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), 5, a)
                set y = PolarY(GetUnitY(t), 5, a)
                call SetUnitXY(t, x, y, 2)
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator >= 25 then
                    call SaveInteger(ht, zid, 1, 0)
                    call Effect("war3mapImported\\Flamestrike I.mdx", GetUnitX(t), GetUnitY(t), 100, a, 0, 0, 2 , 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.25)
                endif
            endif
        endif
        if count >= 3300 and count <= 3350 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif 
        if count >= 3385 and count <= 3550 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 20 then 
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\EscanorCruelSunExpAfb.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
                call Effect("war3mapImported\\[A]zhendi-fire-dici.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, PercentTo255(70))
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            endif
        endif 
        if count == 3600 then 
            call StartAbilityCooldown(GetUnitAbility(u, 'A0KM'), 80)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 13 * GetHeroAgi(u, true))
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
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer abilId = GetSpellAbilityId()
        local integer pid = GetPlayerId(GetOwningPlayer(u))

        if abilId == 'A0KF' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z) , 0, u)
            call SaveInteger(ht, GetHandleId(z) , 0, 0)
            call SaveInteger(ht, GetHandleId(z) , 1, 0)
            call SaveReal(ht, GetHandleId(z) , 0, a)
            call SaveGroupHandle(ht, GetHandleId(z) , 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif
             
        if abilId == 'A0KG' then
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
           
        if abilId == 'A0KH' then
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
           
        if abilId == 'A0KI' then
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
            call TimerStart(z, 0.02, true, function period4)
        endif
           
        if abilId == 'A0KJ' then
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
           
        if abilId == 'A0KK' then
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
           
        if abilId == 'A0KL' then
            if GetRandomInt(1, 100) <= 20 then
                set z = CreateTimer()
                call SaveUnitHandle(ht, GetHandleId(z), 0, u)
                call SaveInteger(ht, GetHandleId(z), 0, 0)
                call SaveInteger(ht, GetHandleId(z), 1, 0)
                call TimerStart(z, 0.02, true, function period7)
            else
                call SoundStart("war3mapImported\\FlameKiana_7.mp3")
            endif
        endif
           
        if abilId == 'A0KM' then
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