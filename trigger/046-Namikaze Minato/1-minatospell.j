scope minatospell initializer init

    private function period1 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real a = LoadReal(ht, zid, 0)
        local real x
        local real y
        local group g = LoadGroupHandle(ht, zid, 1)
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        if count <= 15 then
            call PauseUnit(u, true)
        endif
        if count == 1 then
            call SoundStart("war3mapImported\\Minato_1.mp3")
            call ShakeCamera(0.5, GetOwningPlayer(u), 5)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            if GetUnitTypeId(u) == 'H01M' then
                call SetUnitAnimationByIndex(u, 13)
            else
                call SetUnitAnimationByIndex(u, 2)
            endif
            call SetUnitTimeScale(u, 1.5)
            call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(u), GetUnitY(u), 100, a, - 270, 0, 1.5, 0, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count <= 15 then
            set e = LoadEffectHandle(ht, zid, 100)
            set x = PolarX(GetEffectX(e), 1300 / 15, a)
            set y = PolarY(GetEffectY(e), 1300 / 15, a)
            call SetEffectXY(e, x, y, 1)
            call GroupEnumUnitsInRange(gGroup, x, y, 300, null)
            loop 
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then 
                    call Effect("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", GetUnitX(gUnit), GetUnitY(gUnit), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
                    call DamageUnit(u, gUnit, 100 * GetUnitAbilityLevel(u, 'A00Q'))
                    call GroupAddUnit(g, gUnit)
                endif 
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 3 then
                call SaveInteger(ht, zid, 1, 0)
                call Effect("war3mapImported\\BY_Wood_Effect_Naruto_MingRen_WeiShouYu_2.mdl", x, y, 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 15 then
            call ShowAbilityEx(u, 'A00Q', false)
            call UnitAddAbility(u, 'A00V')
            call UnitMakeAbilityPermanent(u, true, 'A00V')
            call SetUnitAbilityLevel(u, 'A00V', GetUnitAbilityLevel(u, 'A00Q'))
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call IssueImmediateOrderById(u, 851972)
            call GroupClear(g)
        endif
        if count >= 15 and count < 165 and HaveSavedBoolean(ht, StringHash("MinatoQ"), GetHandleId(u)) then
            if GetUnitTypeId(u) == 'H01M' then
                set count = 170
                call SaveInteger(ht, zid, 0, count)
                call RemoveSavedBoolean(ht, StringHash("MinatoQ"), GetHandleId(u))
                call SoundStart("war3mapImported\\Minato_6.mp3")
                call ShakeCamera(1, GetOwningPlayer(u), 5)
                call PauseUnit(u, true)
                call SetUnitInvulnerable(u, true)
                call SetUnitAnimationByIndex(u, 19)
                call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set e = LoadEffectHandle(ht, zid, 100)
                call SetUnitXY(u, GetEffectX(e), GetEffectY(e), 1)
                call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
            else
                call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                set e = LoadEffectHandle(ht, zid, 100)
                call SetUnitXY(u, GetEffectX(e), GetEffectY(e), 1)
                call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
                call ShowAbilityEx(u, 'A00Q', true)
                call UnitRemoveAbility(u, 'A00V')
                call RemoveSavedBoolean(ht, StringHash("MinatoQ"), GetHandleId(u))
                call DestroyGroup(g)
                call FlushChildHashtable(ht, zid)
                call PauseTimer(z)
                call DestroyTimer(z)
            endif
        endif
        if count == 165 and not HaveSavedBoolean(ht, StringHash("MinatoQ"), GetHandleId(u)) then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
            call DestroyEffect(e)
            call ShowAbilityEx(u, 'A00Q', true)
            call UnitRemoveAbility(u, 'A00V')
            call DestroyGroup(g)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        if count >= 170 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
        endif
        if count == 185 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call Effect("war3mapImported\\DT.mdl", GetUnitX(u), GetUnitY(u), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(u), GetUnitY(u), 200, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 195 then
            call GroupEnumUnitsInRange(gGroup, GetUnitX(u), GetUnitY(u), 400, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) and not IsUnitInGroup(gUnit, g) then
                    call DamageUnit(u, gUnit, (1.5 + 0.5 * GetUnitAbilityLevel(u, 'A00V')) * GetHeroAgi(u, true)) 
                    call GroupAddUnit(g, gUnit)
                endif
            endloop
            call GroupClear(gGroup)
        endif
        if count == 200 then
            call ShowAbilityEx(u, 'A00Q', true)
            call UnitRemoveAbility(u, 'A00V')
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SetUnitAnimationByIndex(u, 5)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", u, "hand right")) 
        endif
        if count >= 10 and count <= 30 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 30 then
            call SoundStart("war3mapImported\\Minato_2.mp3")
            set x = PolarX(GetUnitX(t), 120, a)
            set y = PolarY(GetUnitY(t), 120, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
        endif
        if count == 35 then
            call ShakeCamera(1, GetOwningPlayer(u), 10)
            call ShakeCamera(1, GetOwningPlayer(t), 10)
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 90, 0, 1, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.85)
        endif
        if count == 40 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (1 + GetUnitAbilityLevel(u, 'A03K')) * GetHeroAgi(u, true))
            call knockbackUnit(t, 600, a, 0.6)
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
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
        local real dist = Distance(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
        local real x
        local real y 

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        call PauseUnit(t, true)
        call SetUnitInvulnerable(t, true)
        if count == 1 then
            call SoundStart("war3mapImported\\Minato_6-1.mp3")
            call SetUnitAnimationByIndex(u, 13)
        endif
        if count == 10 or count == 115 then
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        endif
        if count == 20 or count == 35 or count == 50 or count == 65 or count == 80 or count == 95 then 
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, randomAngle())
            set y = PolarY(GetUnitY(t), 200, randomAngle())
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        endif
        if count == 120 then
            call Effect("war3mapImported\\[A]bloodex.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
        endif
        if count == 125 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (2 + GetUnitAbilityLevel(u, 'A03K')) * GetHeroAgi(u, true))
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

    private function period4 takes nothing returns nothing
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
            call SoundStart( "war3mapImported\\Minato_3.mp3" )
            if GetUnitTypeId(u) != 'H01M' then
                call MorphUnit(u, 'H01M')
            endif
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapimported\\yonda-aura.mdx", u, "origin"))
            call ShowAbilityEx(u, 'A00Y', false)
            call UnitAddAbility(u, 'A0GU')
            call UnitMakeAbilityPermanent(u, true, 'A0GU')
            call SetUnitAbilityLevel(u, 'A0GU', GetUnitAbilityLevel(u, 'A00Y'))
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\shuozhu2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 0.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 10 then
            call PauseUnit(u, false)
        endif
        if count > 10 and GetUnitAbilityLevel(u, 'B01S') == 0 and IsUnitAlive(u) then
            call MorphUnit(u, 'H01L')
            call ShowAbilityEx(u, 'A00Y', true)
            call UnitRemoveAbility(u, 'A0GU')
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
    endfunction

    private function period5 takes nothing returns nothing
        local timer z = GetExpiredTimer()
        local integer zid = GetHandleId(z)
        local unit u = LoadUnitHandle(ht, zid, 0)
        local integer count = LoadInteger(ht, zid, 0)
        local integer iterator = LoadInteger(ht, zid, 1)
        local real x = LoadReal(ht, zid, 0)
        local real y = LoadReal(ht, zid, 1)
        local real x2
        local real y2
        local real a = Angle(GetUnitX(u), GetUnitY(u), x, y)
        local real dist = Distance(GetUnitX(u), GetUnitY(u), x, y)
        local integer i
        local effect e

        set count = count + 1
        call SaveInteger(ht, zid, 0, count)
        call PauseUnit(u, true)
        call SetUnitInvulnerable(u, true)
        if count == 1 then
            call SoundStart( "war3mapImported\\Minato_3-1.mp3" )
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(u), GetUnitY(u))
            call SetUnitAnimationByIndex(u, 13)
            set i = 0
            loop
                exitwhen i > 25
                set x2 = PolarX(x, GetRandomReal(200, 700), randomAngle())
                set y2 = PolarY(y, GetRandomReal(200, 700), randomAngle())
                set a = Angle(GetUnitX(u), GetUnitY(u), x2, y2)
                set dist = Distance(GetUnitX(u), GetUnitY(u), x2, y2)
                call Effect("war3mapImported\\minato_kunai.mdl", GetUnitX(u), GetUnitY(u), 50, a, - 240, 0, 1, 0, 255, 255, 255, 255)
                call SaveEffectHandle(ht, zid, 100 + i, bj_lastCreatedEffect)
                call SaveReal(ht, zid, 100 + i, a)
                call SaveReal(ht, zid, 200 + i, dist)
                set i = i + 1
            endloop
        endif
        if count <= 20 then
            set i = 0
            loop
                exitwhen i > 25
                set e = LoadEffectHandle(ht, zid, 100 + i)
                set a = LoadReal(ht, zid, 100 + i)
                set dist = LoadReal(ht, zid, 200 + i)
                set x2 = PolarX(GetEffectX(e), dist / 20, a)
                set y2 = PolarY(GetEffectY(e), dist / 20, a)
                call SetEffectXY(e, x2, y2, 1)
                call SetSpecialEffectZ(e, 50 + GetAxisZ(x2, y2))
                set i = i + 1
            endloop
        endif
        if count == 20 then
            call SetUnitTimeScale(u, 2)
            call SaveEffectHandle(ht, zid, 1000, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", u, "origin"))
            call SaveEffectHandle(ht, zid, 1001, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", u, "chest"))
            call SaveEffectHandle(ht, zid, 1002, AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\Rejuvenation\\RejuvenationTarget.mdl", u, "overhead"))
        endif
        if count >= 25 and count <= 175 then
            call GroupEnumUnitsInRange(gGroup, x, y, 700, null)
            loop
                set gUnit = GroupForEachUnit(gGroup)
                exitwhen gUnit == null
                if FilterGeneral(u, gUnit) then
                    call DamageUnit(u, gUnit, ((2 + GetUnitAbilityLevel(u, 'A0GU')) * GetHeroAgi(u, true)) / 150)
                endif
            endloop
            call GroupClear(gGroup)
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 4 then
                call SaveInteger(ht, zid, 1, 0)
                set e = LoadEffectHandle(ht, zid, 100 + LoadInteger(ht, zid, 10))
                call SaveInteger(ht, zid, 10, LoadInteger(ht, zid, 10) + 1)
                call SetUnitXY(u, GetEffectX(e), GetEffectY(e), 0)
                set a = Angle(GetUnitX(u), GetUnitY(u), GetEffectX(e), GetEffectY(e))
                call SetUnitFacingEx(u, a, true)
                call SetUnitAnimation(u, "attack")
                call Effect("war3mapImported\\DTKuning.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\EarthDetonation.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\yonda-slash2.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
                if LoadInteger(ht, zid, 10) >= 25 then
                    call SaveInteger(ht, zid, 10, 0)
                endif
            endif   
        endif
        if count == 180 then
            set i = 0
            loop
                exitwhen i > 25
                set e = LoadEffectHandle(ht, zid, 100 + i)
                call SetSpecialEffectPosition(e, WorldBounds.maxX, WorldBounds.maxY)
                call DestroyEffect(e)
                set i = i + 1
            endloop
            call SetUnitXY(u, x, y, 1)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call SetUnitInvulnerable(u, false)
            call IssueImmediateOrderById(u, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 1000))
            call DestroyEffect(LoadEffectHandle(ht, zid, 1001))
            call DestroyEffect(LoadEffectHandle(ht, zid, 1002))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif
        
        set z = null
        set u = null
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
            call SoundStart("war3mapImported\\Minato_5.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 5)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", u, "hand right")) 
        endif
        if count == 10 then
            call SetUnitAnimationByIndex(u, 6)
        endif
        if count == 15 or count == 25 or count == 35 or count == 50 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.8, 1), 1, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 0.9))
            call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(1, 1.3), 1, 255, 255, 255, 255) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.75, 0.9))
        endif
        if count >= 15 and count <= 40 then
            if dist > 140 then
                set x = PolarX(GetUnitX(u), dist / 15, a)
                set y = PolarY(GetUnitY(u), dist / 15, a)
                call SetUnitXY(u, x, y, 0)
            else
                set x = PolarX(GetUnitX(t), - 120, a)
                set y = PolarY(GetUnitY(t), - 120, a)
                call SetUnitXY(u, x, y, 0)
            endif
        endif
        if count == 40 then
            call SoundStart("war3mapImported\\Minato_2.mp3")
            call SetUnitAnimationByIndex(u, 2)
            call DestroyEffect(LoadEffectHandle(ht, GetHandleId(z), 100))
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1.5, 1, 255, 255, 255, 255) 
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1.3, 1, 255, 255, 255, 255)
        endif
        if count >= 40 and count <= 70 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 70 then
            call SoundStart("war3mapImported\\Minato_5-1.mp3")
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 100, a)
            set y = PolarY(GetUnitY(t), 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            call SetUnitAnimationByIndex(u, 8)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Minato_4.mp3")
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", u, "hand right")) 
            call Effect("war3mapImported\\Almagest.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
        endif
        if count >= 90 and count <= 120 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 20, 0)
        endif
        if count == 120 then
            call SoundStart("war3mapImported\\Minato_5-1.mp3")
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitFlyHeight(t, 0, 0)
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 1.2)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 130 then
            call SoundStart("war3mapImported\\Minato_2.mp3")
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 140 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (6 + 2 * GetUnitAbilityLevel(u, 'A00Z')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
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
            call SoundStart("war3mapImported\\Minato_6-2.mp3")
            call SetUnitAnimationByIndex(u, 13)
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
        endif
        if count == 10 or count == 95 then
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, a)
            set y = PolarY(GetUnitY(t), 200, a)
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        endif
        if count == 20 or count == 35 or count == 50 or count == 65 or count == 80 then 
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 200, randomAngle())
            set y = PolarY(GetUnitY(t), 200, randomAngle())
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
        endif
        if count >= 100 and count <= 130 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 130 then
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 100, a)
            set y = PolarY(GetUnitY(t), 100, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitFlyHeight(u, GetUnitFlyHeight(t), 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 19)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 140 and count <= 160 then
            set x = PolarX(GetUnitX(t), 30, a)
            set y = PolarY(GetUnitY(t), 30, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 30, 0)
        endif
        if count == 160 then
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 170 then
            call SetUnitFlyHeight(u, 0, 600 / 0.4)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, (7 + 2 * GetUnitAbilityLevel(u, 'A00Z')) * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function period8 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Minato_5.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 6)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\kunaimark.mdl", u, "hand right")) 
        endif
        if count == 10 or count == 25 then
            call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count >= 10 and count <= 40 then
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
        if count == 40 then
            call SetUnitAnimationByIndex(u, 2)
            call DestroyEffect(LoadEffectHandle(ht, zid, 100))
            call SaveEffectHandle(ht, zid, 100, AddSpecialEffectTarget("war3mapImported\\kunaimark.mdl", t, "chest"))
        endif
        if count >= 40 and count <= 55 then
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 40, 0)
        endif
        if count == 55 then
            call SoundStart("war3mapImported\\Minato_5-1.mp3")
            call SetUnitAnimationByIndex(u, 10)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitFlyHeight(u, 600, 0)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 101, AddSpecialEffectTarget("war3mapImported\\lxw jhxcom_2000.mdl", u, "hand right"))
        endif
        if count == 60 then
            call SoundStart("war3mapImported\\Minato_5-1.mp3")
            call SetUnitAnimationByIndex(u, 8)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(u), GetUnitY(u), GetUnitFlyHeight(u), randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 80 then
            call SoundStart("war3mapImported\\Minato_5-1.mp3")
            call SetUnitFlyHeight(t, 0, 0)
            call Effect("war3mapImported\\blinknew.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\dtyellownoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 95 then
            call SetUnitAnimationByIndex(u, 8)
        endif
        if count == 115 then
            call SetUnitAnimationByIndex(u, 7)
        endif
        if count >= 95 and count <= 125 then
            call SetUnitFlyHeight(u, GetUnitFlyHeight(u) - 20, 0)
        endif
        if count == 135 then
            call SoundStart("war3mapImported\\Minato_2.mp3")
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 150 then
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 15 * GetHeroAgi(u, true))
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

    private function period9 takes nothing returns nothing
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
        if count <= 510 then
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
        endif
        if GetUnitState(t, UNIT_STATE_LIFE) >= LoadReal(ht, zid, - 1) + 1000 then 
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        elseif GetUnitState(t, UNIT_STATE_LIFE) < LoadReal(ht, zid, - 1) then
            call SaveReal(ht, zid, - 1, GetUnitState(t, UNIT_STATE_LIFE))
        endif
        call SetUnitState(t, UNIT_STATE_LIFE, LoadReal(ht, zid, - 1))
        if count == 1 then
            call SoundStart("war3mapImported\\Minato_5-2.mp3")
            call SoundStart("war3mapImported\\Minato_5-3.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\YellowSL.mdl", GetUnitX(u), GetUnitY(u), 50, a, 0, 0, 1.4, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\Minato2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 10.2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 10 and count <= 420 then
            set x = PolarX(GetUnitX(t), 5, a)
            set y = PolarY(GetUnitY(t), 5, a)
            call SetUnitXY(t, x, y, 2)
            if count >= 90 then
                set iterator = iterator + 1
                call SaveInteger(ht, zid, 1, iterator)
                if iterator == 5 then
                    call SaveInteger(ht, zid, 1, 0) 
                    call Effect("war3mapImported\\wind4.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.75, 1), 1, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.8, 1))
                    call Effect("war3mapImported\\wavejojo.mdl", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, GetRandomReal(0.95, 1.55), 1.5, 255, 255, 255, 255)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, GetRandomReal(0.6, 1))
                    set x = PolarX(GetUnitX(t), GetRandomReal(- 350, 350), randomAngle())
                    set y = PolarY(GetUnitY(t), GetRandomReal(- 350, 350), randomAngle())
                    set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
                    call Effect("war3mapImported\\minato2.mdl", x, y, 0, a, 0, 0, 1, 0.5, 255, 255, 255, 255)
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                    call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                    call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                    call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                    call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
                    set x = PolarX(GetUnitX(t), - 200, a)
                    set y = PolarY(GetUnitY(t), - 200, a)
                    call Effect("war3mapImported\\YellowSL.mdl", x, y, 50, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
                endif
            endif
        endif
        if count == 250 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 8)
            call Effect("war3mapimported\\WindCirclefaster.mdx", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]az_axe_ef1.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\[A]Flame Burst2.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapimported\\ChuShou_BY_Wood_Effect_Fire_Flamecrack.mdx", GetUnitX(u), GetUnitY(u), 0, randomAngle(), 0, 0, 1.5, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 260 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 10)
        endif
        if count == 460 then
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(u), 120, a)
            set y = PolarY(GetUnitY(u), 120, a)
            call SetUnitXY(t, x, y, 0)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count == 470 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 15)
        endif
        if count == 510 then
            call SoundStart("war3mapImported\\Minato_5-4.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 255)
            call SetUnitTimeScale(u, 1)
            call PauseUnit(u, false)
            call PauseUnit(t, false)
            call SetUnitInvulnerable(u, false)
            call SetUnitInvulnerable(t, false)
            call DamageUnit(u, t, 16 * GetHeroAgi(u, true))
            call VisionArea(GetOwningPlayer(u), 1200, 3, GetUnitX(t), GetUnitY(t))
            call IssueTargetOrderById(u, 851983, t)
            call IssueImmediateOrderById(t, 851972)
            call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 0.8, 2.5, 255, 255, 255, 255)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 510 and count <= 540 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
            call SetSpecialEffectZ(e, GetAxisZ(GetUnitX(t), GetUnitY(t)))
        endif
        if count == 540 then
            call SoundStart("war3mapImported\\Minato_5-5.mp3")
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimation(e, "death")
            call SetSpecialEffectTimeScale(e, 0.85)
            call FlushChildHashtable(ht, zid)
            call PauseTimer(z)
            call DestroyTimer(z)
        endif

        set z = null
        set u = null
        set t = null
        set e = null
    endfunction

    private function period10 takes nothing returns nothing
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
            call SoundStart("war3mapImported\\Minato_5.mp3")
            call UnitAddAbility(u, 'Amrf')
            call UnitRemoveAbility(u, 'Amrf')
            call UnitAddAbility(t, 'Amrf')
            call UnitRemoveAbility(t, 'Amrf')
            call SetUnitAnimationByIndex(u, 5)
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
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
            call SoundStart("war3mapImported\\Minato_2.mp3")
            call SetUnitVertexColor(u, 255, 255, 255, 0)
            call Effect("war3mapImported\\Minato2.mdl", GetUnitX(u), GetUnitY(u), 0, a, 0, 0, 1, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 50, a, - 45, 0, 1, 1, 255, 255, 255, 255)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, a, 0, 0, 2, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\AFB_SatomiRentaro_KuDing.mdl", GetUnitX(t), GetUnitY(t), 100, a, - 45, 0, 1, 1, 255, 255, 255, 255)
        endif
        if count >= 25 and count <= 55 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) + 20, 0)
        endif
        if count == 55 then
            call SoundStart("war3mapImported\\Minato_5-2.mp3") 
            call SoundStart("war3mapImported\\Minato_6-3.mp3")
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(u), GetUnitY(u), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\MinatoRSG.mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t) - 400, randomAngle(), 0, 0, 7, 5, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 0)
            call SaveEffectHandle(ht, zid, 100, bj_lastCreatedEffect)
        endif
        if count >= 65 and count <= 265 then
            set x = PolarX(GetUnitX(t), 3, a)
            set y = PolarY(GetUnitY(t), 3, a)
            call SetUnitXY(t, x, y, 2)
            call SetUnitFlyHeight(t, GetUnitFlyHeight(t) - 3, 0)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetEffectXY(e, GetUnitX(t), GetUnitY(t), 0)
            call SetSpecialEffectZ(e, GetUnitFlyHeight(t) - 400 + GetAxisZ(GetUnitX(t), GetUnitY(t)))
            set iterator = iterator + 1
            call SaveInteger(ht, zid, 1, iterator)
            if iterator >= 5 then
                call SaveInteger(ht, zid, 1, 0)
                set x = PolarX(GetUnitX(t), GetRandomReal(- 300, 300), randomAngle())
                set y = PolarY(GetUnitY(t), GetRandomReal(- 300, 300), randomAngle())
                set a = Angle(x, y, GetUnitX(t), GetUnitY(t))
                set h = GetUnitFlyHeight(t) + GetRandomReal(- 200, 200)
                call Effect("war3mapImported\\Minato2.mdl", x, y, h, a, 0, 0, 1, 0.4, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
                call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 1.5)
                call Effect("war3mapImported\\AFB_shanguang5_1.mdl", x, y, h, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
                call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), GetUnitFlyHeight(t), randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
                call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
                set x = PolarX(GetUnitX(t), - 200, a)
                set y = PolarY(GetUnitY(t), - 200, a)
                call Effect("war3mapImported\\YellowSL.mdl", x, y, h, a, 0, 0, 2.5, 1, 255, 255, 255, 255)
            endif
        endif
        if count == 265 then
            call SoundStart("war3mapImported\\Minato_6-4.mp3")
            call SetUnitFlyHeight(t, 0, 0)
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectAnimationByIndex(e, 2) 
            call Effect("war3mapImported\\Minato2.mdl", GetUnitX(t), GetUnitY(t), 600, a, 0, 0, 1, 1.8, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 6) 
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
            call SaveEffectHandle(ht, GetHandleId(z), 100, bj_lastCreatedEffect)
        endif
        if count >= 265 and count <= 305 then
            set e = LoadEffectHandle(ht, zid, 100)
            call SetSpecialEffectZ(e, GetEffectZ(e) - 15)
        endif
        if count == 320 then
            call Effect("war3mapImported\\SBXZAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.6)
            call Effect("war3mapImported\\SZBYAFB2.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 340 then
            call Effect("war3mapImported\\AZ_WSY_Misslie.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 0.75, 2, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, 1)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.8)
        endif
        if count == 350 then
            set x = PolarX(GetUnitX(t), - 120, a)
            set y = PolarY(GetUnitY(t), - 120, a)
            call SetUnitXY(u, x, y, 0)
            call SetUnitVertexColor(u, 255, 255, 255, 255)
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
        set e = null
    endfunction

    private function period11 takes nothing returns nothing
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
        if count == 1 or count == 20 or count == 40 or count == 60 or count == 80 then
            call SoundStart("war3mapImported\\Minato_5-2.mp3")
            call SoundStart("war3mapImported\\KanzakiSE1.mp3")
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            set x = PolarX(GetUnitX(t), 120, randomAngle())
            set y = PolarY(GetUnitY(t), 120, randomAngle())
            call SetUnitXY(u, x, y, 0)
            set a = Angle(GetUnitX(u), GetUnitY(u), GetUnitX(t), GetUnitY(t))
            call SetUnitFacingEx(u, a, true)
            call SetUnitAnimationByIndex(u, 2)
            call Effect("war3mapImported\\StarSlash(yellow).mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
            call SetSpecialEffectAnimationByIndex(bj_lastCreatedEffect, GetRandomInt(0, 3))
            call Effect("war3mapImported\\YellowSL.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1.5, 1, 255, 255, 255, 255)
        endif
        if count == 90 then
            call SoundStart("war3mapImported\\Minato_7.mp3")
        endif
        if count <= 100 then
            set x = PolarX(GetUnitX(t), 20, a)
            set y = PolarY(GetUnitY(t), 20, a)
            call SetUnitXY(t, x, y, 2)
        endif
        if count == 100 then
            call Effect("war3mapImported\\BlinkNew.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\DTYellowNoring.mdl", GetUnitX(t), GetUnitY(t), 50, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call SetUnitXY(u, GetUnitX(t), GetUnitY(t), 0)
            call SetUnitAnimationByIndex(u, 8)
            call SetUnitTimeScale(u, 0.6)
        endif
        if count == 150 then
            call Effect("war3mapImported\\DT.mdl", GetUnitX(t), GetUnitY(t), 100, randomAngle(), 0, 0, 2, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
            call Effect("Objects\\Spawnmodels\\NightElf\\NECancelDeath\\NECancelDeath.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.75)
            call Effect("war3mapImported\\rasenganblast.mdl", GetUnitX(t), GetUnitY(t), 200, randomAngle(), 0, 0, 1, 1, 255, 255, 255, 255)
            call Effect("war3mapImported\\HelGate1.mdl", GetUnitX(t), GetUnitY(t), 0, randomAngle(), 0, 0, 3, 1.5, 255, 255, 255, 255)
            call SetSpecialEffectTimeScale(bj_lastCreatedEffect, 0.9)
        endif
        if count == 160 then
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

        if abilId == 'A00Q' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, a)
            call SaveGroupHandle(ht, GetHandleId(z), 1, CreateGroup())
            call TimerStart(z, 0.02, true, function period1)
        endif

        if abilId == 'A00V' then
            call SaveBoolean(ht, StringHash("MinatoQ"), GetHandleId(u), true)
        endif

        if abilId == 'A03K' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H01M' then
                call TimerStart(z, 0.02, true, function period3)
            else
                call TimerStart(z, 0.02, true, function period2)
            endif
        endif

        if abilId == 'A00Y' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period4)
        endif

        if abilId == 'A0GU' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call SaveReal(ht, GetHandleId(z), 0, x)
            call SaveReal(ht, GetHandleId(z), 1, y)
            call TimerStart(z, 0.02, true, function period5) 
        endif

        if abilId == 'A00Z' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H01M' then
                call TimerStart(z, 0.02, true, function period7)
            else
                call TimerStart(z, 0.02, true, function period6)
            endif
        endif

        if abilId == 'A00W' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            if GetUnitTypeId(u) == 'H01M' then
                call SaveReal(ht, GetHandleId(z), - 1, GetUnitState(t, UNIT_STATE_LIFE))
                call TimerStart(z, 0.02, true, function period9)
            else
                call TimerStart(z, 0.02, true, function period8)
            endif
        endif

        if abilId == 'A010' then
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
            call TimerStart(z, 0.02, true, function period10)
        endif

        if abilId == 'A012' then
            set z = CreateTimer()
            call PauseUnit(u, true)
            call SetUnitInvulnerable(u, true)
            call PauseUnit(t, true)
            call SetUnitInvulnerable(t, true)
            call SaveUnitHandle(ht, GetHandleId(z), 0, u)
            call SaveUnitHandle(ht, GetHandleId(z), 1, t)
            call SaveInteger(ht, GetHandleId(z), 0, 0)
            call SaveInteger(ht, GetHandleId(z), 1, 0)
            call TimerStart(z, 0.02, true, function period11)
        endif

        set z = null
        set u = null
        set t = null
    endfunction

    private function init takes nothing returns nothing
        call RegisterPlayerUnitEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, function action)
    endfunction
endscope