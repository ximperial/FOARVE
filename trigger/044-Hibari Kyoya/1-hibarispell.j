scope hibarispell initializer init
   
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
            call SoundStart("war3mapImported\\Hibari_1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 22)
            call Effect("war3mapImported\\Needle.mdl", GetUnitX(u), GetUnitY(u), 150, a, 0, 0, 3, 0.4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Needle.mdl", GetUnitX(u), GetUnitY(u), 150, a + 20, 0, 0, 3, 0.4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, bj_lastCreatedEffect)
            call Effect("war3mapImported\\Needle.mdl", GetUnitX(u), GetUnitY(u), 150, a - 20, 0, 0, 3, 0.4, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 102, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set x = PolarX(GetEffectX(e), 80, GetSpecialEffectYaw(e))
                set y = PolarY(GetEffectY(e), 80, GetSpecialEffectYaw(e))
                call SetEffectXY(e, x, y, 1)
                call SetSpecialEffectZ(e, 150 + GetAxisZ(x, y))
                call GroupEnumUnitsInRange(gGroup, x, y, 200, null)
                loop
                    set gUnit = GroupForEachUnit(gGroup)
                    exitwhen gUnit == null
                    if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                        call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A04D'))
                        call GroupAddUnit(g, gUnit)
                    endif
                endloop
                call GroupClear(gGroup)
                set i = i + 1
            endloop
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                set i = 0
                loop
                    exitwhen i > 2
                    set e = LoadEffectHandle(ht, zid, 100 + i)
                    call Effect("Abilities\\Spells\\Human\\ThunderClap\\ThunderClapCaster.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\DTPurpleNoRing.mdl", GetEffectX(e), GetEffectY(e), 150, GetSpecialEffectYaw(e), - 90, 0, 1, 1, 255, 255, 255, 255)
                    set i = i + 1
                endloop
            endif
        endif
        if count == 15 then
            set i = 0
            loop
                exitwhen i > 2
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call Effect("war3mapImported\\Asuma-Explosion4.mdl", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set i = i + 1
            endloop
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
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_2.mp3")
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 30 then 
            if dist > 140 then 
                set x = PolarX(GetUnitX(u), dist / 20, a)
                set y = PolarY(GetUnitY(u), dist / 25, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\earthdetonation.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\wind4.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 40 then
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\Purple Aura.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Needle.mdx", GetUnitX(t), GetUnitY(t), 600, randomAngle(), 0, 0, 6, 0.8, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 40 and count <= 60 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 25)
        endif
        if count == 60 then
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
        endif
        if count == 70 then
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\wind3.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
        endif
        if count == 80 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A04C')) * GetHeroAgi(u, true))
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

    private function period3 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local group g = LoadGroupHandle(ht, zid, 1)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x 
        local real y
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 and RectContainsCoords(gg_rct_Boss_Arena, GetUnitX(u) , GetUnitY(u)) then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
            set z = null
            set u = null
            set e = null
            set g = null
            return
        endif
        if count <= 50 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_4.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\hibariboxfuture_new.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 0, 255, 255, 255, PercentTo255(20))
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 50 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.4)
            call SetSpecialEffectZ(e, GetEffectZ(e) + 3)
        endif
        if count == 50 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count >= 50 and count <= 300 + 50 * GetUnitAbilityLevel(u, 'A04E') then
            set e = LoadEffectHandle(ht, zid, 100)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 1000, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) and IsUnitType(gUnit, UNIT_TYPE_HERO) and not IsUnitInvulnerable(gUnit) and not IsUnitInGroup(gUnit, g) then
                    call SaveReal(ht, StringHash("HibariR_MP"), GetHandleId(gUnit), GetUnitState(gUnit, UNIT_STATE_MANA))
                    call SaveReal(ht, StringHash("HibariR_X"), GetHandleId(gUnit), GetUnitX(gUnit))
                    call SaveReal(ht, StringHash("HibariR_Y"), GetHandleId(gUnit), GetUnitY(gUnit))
                    set x = GetRandomReal(GetRectMinX(gg_rct_HibariR), GetRectMaxX(gg_rct_HibariR))
                    set y = GetRandomReal(GetRectMinY(gg_rct_HibariR), GetRectMaxY(gg_rct_HibariR))
                    call SetUnitXY(gUnit, x, y, 1)
                    call PanCameraToTimedForPlayer(GetOwningPlayer(gUnit), GetUnitX(gUnit), GetUnitY(gUnit), 0)
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                if GetUnitLifePercent(gUnit) > 10 then
                    if gUnit != u then
                        call SetUnitLifePercentBJ(gUnit, GetUnitLifePercent(gUnit) - 0.05)
                    else
                        call SetUnitLifePercentBJ(gUnit, GetUnitLifePercent(gUnit) - 0.05)
                    endif
                endif
                call SetUnitState(gUnit, UNIT_STATE_MANA, 0)
                if not RectContainsCoords(gg_rct_HibariR, GetUnitX(gUnit), GetUnitY(gUnit)) and Distance(GetUnitX(gUnit), GetUnitY(gUnit), GetRectCenterX(gg_rct_HibariR), GetRectCenterY(gg_rct_HibariR)) <= 2000 then
                    call SetUnitBoundXY(gUnit, gg_rct_HibariR, false)
                endif
            endloop
        endif
        if count >= 50 and not RectContainsCoords(gg_rct_HibariR, GetUnitX(u) , GetUnitY(u)) then
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                call SetUnitState(gUnit, UNIT_STATE_MANA, LoadReal(ht, StringHash("HibariR_MP"), GetHandleId(gUnit)))
            endloop
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call DestroyGroup(g)
            call FlushChildHashtable(ht, StringHash("HibariR_MP"))
            call FlushChildHashtable(ht, StringHash("HibariR_X"))
            call FlushChildHashtable(ht, StringHash("HibariR_Y"))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
            set z = null
            set u = null
            set e = null
            set g = null
            return
        endif
        if count == 300 + 50 * GetUnitAbilityLevel(u, 'A04E') or (count >= 50 and not IsUnitAlive(u)) then
            loop
                set gUnit = GroupForEachUnit(g)
                exitwhen gUnit == null
                if IsUnitAlive(gUnit) then
                    set x = LoadReal(ht, StringHash("HibariR_X"), GetHandleId(gUnit))
                    set y = LoadReal(ht, StringHash("HibariR_Y"), GetHandleId(gUnit))
                    call SetUnitXY(gUnit, x, y, 0)
                    call PanCameraToTimedForPlayer(GetOwningPlayer(gUnit), GetUnitX(gUnit), GetUnitY(gUnit), 0)
                    call SetUnitState(gUnit, UNIT_STATE_MANA, LoadReal(ht, StringHash("HibariR_MP"), GetHandleId(gUnit)))
                endif
            endloop
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call DestroyGroup(g)
            call RemoveUnit(LoadUnitHandle(ht, zid, 3))
            call FlushChildHashtable(ht, StringHash("HibariR_MP"))
            call FlushChildHashtable(ht, StringHash("HibariR_X"))
            call FlushChildHashtable(ht, StringHash("HibariR_Y"))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
            set z = null
            set u = null
            set e = null
            set g = null
            return
        endif
        
        set z = null
        set u = null
        set g = null
        set e = null
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
        local real h
        local effect e
        local integer i

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_5.mp3")
            call SetUnitAnimationByIndex(u, 4)
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 10 then
            call Effect("war3mapImported\\a_new_k3.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dash sfx.mdx", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count <= 25 then 
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
        if count == 25 then
            call SetUnitAnimationByIndex(u, 2)
            call Effect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdx", GetUnitX(t), GetUnitY(t), 50, a, - 90, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Needle.mdx", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 1, 2.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 25 and count <= 50 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
            call SetUnitXY(t, x, y, 2)
            call SetEffectXY(e, x, y, 0)
            call SetSpecialEffectScale(e, GetSpecialEffectScale(e) + 0.25)
            call SetSpecialEffectZ(e, h + 5)
        endif
        if count >= 50 and count <= 80 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1, 2), 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, GetRandomReal(1.5, 3), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count == 80 then
            call Effect("war3mapImported\\Black.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, PercentTo255(60))
            call TimeScaleEffect(bj_lastCreatedEffect, 0, 0.4)
            set i = 0
            loop
                exitwhen i > 4
                call Effect("war3mapImported\\Needle.mdx", GetUnitX(t), GetUnitY(t), 100, i * 72, 0, 0, 4, 1.4, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid, 101 + i, bj_lastCreatedEffect)
                set i = i + 1
            endloop
        endif
        if count >= 80 and count <= 110 then
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 2 then
                call SaveInteger(ht, zid, 1, 0)
                set i = 0
                loop
                    exitwhen i > 4
                    set e = LoadEffectHandle(ht, zid, 101 + i)
                    set x = PolarX(GetEffectX(e), 70, GetSpecialEffectYaw(e))
                    set y = PolarY(GetEffectY(e), 70, GetSpecialEffectYaw(e))
                    call SetEffectXY(e, x, y, 0)
                    call SetSpecialEffectZ(e, 100 + GetAxisZ(GetEffectX(e), GetEffectY(e)))
                    call SetSpecialEffectYaw(e, GetSpecialEffectYaw(e) + 14.4)
                    set i = i + 1
                endloop
            endif
        endif
        if count >= 110 and count <= 130 then
            set i = 0
            loop
                exitwhen i > 4
                set e = LoadEffectHandle(ht, zid, 101 + i)
                set a = Angle(GetEffectX(e), GetEffectY(e), GetUnitX(t), GetUnitY(t))
                set x = PolarX(GetEffectX(e), 40, a)
                set y = PolarY(GetEffectY(e), 40, a)
                set h = GetEffectZ(e) - GetAxisZ(x, y) + GetAxisZ(x + 0.01, y)
                call SetEffectXY(e, x, y, 0)
                if count > 120 then
                    call SetSpecialEffectZ(e, h - 30)
                else
                    call SetSpecialEffectZ(e, h + 30)
                endif
                set i = i + 1
            endloop
        endif
        if count == 130 then
            call Effect("war3mapImported\\Asuma-Explosion.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\SuperBigExplosion.mdx", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 3.5, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            call Effect("war3mapImported\\XZDL2.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.8, 1.5, 255, 255, 255, 255)
        endif
        if count == 140 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_6.mp3")
            call SetUnitAnimationByIndex(u, 7)
            call SetUnitTimeScale(u, 2)
            call Effect("war3mapImported\\BlackBlink.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl", u, "hand left"))
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("Abilities\\Weapons\\SludgeMissile\\SludgeMissile.mdl", u, "hand right"))
        endif
        if count == 10 then
            set a = randomAngle()
            set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), a)
            set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, GetRandomInt(2, 3))
            call Effect("war3mapImported\\RedSlash2a.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 3, 1, 255, 51, 255, 255)
        endif
        if count >= 10 and count <= 140 then 
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator == 5 or iterator == 10 then
                set a = randomAngle()
                set x = PolarX(GetUnitX(t), GetRandomReal(- 200, 200), a)
                set y = PolarY(GetUnitY(t), GetRandomReal(- 200, 200), a)
                call SetUnitXY(u, x, y, 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimationByIndex(u, GetRandomInt(2, 3))
                call Effect("war3mapImported\\RedSlash2a.mdx", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 3, 1, 255, 51, 255, 255)
                if iterator == 10 then
                    call SaveInteger(ht, zid, 1, 0)
                    set a = randomAngle()
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), a)
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), a)
                    call Effect("war3mapImported\\az_slb.mdx", x, y, 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\az_magina[2]_b.mdx", x, y, 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 150 then
            call SetUnitAnimationByIndex(u, 1)
        endif
        if count == 160 then
            call SetUnitAnimationByIndex(u, 3)
            call Effect("war3mapImported\\slam09.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\violet spark by deckai.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\az_slb.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdx", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 170 then 
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 11 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call DestroyEffect(LoadEffectHandle(ht, zid, 101))
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
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
    
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_7.mp3")
            call DisableAbilityEx(u, 'A04P', true)
            call UnitAddAbility(u, 'A03Y')
            call UnitMakeAbilityPermanent(u, true, 'A03Y')
        endif
        if count > 1 and GetUnitAbilityLevel(u, 'B00R') == 0 or not IsUnitAlive(u) then
            call EnableAbilityEx(u, 'A04P', true)
            call UnitRemoveAbility(u, 'A03Y')
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period7 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x
        local real y
        local effect e
    
        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 10 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Hibari_7-1.mp3")
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call Effect("war3mapImported\\ChainElement2.mdx", GetUnitX(u), GetUnitY(u), 50, 90, 0, 0, 3.5, 1.6, 255, 255, 255, 255)
            call Effect("war3mapImported\\ChainElement2.mdx", GetUnitX(u), GetUnitY(u), 50, 0, 0, 0, 3.5, 1.6, 255, 255, 255, 255)
            call Effect("war3mapImported\\HibariKyoya.mdx", GetUnitX(u), GetUnitY(u), 0, GetUnitFacing(u), 0, 0, 1, 1.6, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 11)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count == 10 then
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
        endif
        if count <= 70 then
            set e = LoadEffectHandle(ht, zid, 100)
            call GroupEnumUnitsInRange(gGroup, GetEffectX(e), GetEffectY(e), 800, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, 8 * GetHeroAgi(u, true) / 70)
                    if count >= 10 then
                        call IssueImmediateOrderById(gUnit, 851972)
                    endif
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(0.65, 1.25), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(1.5, 2.45), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(2.25, 3.5), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
                call Effect("war3mapImported\\DustWaveAnimate2.mdx", GetEffectX(e), GetEffectY(e), 0, randomAngle(), 0, 0, GetRandomReal(2.65, 4), 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimation(bj_lastCreatedEffect, "stand")
            endif
        endif
        if count == 70 then
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
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

        if abilId == 'A04D' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A04C' then
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

        if abilId == 'A04E' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period3)
        endif

        if abilId == 'A04J' then
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

        if abilId == 'A04K' then
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

        if abilId == 'A04P' then
            set z = CreateTimer()
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period6)
        endif

        if abilId == 'A03Y' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
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